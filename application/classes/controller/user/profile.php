<?php

defined('SYSPATH') or die('No direct script access.');

class Controller_User_Profile extends Controller_Application {
    
    public function before() {
        parent::before();
        
        $this->user  = Auth::instance()->get_user();
       
    }

    
    public function action_index(){
        
        $this->template->profile_class_link_menu = 'active';
        
        $this->template->title =  'Страничка пользователя';
        $this->template->content = View::factory('user/personal_page');
        $id = $this->user->id;
//       / $info = ORM::factory('base')->getUsersById(13);
    
//        echo View::factory('profiler/stats');
        /*
        $fio = 'Лотыш Владислав Николаевич';
         * 
        $fio_arr = explode(' ',$fio);
        
        list($familiya, $name, $otchestvo) = $fio_arr;
        echo $familiya;
        exit();*/
    }
    
    public function action_allusers() {
        
        $this->template->userlist_link_menu = 'active';
        
        $count = ORM::factory('user')->count_all();
        
        $pagination = Pagination::factory(array(
     
                    'current_page' => array('source' => 'query_string', 'key' => 'page'), // source: "query_string" or "route"
                    'total_items' => $count,
                    'items_per_page' => 10,
                    ));
        
        $pagination->route_params(array('controller' => $this->request->controller(), 'action' => $this->request->action() ));
        
        
        
       
        $data['per_page'] = $pagination->items_per_page;
        $data['users'] = Model::factory('users')->find_all($pagination->items_per_page, $pagination->offset);
        $data['pagination'] = $pagination->render();
        
        $error = Session::instance()->get_once('error');
        
        $this->template->content = View::factory('user/userlist',$data)->bind('error', $error);
    
    }
    
     public function action_usersearch() {
         
         $this->template->userlist_link_menu = 'active';
         
         $query = $this->request->post('query');
         if($query == '') {
            
             Session::instance()->set('error', 'Нет данных для поиска');
             $this->request->redirect('profile/allusers');
         }
         $data['query'] = $query;
         
         $data['users'] = Model::factory('users')->find_users($query);
         
         $this->template->content = View::factory('user/userlist',$data);
     }
     
    public function action_user(){
      
        $id = $this->request->param('id');
    
         # $arrayyy = array('fio' => 'Лотыш Владислав Николаевич','age' =>'25',);
         #  $new = json_encode($arrayyy);
         #  $info = ORM::factory('base')->UpdateUserById(13,$new);
         #   $info1 = ORM::factory('base')->getUserById(13);
        
      # $info1['info'] = json_decode($info1['info']);
        
        
        $id_carent = $this->user->id;
        $massege_form = View::factory('user/mail_form')
                ->bind('recipient_id',$id)
                ->bind('sender_id',$id_carent)
                ->render();

     
        $user_page = View::factory('user/user')
                ->bind('user_id',$user_id)
                ->bind('user_info',$user_info )
                ->bind('massege_form',$massege_form)
                ->bind('online',$online);
        
        $user_info = ORM::factory('user',$id);
       // echo time() - $user_info->last_activity; exit();
      
        $online = ((time() - $user_info->last_activity) <= 180) ? TRUE : FALSE;
        
        $user_id = $id;
 
        $this->template->title =  $user_info->username;
        $this->template->content = $user_page ;
        
    }
    
    
    public function action_settings() {
        $user_info = Model::factory('users')->getUserById($this->user->id);

        $this->template->content = View::factory('user/user_settings',array('user_info' => $user_info));
        
    }
    
    public function action_avatar() {
        if ($this->request->method() == Request::POST)
        {
            if (isset($_FILES['avatar']))
            {
                if($filename = $this->_save_image($_FILES['avatar'])) {
                  $user =  ORM::factory('user',$this->user->id);
        $user->avatar = $filename;
        $user->save();
                    
                    $this->request->redirect('profile');
                };
                
                
                
                
            }
        }
 
        if ( !$filename)
        {
            $error_message = 'There was a problem while uploading the image.
                Make sure it is uploaded and must be JPG/PNG/GIF file.';
        }
    }
    
     protected function _save_image($image)
    {
        if (
            ! Upload::valid($image) OR
            ! Upload::not_empty($image) OR
            ! Upload::type($image, array('jpg', 'jpeg', 'png', 'gif')))
        {
            return FALSE;
        }
 
        $directory = DOCROOT.'uploads/avatars/';
       
        if ($file = Upload::save($image, NULL, $directory))
        {
            
            $img = Image::factory($file);
            $filename = strtolower(Text::random('alnum', 20)).'.jpg';
            
           
            $img->resize(400,NULL, Image::AUTO)
                ->save($directory.$filename);
            
            
            $img->resize(100,NULL, Image::AUTO)
                ->crop(100,100)
                ->save($directory.'/thumb/'.$filename);
 
            // Delete the temporary file
            unlink($file);
 
            return $filename;
        }
 
        return FALSE;
    }

    //Обновления статус онлайн
    public function action_online() {
   
        if($this->request->is_ajax()){
            if($this->user) {
                $result = ORM::factory('user',$this->user->id)->set('last_activity', time())->save();
                if($result) $res['status'] = 1;
                else $res['status'] = 0;
                
                echo json_encode($res);
                exit();
                
            }
            
        }
    }
    
}