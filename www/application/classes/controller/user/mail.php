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
        $num = $this->request->post('num'); 
              
        if ($section != '') {
            $outbox = 'active';
        } else {
           $inbox = 'active'; 
        }
        
       $MailModel = ORM::factory('mail');
        
        
       $user = Auth::instance()->get_user();
       $privet_ms = '';
     
       $pms = View::factory('user/mail_cell')
                ->bind('ms_data',$privet_ms)
                ->render();
      
       if($this->request->is_ajax()){ 
           sleep(1);
           $res = array();
           $res['count'] = 10;
           $res['num'] = $pms;
         //  echo $num;
            echo json_encode($res);
           exit();
       }
       $mail_inbox = View::factory('user/mail_index')
            ->bind('private_messages', $private_messages)
            ->bind('inbox', $inbox)
            ->bind('privet_ms',$pms)
            ->bind('outbox', $outbox);
            
        $this->template->content = $mail_inbox;
                
    }

}