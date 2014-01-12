<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_Application extends Controller_Primary {
    
    
    public function before()
	{
            
		parent::before();
            
                 if (!$this->auth->logged_in()) {
                     
                     $this->request->redirect('login');
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
          /*  if(Auth::instance()->logged_in()) {
             $ms = ORM::factory('pm')->where('read', '=', 0)->and_where('recipient_id', '=', Auth::instance()->get_user()->id)->count_all();
            //$this->debug($ms);
            $this->template->msCount = $ms;
            }
            if ($this->auto_render)
		{
			//$this->template->styles = array_merge( $this->template->styles, $styles );
			//$this->template->scripts = array_merge( $this->template->scripts, $scripts );
		}
                */
                
		parent::after();
	}
}