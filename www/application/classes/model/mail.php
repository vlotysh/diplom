<?php

defined('SYSPATH') or die('No direct script access.');

class Model_Mail extends Model_Base {

    protected $_table_name = 'mails';
    protected $_primary_key = 'id';

    public function getAllOutInBoxPm($user_id = '', $limit,$offset, $action = 'inbox') {

        if ($action == 'inbox') {
            $saider = 'sender_id'; //Параметр получателя при полученных
            $inboxOutbox = 'recipient_id'; //Параметр получателя при отправленых
        }

        if ($action == 'outbox') {
            $saider = 'recipient_id';
            $inboxOutbox = 'sender_id';
        }

        $query = DB::select('mails.id','mails.title','mails.sender_id','mails.recipient_id','mails.sinopsis','mails.content','mails.read','mails.date','user_info.fio','user_info.user_id')
                ->from('mails')
                ->order_by('mails.date', 'DESC')
                ->join('user_info')
                ->on('mails.' . $saider, ' = ', 'user_info.user_id')
                
                ->where('mails.'. $inboxOutbox, '=', $user_id)
                
                ->offset($offset)
                    
                ->limit($limit)
                ->execute()
                ->as_array();
          



        if ($query)
            return $query;
        else return FALSE;
    }

    public function getOnPm($id = '') {
       


        $query = DB::select('*')
                ->from('mails')
                ->where('id', '=', $id)
                ->execute()
                ->as_array();
        



        if ($query)
            
            $query = $query[0];
            return $query;
    }

    public function add_pm($title = '...', $content = 'Сообщение', $sender_id = '', $recipient_id = '') {

        $this->title = ($title == '') ? '...' : $title;
        $this->content = $content;
        $this->sender_id = $sender_id;
        $this->recipient_id = $recipient_id;
        $this->date = time();
        if ($this->save()) {
            return true;
        }
    }

}