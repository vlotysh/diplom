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
        $this->template->title = __('Login');
        $this->template->login_box = View::factory('account/login')
                ->bind('post', $post)
                ->bind('errors', $errors)
                ->bind('loginerrors', $loginerrors);
    }

    public function action_registration() {
        if (Auth::instance()->logged_in()) {
            $url = URL::base();
            $this->request->redirect($url);
        }

        if (isset($_POST) AND Valid::not_empty($_POST)) {

            $data = Arr::extract($_POST, array('username', 'email', 'password', 'password_confirm'));
            $data['password'] = Auth::instance()->hash_password($data['password']);
            $data['password_confirm'] = Auth::instance()->hash_password($data['password_confirm']);
            $user = ORM::factory('user');

            try {
                if (!$this->checkusername($data)) {
                    Session::instance()->set('post', $data);
                    $this->request->redirect('registration');
                };
                
                if ($_POST['secret_code'] != 121790) {
                    $errors['code'] = 'Наверный секретный код!';
                    Session::instance()->set('post', $data);
                    $this->request->redirect('registration');
                }

                $result = Model::factory('accaunt')->add_user($data);
                $this->action_activateMail($data['email']);
                
            } catch (ORM_Validation_Exception $e) {
                $errors = $e->errors('auth');



                Session::instance()->set('errors_auth', $errors);

                $data['complate'] = FALSE;
            }

            Session::instance()->set('post', $data);
            $this->request->redirect('registration');
        }

        $data = Session::instance()->get_once('post', array());
        if (count($data) == 0) {
            $data['username'] = '';
            $data['email'] = '';
        }

        $this->template->title = __('Register');
        $this->template->login_box = View::factory('account/register')
                ->bind('post', $data)
                ->bind('errors', $errors)
                ->bind('loginerrors', $loginerrors);
    }

    public function action_activate() {
        $id = $this->request->param('id');

        if ($this->request->is_ajax()) {
            $email = Auth::instance()->get_user()->email;
            $result = $this->activateMail($email);
            if ($result) {
                echo json_encode('Письмо отправлено заново');
            } else {
                echo json_encode('Не получилось отправить письмо подтверждения');
            }
            return true;
        }

        if ($id) {
            echo $id;
            $data = '';
            $result = Model::factory('accaunt')->activate_user($data);
        }

        $this->template->login_box = View::factory('account/activate');
    }

    public function action_logout() {
        Auth::instance()->logout();
        //Request::instance()->redirect('login');
        $this->request->redirect('/');
    }

    public function activateMail($email) {
        $config = Kohana::$config->load('email');
        Email::connect($config);
        $to = $email;
        $subject = 'Поздравляем! Вы успешно зарегестрировались!';
        $from = 'admin@edusystem.in.ua';
        $token = md5(uniqid());
        
        Cookie::set('activet', $token);
        
        $str = URL::base('http') . 'activate/' . $token;
        $message = View::factory('email')->set('content', 'Вы успешно зарагестрированны! Вам требуется активации вашей учетной записи'
                        . ', для этого пройдите по ссылке <a href="' . $str . '">Активация учетной записи</a>.')->render();
        $res = Email::send($to, $from, $subject, $message, $html = true);

        if ($res) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function checkusername($data) {

        $errors = array();
        $result = TRUE;

        if (ORM::factory('user')->unique_key_exists($data['username'])) {
            $errors[] = 'Пользователь с таким ником уже существует!';
            Session::instance()->set('errors_auth', $errors);
            $result = false;
        }

        if (ORM::factory('user')->unique_key_exists($data['email'])) {
            $errors[] = 'Пользователь с таким email уже существует!';
            Session::instance()->set('errors_auth', $errors);
            $result = false;
        }

        return $result;
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
