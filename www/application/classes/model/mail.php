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

        $query = DB::select('mails.id','mails.title','mails.sender_id','mails.recipient_id','mails.sinopsis','mails.content','mails.read','mails.date','user_info.fio')
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
        $saider = 'recipient_id';


        $query = DB::select('pms.id', 'pms.title', 'pms.sender_id', 'pms.recipient_id', 'pms.content', 'pms.date', 'pms.read', 'users.username')
                ->from('pms')
                ->join('users')
                ->on('pms.' . $saider, ' = ', 'user_info.user_id')
                ->where('pms.id', '=', $id)
                ->execute();
        



        if ($query)
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