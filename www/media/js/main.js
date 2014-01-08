
            $("#send").click(function(){ // при нажатии кнопки добавления новой статьи
                console.log('Все ок!');
                var postData =  getData('.modal-body');
                $('#text').html('Началось!');
                $('.ms_block').hide();
                $('.modal-footer').hide();
                $('.progress').show();
               $('#send').attr("disabled", "disabled");
               $.ajax({
                   
                   type: "POST",
                   async: false,
                   url: "/profile/addpm",
                   data:postData,
                   dataType: "json",
                   success: function(result) {
                   $('.progress').hide();
                   
                   $('.alert-success').show();
                   $('#content').val('');//ОЧистка формы
                   }
               })
        });

 
 
 
 function getData(obj_form ) {
    var hData = {};
    
    $('input, textarea, select, hidden').each(function (){
        if(this.name && this.name!='') {
            hData[this.name] = this.value;
            console.log('hData['+this.name + ']=' + hData[this.name]);
        }
    
        });
       
        return hData;
}