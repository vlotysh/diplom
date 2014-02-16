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
   
    <?php echo $pagination;?>
    </div>
