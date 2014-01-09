<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Profile extends Controller_Primary {
    
    public function action_index(){
       
        $this->template->title =  'Страничка пользователя';
       /* $fio = 'Лотыш Владислав Николаевич';
        $fio_arr = explode(' ',$fio);
        
        list($familiya, $name, $otchestvo) = $fio_arr;
        echo $familiya;
        exit();*/
    }
    
    public function action_user(){
        
        $id = $this->request->param('id');
        
        $user_page = View::factory('user/index')
                ->bind('massege',$massege)
                ->bind('user_info',$user_info );
        $user_info = Auth::instance()->get_user();       
        $massege = 'Пользователь с id '.$id;
        
  
        
        
        $this->template->title =  $user_info->username;
        $this->template->content = $user_page ;
        
    }
            
    
}