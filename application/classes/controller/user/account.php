<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Account extends Controller_Primary {

    public function action_login() {
        // user already logged in, redirect to dashboard
        if (Auth::instance()->logged_in()) {
            $url = URL::base();
            $this->request->redirect($url);
        }


        // received the POST
        if (isset($_POST) AND Valid::not_empty($_POST)) {
            // validate the login form
            $post = Validation::factory($_POST)
                    ->rule('username', 'not_empty')
                    ->rule('password', 'not_empty')
                    ->rule('password', 'min_length', array(':value', 3));
            $remember = TRUE;

            // if the form is valid and the username and password matches
            if (Auth::instance()->login($post['username'], $post['password'], $remember)) {
                $id = Auth::instance()->get_user()->id;

                $this->request->redirect('user' . $id);
            } else {
                // wrong username or password (but form is valid)
                
                
                $err[] = __('Wrong username or password');

                    Session::instance()->set('errors', $err);
                    
            }
            // validation failed, collect the errors
            $errors = $post->errors('user');
            $this->request->redirect('login');
        }
        // display
        $err = Session::instance()->get_once('errors_auth', array());
        $this->template->title = __('Login');
        $this->template->login_box = View::factory('account/login')
                ->bind('post', $post)
                ->bind('errors', $errors)
                ->bind('loginerrors', $loginerrors)
                ->bind('errors_auth', $err);
    }

    public function action_registration() {
        if (isset($_POST)) {
            
                       $data = Arr::extract($_POST, array('username', 'email', 'password', 'password_confirm'));

            $user = ORM::factory('user');
            try {
                $user->create_user($data, array('username', 'email', 'password', /* 'language', 'created', 'confirm', 'source' */));
                $role = ORM::factory('role')->where('name', '=', 'login')->find();
                $user->add('roles', $role);
                $data['complate'] = TRUE;
            } catch (ORM_Validation_Exception $e) {
                $errors = $e->errors('auth');

                if ($_POST['secret_code'] != 121790) {
                    $errors['code'] = 'Наверный секретный код!';
                }

                Session::instance()->set('errors_auth', $errors);

                $data['complate'] = FALSE;

               
            }
            
             $this->request->redirect('login');
        }
    }

    public function action_logout() {
        Auth::instance()->logout();
        //Request::instance()->redirect('login');
        $this->request->redirect('/');
    }

    public function action_checkusername() {
        if ($this->request->is_ajax()) {
            $this->auto_render = FALSE;

            if (!ORM::factory('user')->unique_key_exists($_POST['username'])) {
                echo json_encode(array('available' => 1));
            } else {
                echo json_encode(array('available' => 0));
            }
        }
    }

    // validation rule: password != username
    static function pwdneusr($validation, $password, $username) {
        if ($validation[$password] === $validation[$username]) {
            $validation->error($password, 'pwdneusr');
        }
    }

    //validation rule: password exist
    static function pwdexist($validation, $email) {
        if (!ORM::factory('user')->unique_key_exists($validation[$email])) {
            $validation->error($email, 'emailexistnot');
        }
    }

    // generate token
    static function generate_token($length = 8) {
        // start with a blank password
        $password = "";
        // define possible characters (does not include l, number relatively likely)
        $possible = "123456789abcdefghjkmnpqrstuvwxyz123456789";
        // add random characters to $password until $length is reached
        for ($i = 0; $i < $length; $i++) {
            // pick a random character from the possible ones
            $char = substr($possible, mt_rand(0, strlen($possible) - 1), 1);
            $password .= $char;
        }
        return $password;
    }

}
