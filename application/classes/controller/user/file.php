<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_File extends Controller_Application {
    
    public function before() {
        parent::before();
        
         $this->template->title = __('File');
        $this->template->file_class_link_menu = 'active';
    }
    
    public function action_view() {
        
       $content = View::factory('files/index')->set(array(
            // files list
            'files' => ORM::factory('File')->find_all(),
            'captcha' => Captcha::instance(),
            // errors from user session
            'errors' => Session::instance()->get_once('errors', array()),
 
            // message from user session
            'message' => Session::instance()->get_once('message'),
        ));
       $this->template->content = $content;
       $path = DOCROOT.'uploads/1.txt';
      $this->response->send_file($path);

    } 
    
     /**
     * Upload file action
     */
    public function action_upload()
    {
        // check request method
        if ($this->request->method() === Request::POST)
        {
            $file = ORM::factory('File')->values(Arr::merge($_FILES, $this->request->post()));
 
            // try upload and save file and file info
            try
            {
                // save
                $file->save();
 
                // set user message
                Session::instance()->set('message', 'File is successfully uploaded');
            }
            catch (ORM_Validation_Exception  $e)
            {
                // prepare errors
                $errors = $e->errors('upload');
                $errors = Arr::merge($errors, Arr::get($errors, '_external', array()));
 
                // remove external errors
                unset($errors['_external']);
 
                // set user errors
                Session::instance()->set('errors', $errors);
            }
        }
 
        // redirect to home page
        $this->template->content = 'Файл загружен';
    }
    

}