<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_Primary extends Controller_Template {

    private $user_auth;

    public function before() {

        parent::before();

        $this->auth = Auth::instance();
               
        //last_activity функция, для проверки на онлайн

        if ($this->auto_render) {
            // keep the last url if it's not home/language
            if (Request::current()->action() != 'language' && Request::current()->action() != 'online') {
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
          $this->pm = ORM::factory('pm'); */
        $this->MailModel = ORM::factory('mail');

        $this->template->auth = Auth::instance();
        $this->template->activate = NUll;
        $this->template->lang = I18n::lang();
        $this->template->content = '';
        $this->template->description = '';
        $this->template->title = '';
        $this->template->site_name = 'Диплом';
        $this->template->profile_class_link_menu = '';
        $this->template->file_class_link_menu = '';
        $this->template->message_class_link_menu = '';
        $this->template->mail_class_link_menu = '';
        $this->template->userlist_link_menu = '';
        $this->template->author = 'I am';
        $this->template->langg = '';
        $this->template->lang_class_link_menu = '';
        $this->template->page_name = NULL;
        $this->template->msCount = 0;
        $this->template->version = 0.3;

        /*
          $this->template->errors = Session::instance()->get_once('errors', array());
          $this->template->message = Session::instance()->get_once('message', array());
         */
        //Роуты для картинок и тд
        $this->template->srcImage = URL::base() . 'media/images/';
        $this->template->srcStyle = URL::base() . 'media/css/';
        $this->template->srcScript = URL::base() . 'media/js/';

        /*
         * Eror or massege 
         *          */

        $this->template->errors = Session::instance()->get_once('errors', array());
        $this->template->errors_auth = Session::instance()->get_once('errors_auth', array());
        $this->template->message = Session::instance()->get_once('message', array());

        $this->template->styles = array(
            /* 'bootstrap.min.css',
              'bootstrap-responsive.min.css', */
            'dashboard.css',
            'bootstrap-responsive.min.css',
            'styles.less',
            'iconFont.min.css',
            'metro-bootstrap.min.css',
            'metro-bootstrap-responsive.min.css',
            'style.css',
        );

        $this->template->scripts = array(
            'jquery.min',
            /* 'jquery', */
            'main',
            'prefixfree.min',
            'jquery.mousewheel',
            'jquery.widget.min',
            'device.min',
            'metro.min',
        );


        //Cлужебные данные 

        $this->template->сarentController = $this->request->controller();
        $this->template->сarentAction = $this->request->action();
    }

}
