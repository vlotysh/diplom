
<ul class="pm_section">
    <li class="<?=$inbox?>">
        <a class="ajax" href="<?=  URL::base('').'mail'?>">Входящие</a>
    </li>
    <li class="<?=$outbox?>">
        <a class="ajax" href="<?=   URL::base('').'mail/?section=outbox'?>">Исходящие</a>
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
         
        function changeHash(id) {

try {
  // history.replaceState(null, "",id);
    window.history.pushState(id, "", id); 
}
catch(e) {
   location.hash = '#id_'+id;
}

}
$('a.ajax').on('click',function() {

    
    var href = $(this).attr('href');
    changeHash(href);
   
    
   /*  $('.cont').load(href);*/
    $.ajax({  
                url: href,
                type: "POST",
                cache: false,  
                success: function(res){
                var data = $.parseJSON(res);
                   $('.cont').html(data.content);
                   
                }

})

 return false;

})

window.onpopstate = function(e) {
    if(e.state != null) {
        var href = e.state;
         $.ajax({  
                url: href,
                type: "POST",
                cache: false,  
                success: function(res){
                   var data = $.parseJSON(res);
                   $('.cont').html(data.content);
                   
                }
})
    }
}

        </script>