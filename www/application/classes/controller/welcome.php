<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Welcome extends Controller_Template  {
    
            
    public function action_index()
	{		
        
	}
  
        public function action_language()
	{
		// requested language
		$lang = $this->request->param('lg');
                
               if( ! isset($lang) OR empty($lang)) 
               {
			$this->request->redirect('welcome');
	       }
		
		if( ! in_array($lang, Kohana::$config->load('ko32example.language'))) 
                {
			$lang = 'ru';
		}
		
                $this->template->langg =$lang;
                $this->template->lang_class_link_menu = 'active';
		Cookie::set('lang', $lang);
		I18n::lang($lang);
                $this->request->redirect(Session::instance()->get('controller'));
                
	}

} // End Welcome