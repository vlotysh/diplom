
$("#send").click(function() { // при нажатии кнопки добавления новой статьи
    console.log('Все ок!');
    var postData = getData('.modal-body');
    $('#text').html('Началось!');
    $('.ms_block').hide();
    $('.modal-footer').hide();
    $('.progress').show();
    $('#send').attr("disabled", "disabled");
    $.ajax({
        type: "POST",
        async: false,
        url: "/profile/addpm",
        data: postData,
        dataType: "json",
        success: function(result) {
            $('.progress').hide();

            $('.alert-success').show();
            $('#content').val('');//ОЧистка формы
        }
    })
});

/// Динамическая подзагрузка

$(document).ready(function() {
    $("#imgLoad").hide();  //Скрываем прелоадер
});


$("#load_pm").click(function() { // при нажатии кнопки добавления новой статьи
    
    console.log('Еще сообщений!');
    $(this).hide();
    $("#imgLoad").show();
    
    var num = $(this).attr('offset');

    $.ajax({
        type: "POST",
        async: false,
        url: "/mail/",
        cache: false,
        data: {"num": num},
        dataType: "json",
        success: function(res) {
             if(res.count < 10) { //Если количество полученных сообщений меньше 10, значит следующая выборка не получится
                 //и надо скрывать получение данных
                 
                  $(".mail_table").append(res.num);
                  $("#imgLoad").hide();
             } else {
             
                $(".mail_table tbody").append(res.num);
                var offset = parseInt($("#load_pm").attr("offset"));
                           
                offset = offset + 10;
                $("#load_pm").show();
                $("#load_pm").attr('offset',offset);
                
                $("#imgLoad").hide();
             }
               
            
        }
    });
});




function getData(obj_form) {
    var hData = {};

    $('input, textarea, select, hidden').each(function() {
        if (this.name && this.name != '') {
            hData[this.name] = this.value;
            console.log('hData[' + this.name + ']=' + hData[this.name]);
        }

    });

    return hData;
}