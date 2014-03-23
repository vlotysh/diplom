<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_Admin_Application extends Controller_Admin_Primary {
   
    public function before()
	{
            
		parent::before();
            
                 if (!$this->auth->logged_in()) {
                     
                     $this->request->redirect('login');
                 } else {
                      ORM::factory('user',$this->auth->get_user()->id)->set('last_activity', time())->save();
                 }
		//Объясление моделей
                
                
	}
        
        public function debug($object, $die = 1) {
           echo "<p>Debug start from CONTROLLER <strong>".$this->request->controller()."</strong>, and ACTION <strong>".$this->request->action()."</strong></p>";
        
           echo "<pre>";
            print_r ($object);
            echo "<pre>";
            if($die == 1) {
            exit();
            }
        }
        
        public function after()
	{
          
            
           
                
                
		parent::after();
	}
}