<?php

defined('SYSPATH') or die('No direct script access.');

     

class Model_Mail extends Model_Base {
    
        
    public function getAllOutInBoxPm($user_id = '', $action = 'inbox') {
        
        if ($action == 'inbox') {
            $saider = 'sender_id';
            $inboxOutbox = 'recipient_id';
            }
            
        if ($action == 'outbox') {
            $saider = 'recipient_id';
            $inboxOutbox = 'sender_id';
        } 
        
        $query = DB::select('*')
                ->from('pms')
                ->join('users')
                ->on('pms.'.$saider, ' = ', 'users.user_id')
                ->where('pms'.$inboxOutbox, '=', $user_id)
                ->execute();
               
             

        if ($query)
           return $query;
 
    }
    
    public function getOnPm($id = '') {
       $saider = 'recipient_id';
        
        
        $query = DB::select('pms.id', 'pms.title', 'pms.sender_id','pms.recipient_id', 'pms.content','pms.date', 'pms.read','users.username')
                ->from('pms')
                ->join('users')
                ->on('pms.'.$saider,' = ', 'user_info.user_id')
                ->where('pms.id', '=', $id)
                ->execute();
               
             

        if ($query)
           return $query;
 
    }
    
     public function add_pm($title = '...',$content = 'Сообщение', $sender_id = '', $recipient_id = '') {
         
       $this->title = ($title == '') ? '...' : $title;
       $this->content = $content;
       $this->sender_id = $sender_id;   
       $this->recipient_id = $recipient_id;
       $this->date = time();
       if ($this->save()){ return true;}
      
    }
}