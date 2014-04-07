<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Mail extends Controller_Application {

    public function before() {
        parent::before();

        $this->template->title = __('Mail');
        $this->template->mail_class_link_menu = 'active';
    }

    public function action_email() {
        $config = Kohana::$config->load('email');

        Email::connect($config);

        $to = 'Gangsta111@bigmir.net';
        $subject = 'Сообщение от Коханой..т.е. Коханы.';
        $from = 'admin@edusystem.in.ua';


        $message = View::factory('email')->set('content', 'КОНТЕНТ')->render();

        $res = Email::send($to, $from, $subject, $message, $html = true);

        if ($res) {
            $this->template->content = 'Все ок. Почта ушла на ' . $to;
        } else {
            $this->template->content = 'НЕ Все ок';
        }
    }

    public function action_mkdir() {
        mkdir(DOCROOT . 'uploads/' . date('Ym'));
        chmod(DOCROOT . 'uploads/' . date('Ym'), 777);
    }

    public function action_index() {
        
       
        
        $section = $this->request->query('section');
   

        $user = $this->auth->get_user()->id;
        if ($section != '') {
            $outbox = 'active';
            $type = 'outbox';
           $count = $this->MailModel->where('sender_id','=',$user)->count_all();
        } else {
            $inbox = 'active';
            $type = 'inbox';
            $count = $this->MailModel->where('recipient_id','=',$user)->count_all();
        }

        $user = $this->auth->get_user();


        $pagination = Pagination::factory(array(
                    
                    'current_page' => array('source' => 'query_string', 'key' => 'page'), // source: "query_string" or "route"
                    'total_items' => $count,
                    'items_per_page' => 10,
                    ));

        //Инициализация параметров динамической загрузки



        $ms_data = $this->MailModel->getAllOutInBoxPm($user->id, $pagination->items_per_page, $pagination->offset, $type);


        //то тогда не показывать кнопку "Загрузить еще"

        $pagee = $pagination->render();
        $pms = View::factory('user/mail_cell')
                ->bind('ms_data', $ms_data)
                ->bind('count', $value)
                
                ->render();




        $mail_inbox = View::factory('user/mail_index')
                ->bind('private_messages', $private_messages)
                ->bind('inbox', $inbox)
                ->bind('privet_ms', $pms)
                ->bind('pagination', $pagee)
                ->bind('outbox', $outbox);

 
        $this->template->content = $mail_inbox;
    }

    /* Просмотр сообщений! */

    public function action_view() {
      

        $massege_id = $this->request->param('massege_id');

        $massege = $this->MailModel->getOnPm($massege_id);


        $massege['sender_info'] = $this->MailModel->getUserById($massege['sender_id']);
        $massege['recipient_info'] = $this->MailModel->getUserById($massege['recipient_id']);

        if ($this->auth->get_user()->id == $massege['recipient_info']['user_id']) {

            ORM::factory('mail', $massege_id)->set('read', 1)->save();
        }


        $sendForm = View::factory('user/mail_form')
                ->bind('sender_id', $massege['sender_info']['user_id'])
                ->bind('recipient_id', $massege['recipient_info']['user_id'])
                ->render();

        $content_ms = View::factory('user/view_mail')
                ->bind('sendForm', $sendForm)
                ->bind('massege', $massege);

        $this->template->content = $content_ms;
        // echo $massege['id']; exit();
    }

    /* Отправка сообщений сообщений! */

    public function action_send() {
        if (Request::initial()->is_ajax()) {

            sleep(2);
            $post = Validation::factory($_POST);
            $post->rule('title', 'max_length', array(':value', 40))
                    ->rule('content', 'not_empty');
            if ($post->check()) {
                //  $result = array('code'=>'yES!!!');
//             /   $title = $this->request->POST('title');
                $user_id = Auth::instance()->get_user()->id;


                $mail = Arr::extract($_POST, array('title', 'content', 'user_id'), 'Не установлено');

                $mail['sinopsis'] = Text::limit_chars($mail['content'], 100);

                if ($mail['user_id'] == $user_id) {
                    $sender = $mail['user_id'];
                    $recipient = $user_id;
                } else {

                    $sender = $user_id;
                    $recipient = $mail['user_id'];
                }

                $pm = $this->MailModel
                        ->set('title', $mail['title'])
                        ->set('sender_id', $sender)
                        ->set('recipient_id', $recipient)
                        ->set('sinopsis', $mail['sinopsis'])
                        ->set('content', $mail['content'])
                        ->set('date', time())
                        ->save();



                if ($pm) {
                    $result['code'] = 'YES!';
                    $result['title'] = $mail['title'];
                } else {
                    $result['code'] = 'NO';
                }
            } else {
                $result['code'] = 'no CONTENT';
            }

            echo json_encode($result);
            exit();
        }
    }

}
