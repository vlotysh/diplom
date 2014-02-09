
     <div class="ms_block">
         
             <?if(Auth::instance()->get_user()->id == $sender_id):?>
-------------------------       
   <p>Написать</p>
    
    <?else:?>
-------------------------    
     <p>Ответить</p>

    <?  endif;?>
         
 
 

 
 
<?=Form::open()?>
 
 
    <p>Заголовок</p>
    <p><?=Form::input('title','...',array('id' => 'title','placeholder' => '...'))?></p>
<p>Текст сообщения</p>
    <p><?=Form::textarea('content','',array('id'=> 'content','rows' => '4', 'cols' => '100'))?></p>
   
    <?if(Auth::instance())?>
    
    <!--Проверка на то кто отправитель.
    Если отправитель текущий пользователь, то будет отправлено еще одно сообщение
    Если отправитель другой пользователь, будет ответ
    -->
    
    <?if(Auth::instance()->get_user()->id == $sender_id):?>
    
    <p><?=Form::hidden('user_id',$recipient_id)?></p>
    
    <?else:?>
    
    <p><?=Form::hidden('user_id',$sender_id)?></p>
        
    <p>

    <?  endif;?>
    
   <?=Form::close()?>
    

    <div class="progress progress-striped active" style="display: none;">
  <div class="bar" style="width: 100%;"></div>
</div>
  <div class="alert alert-success" style="display: none;">Отправлено!</div>
    

    <button id="send" class="btn btn-primary"><?= (Auth::instance()->get_user()->id == $sender_id) ? 'Отправить сообщение' : 'Ответить' ?></button>
    
    

    
    
     </div>