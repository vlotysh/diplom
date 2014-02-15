<ul class="pm_section">
    <li class="<?=$inbox?>">
            <a href="<?=  URL::base('').'mail'?>">Входящие</a>
    </li>
    <li class="<?=$outbox?>">
        <a href="<?=   URL::base('').'mail/?section=outbox'?>">Исходящие</a>
    </li>
   
    </ul>


<div class="mail_cell">
    <table width="100%" class="mail_table"> 
        <?= $privet_ms;?>
  
     </table>
   
    <?if($flag != 0):?>
    <div id="load_pm" class="btn-primary" offset="<?=$offset;?>" type="<?=$type;?>" style="margin: 10px auto;"><!--Подаем смещение через атребут оffset, начинается с 10-->
Загрузить еще
</div>
    <div id="imgLoad" style="text-align: center; margin-top: 10px;" ><img width="30" src="<?=URL::base()?>media/images/495.GIF"/></div>
<?  endif;?>
    </div>
