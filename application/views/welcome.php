
<a class="ajax" href="mail">111</a>
ПРивет!


<script>
        function changeHash(id) {

try {
   history.replaceState(null, "",id);
    window.history.pushState("", "", id); 
}
catch(e) {
   location.hash = '#id_'+id;
}

}


$('a.ajax').click(function() {
    
    var href = $(this).attr('href');
    changeHash(href);
   
    
   /*  $('.cont').load(href);*/
    $.ajax({  
                url: href,
                type: "POST",
                cache: false,  
                success: function(res){
                  
                   $('.cont').html(res);
                   
                }

})

 return false;
})

</script>