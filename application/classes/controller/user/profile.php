<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Profile extends Controller_Application {
    
    public function before() {
        parent::before();
       
       
    }

    
    public function action_index(){
        
        $this->template->profile_class_link_menu = 'active';
        
        $this->template->title =  'Страничка пользователя';
        $this->template->content = Auth::instance()->get_user()->id;
        $id = Auth::instance()->get_user()->id;
//       / $info = ORM::factory('base')->getUsersById(13);
    
//        echo View::factory('profiler/stats');
        /*
        $fio = 'Лотыш Владислав Николаевич';
         * 
        $fio_arr = explode(' ',$fio);
        
        list($familiya, $name, $otchestvo) = $fio_arr;
        echo $familiya;
        exit();*/
    }
    
    public function action_user(){
      
        $id = $this->request->param('id');
        
      
      
       
         # $arrayyy = array('fio' => 'Лотыш Владислав Николаевич','age' =>'25',);
         #  $new = json_encode($arrayyy);
         #  $info = ORM::factory('base')->UpdateUserById(13,$new);
         #   $info1 = ORM::factory('base')->getUserById(13);
        
        
        
      # $info1['info'] = json_decode($info1['info']);
       

     
        
        if( $this->auth->get_user()->id == $id ) {
            $url = URL::base().'/profile';
            $this->request->redirect($url);
        }
        
        $id_carent = $this->auth->get_user()->id;
        $massege_form = View::factory('user/mail_form')
                ->bind('recipient_id',$id)
                ->bind('sender_id',$id_carent)
                ->render();

     
        $user_page = View::factory('user/user')
                ->bind('massege',$massege)
                ->bind('user_info',$user_info )
                ->bind('massege_form',$massege_form)
                ->bind('online',$online);
        
        $user_info = ORM::factory('user',$id);
       // echo time() - $user_info->last_activity; exit();
      
        $online = ((time() - $user_info->last_activity) <= 180) ? TRUE : FALSE;
        
        $massege = 'Пользователь с id '.$id;
       
        
        
        
        
        
        $this->template->title =  $user_info->username;
        $this->template->content = $user_page ;
        
    }
          //Обновления статус онлайн
    public function action_online() {
   
        if($this->request->is_ajax()){
            if($this->auth->get_user()) {
                $result = ORM::factory('user',$this->auth->get_user()->id)->set('last_activity', time())->save();
                if($result) $res['status'] = 1;
                else $res['status'] = 0;
                
                echo json_encode($res);
                exit();
                
            }
            
        }
    }
    
}