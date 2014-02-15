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
        $path = DOCROOT . 'uploads/1.txt';
        // $this->response->send_file($path);
    }

    /**
     * Upload file action
     */
    public function action_upload() {

        // check request method
        if ($this->request->method() === Request::POST) {

           
         
            foreach ($_FILES['file']['name'] as $k => $f) {
                
                try
        {
                   
              
                
                $parts = explode('.', HTML::cyr2lat($_FILES['file']['name'][$k]));
                
                if(count($parts) == 1)  continue;

                $newName = $parts[0] . substr(md5(uniqid(rand())), 0, 4).'_'.substr(md5(uniqid(rand())), 0,4) . '.' . $parts[1];
                ;
                $fileIN['file']['name'] = $newName;
                $fileIN['file']['type'] = $_FILES['file']['type'][$k];
                $fileIN['file']['tmp_name'] = $_FILES['file']['tmp_name'][$k];
                $fileIN['file']['error'] = $_FILES['file']['error'][$k];
                $fileIN['file']['size'] = $_FILES['file']['size'][$k];

                $file = ORM::factory('File')->values($fileIN);

                // try upload and save file and file info
                // save
                $file->save();

                // set user message
                Session::instance()->set('message', 'Файл '.$_FILES['file']['name'][$k].' успешно загружен');
        }
        catch (ORM_Validation_Exception $e)
        {
              // prepare errors
             
              $errors = $e->errors('upload');
              /*    $errors = Arr::merge($errors, Arr::get($errors, '_external', array()));
 
                // remove external errors
                unset($errors['_external']);
 
                // set user errors
                Session::instance()->set('errors', $errors); */
            
            
           $err[] = 'Неверный файл '. $_FILES['file']['name'][$k];
          
            Session::instance()->set('errors', $err);
            continue;
            //$errors = $e->errors('models');
        }
            }
        }

        // redirect to home page
        $this->request->redirect('file');
        
    }
    }

