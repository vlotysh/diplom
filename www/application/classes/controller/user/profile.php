<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Profile extends Controller_Application {
    
    public function before() {
        parent::before();
       
        $this->template->profile_class_link_menu = 'active';
    }


    public function action_index(){
       
        
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
        
        $user_page = View::factory('user/user')
                ->bind('massege',$massege)
                ->bind('user_info',$user_info );
        
        $user_info = $this->auth->get_user();       
        $massege = 'Пользователь с id '.$id;
       
        
        
        
        
        
        $this->template->title =  $user_info->username;
        $this->template->content = $user_page ;
        
    }
            
    
}