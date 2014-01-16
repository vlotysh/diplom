<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_Primary extends Controller_Template {
    
    private $user_auth;
    
    public function before() {

        parent::before();
        
        $this->auth = Auth::instance();
        

        if ($this->auto_render) {
            // keep the last url if it's not home/language
            if (Request::current()->action() != 'language') {
                Session::instance()->set('controller', Request::current()->uri());
            }

            if (Auth::instance()->logged_in('participant')) {
                $this->template->loged = TRUE;
            }

            if (Auth::instance()->logged_in('admin')) {
                $this->template->loged = TRUE;
            }
        }

        View::set_global('site_name', __('Site Beta'));
        //Модели 
     /*   $this->massege_model = ORM::factory('message');
        $this->pm = ORM::factory('pm');*/
         $this->MailModel = ORM::factory('mail');
        
     
        $this->template->auth = Auth::instance();
        $this->template->lang = I18n::lang();
        $this->template->content = '';
        $this->template->description = '';
        $this->template->title = '';
        $this->template->site_name = 'Диплом';
        $this->template->profile_class_link_menu = '';
        $this->template->admin_class_link_menu = '';
        $this->template->message_class_link_menu = '';
        $this->template->mail_class_link_menu = '';
        $this->template->author = 'I am';
        $this->template->langg = '';
        $this->template->lang_class_link_menu = '';
        $this->template->page_name = NULL;
        $this->template->msCount = 0;

        $this->template->styles = array(
            'bootstrap.min',
            'bootstrap-responsive.min',
            'style'
        );

        $this->template->scripts = array(
            'jquery',
            'bootstrap.min',
            'jquery.alphanumeric.min',
            'jquery.password.sm.min',
            'main',
            'prefixfree.min',
                //'less-1.2.1.min'
        );
        
        
        //Cлужебные данные 
        
        $this->template->сarentController = $this->request->controller();
        $this->template->сarentAction = $this->request->action();
    }

}

