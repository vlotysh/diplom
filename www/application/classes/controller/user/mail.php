<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Mail extends Controller_Application {
    
     public function before() {
        parent::before();
        
         $this->template->title = __('Mail');
        $this->template->mail_class_link_menu = 'active';
    }
    
    public function action_index() {
        $section = $this->request->query('section');
        
        if ($section != '') {
            $outbox = 'active';
        } else {
           $inbox = 'active'; 
        }
        
        
        $user = Auth::instance()->get_user();
       
        
        $mail_inbox = View::factory('user/mail_index')
            ->bind('private_messages', $private_messages)
            ->bind('inbox', $inbox)
            ->bind('outbox', $outbox);
            
        $this->template->content = $mail_inbox;
                
    }

}