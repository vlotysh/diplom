

<ul class="pm_section">
    <li class="<?=$inbox?>">
            <a href="<?=  URL::base('').'mail'?>">Входящие</a>
    </li>
    <li class="<?=$outbox?>">
        <a href="<?=   URL::base('').'mail/?section=outbox'?>">Исходящие</a>
    </li>
   
    </ul>
<?php echo $pagination;?>

<div class="mail_cell">
    <table width="100%" class="mail_table"> 
        <?= $privet_ms;?>
  
     </table>
   
    <?php echo $pagination;?>
    </div>


<script>
 /*       function changeHash(id) {

try {
   history.replaceState(null, "",id);
    window.history.pushState("", "", id); 
}
catch(e) {
   location.hash = '#id_'+id;
}

}


$('a').click(function() {
    
    var href = $(this).attr('href');
    changeHash(href);
   
    
    $('.cont').load(href);
    $.ajax({  
                url: href,
                type: "POST",
                cache: false,  
                success: function(res){
                  
                   $('.cont').html(res);
                   
                }

})

 return false;
})*/

</script>