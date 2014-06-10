<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_File extends Controller_Application {

    public function before() {
        parent::before();
        $this->template->title = __('File');
        $this->template->file_class_link_menu = 'active';
        
        $user = ORM::factory('user');

    }

    public function action_view() {

        $content = View::factory('files/index')->set(array(
            // files list
            'files' => ORM::factory('File')->where('user_id','=',$this->auth->get_user()->id)->order_by('id','DESC')->find_all(),
            'captcha' => Captcha::instance(),
            // errors from user session
            
           
            'errors' => Session::instance()->get_once('errors', array()),
            // message from user session
            'message' => Session::instance()->get_once('message', array()),
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

                try {
                   $parts = explode('.', HTML::cyr2lat($_FILES['file']['name'][$k]));

                    if (count($parts) == 1)
                        continue;

                    $newName = $parts[0] . substr(md5(uniqid(rand())), 0, 4) . '_' . substr(md5(uniqid(rand())), 0, 4) . '.' . $parts[1];
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
                    $message[] = 'Файл ' . $_FILES['file']['name'][$k].' успешно загружен!';
                    Session::instance()->set('message', $message);
                    
                } catch (ORM_Validation_Exception $e) {
                    // prepare errors
                    $errors = $e->errors('upload');
                    /*    $errors = Arr::merge($errors, Arr::get($errors, '_external', array()));
                      // remove external errors
                      unset($errors['_external']);

                      // set user errors
                      Session::instance()->set('errors', $errors); */
                    $err[] = 'Неверный файл ' . $_FILES['file']['name'][$k].' !';

                    Session::instance()->set('errors', $err);
                    continue;
                    //$errors = $e->errors('models');
                }
            }
        }
        // redirect to home page
        $this->request->redirect('file');
    }

    public function action_delete() {
        
        $id = $this->request->param('id');
       
        
        
        $file = ORM::factory('file',$id);
        if(Auth::instance()->get_user()->id == $file->user_id) {
             #$this->template->content = 'Мой файл';
             
            
            
            if(unlink(DOCROOT.$file->src)) {
                $file->delete();
                $this->request->redirect('file');
            }
        } else {
            $this->request->redirect('file');
        }
        ##Auth::instance()->get_user()->id;
    }
    
     public function action_download() {
         $id = $this->request->param('id');
         $file = ORM::factory('file',$id);
   
     $src = $file->src;

    // $this->$request->send_file('uploads/201404/example9bd3_a190.zip');
     Response::factory()->send_file($src);
         
     }
}
