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
        $num = 0;
      
        $user = Auth::instance()->get_user()->id;
        if ($section != '') {
            $outbox = 'active';
            $type = 'outbox';
        } else {
           $inbox = 'active'; 
            $type = 'inbox';
        }
        
          if($this->request->is_ajax()){ 
            
        $num = $this->request->post('num'); 
        $type = $this->request->post('type'); 
        
        }
        
        
       $MailModel = ORM::factory('mail');
       
      
       $user = Auth::instance()->get_user();
       
       
       //Инициализация параметров динамической загрузки
       
       $limit = 3;
       $offset = $num;
     
       $ms_data =  $MailModel->getAllOutInBoxPm($user->id,$limit,$offset,$type);

       $flag  = count($ms_data) < $limit ? 0 : 1; //Если записей меньше чем показывает выборка 
       //то тогда не показывать кнопку "Загрузить еще"
          if ($ms_data != '')  {
       $pms = View::factory('user/mail_cell')
                ->bind('ms_data',$ms_data)
                ->render();
          }
       if($this->request->is_ajax()){ 
                    $res = array();
              
          if ($ms_data == '')  {
        
               $res['status'] = 0;  
               json_encode($res);
              exit();
          }
           sleep(1);
        
           $res['count'] = count($ms_data);
           $res['num'] = $pms;
           $res['status'] = 1;
           $res['flag'] = $flag;
         //  echo $num;
            echo json_encode($res);
            exit();
       }
       $mail_inbox = View::factory('user/mail_index')
            ->bind('private_messages', $private_messages)
            ->bind('inbox', $inbox)
            ->bind('privet_ms',$pms)
            ->bind('outbox', $outbox)
            ->bind('type',$type)
            ->bind('offset',$limit)  
            ->bind('flag', $flag);
          
        $this->template->content = $mail_inbox;
                
    }

}