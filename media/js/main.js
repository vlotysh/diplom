function updateOnline() {
    console.log('Отправка на проверку онлайн!');
    $.ajax({
        type: "POST",
        async: false,
        url: "/profile/online",
        success: function(res) {
            if (res.status === 1) {
                console.log('Все ок!');
            } else {
                console.log('Все НЕ ок!');
            }
        }
    });
}
;

function adaptive() {
    var w = $(window).width(); // Получаем ширину окна
    if (w < 784) {
        console.log(w);
        $('.sidebar').hide();
        $('header.bg-dark').show();
        $('.main').css({
            "margin-left": 0,
            "width": '100%',
        })
        $('div.main').css({
            "padding": "20px",
        })
    } else {
        $('.sidebar').show();
        $('header.bg-dark').hide();
        $('.main').css({
            "margin-left": '18%',
            "width": '80%',
        })

        $('div.main').css({
            "padding": 0,
        })
    }


    /*
     if (w <= 480) { // Если ширина окна меньше, либо равна 600
     $("#left").html($("#left").html() + $("#right").html()); // Копируем содержимое правой колонки в левую
     $("#right").remove(); // Удаляем правую колонку
     }*/

}
function activate() {
           $('.send_active').text('...');
           $.ajax({
            type: "GET",
            async: false,
            url: "/activate",
            dataType: "json",
            success: function(result) {
                $('.send_active').text('Проверте свою почту!');   
            }
        })
}

 

$(document).ready(function() {
    
   
        
    $(".input-append").on("change", "input", function() {

        $(".input-append").append('<input type="file" name="file[]" id="file_control">');

    });

    function scrollto() {

        var height = $('body')[0].scrollHeight;
        $('body').animate({scrollTop: height}, 3000);
    }

//Запрос на подтверждение удаление файла
    $(".delete").click(function() {
        var idi = $(this).attr('rel');

        if (confirm("Уадилить файл " + $('.name' + idi).text() + "?")) {

        } else {
            return false;
        }

    })

    $("#send").click(function() { // при нажатии кнопки добавления новой статьи

        var postData = getData('.ms_block');
        $('#text').html('Началось!');
        $('.ms_block').hide();
        $('.modal-footer').hide();
        $('.progress').show();
        $('#send').attr("disabled", "disabled");
        $.ajax({
            type: "POST",
            async: false,
            url: "/mail/send",
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




    $("#load_pm").click(function() { // при нажатии кнопки добавления новой статьи

        console.log('Еще сообщений!');
        $(this).hide();
        $("#imgLoad").show();

        var num = $(this).attr('offset');
        var type = $(this).attr('type');

        $.ajax({
            type: "POST",
            async: false,
            url: "/mail/",
            cache: false,
            data: {"num": num, "type": type},
            dataType: "json",
            success: function(res) {
                if (res == null) {

                    $("#load_pm").hide();
                    $("#imgLoad").hide();
                    $(".mail_cell").append('no masseges');
                    return  false;
                }

                if (res.count < $("#load_pm").attr('offset')) { //Если количество полученных сообщений меньше 10, значит следующая выборка не получится
                    //и надо скрывать получение данных

                    $(".mail_table tbody").append(res.num);
                    $("#load_pm").hide();
                    $("#imgLoad").hide();

                }
                else {

                    $(".mail_table tbody").append(res.num);
                    var offset = parseInt($("#load_pm").attr("offset"));

                    offset = offset + offset;
                    $("#load_pm").show();
                    $("#load_pm").attr('offset', offset);

                    $("#imgLoad").hide();

                    $('#load_pm').on('click', function() {

                    });

                    /*var height = $('body')[0].scrollHeight;
                     $('body').animate({scrollTop:height},1000);*/
                }


            }
        });
    });









    /*$(".nav li a").click(function(e) {
     e.preventDefault(e);
     var pName;
     var Obj = $(this);
     $(".nav li").removeClass('active')
     pName = $(this).attr("href");
     
     
     
     $('.cont').fadeOut("slow", function () {
     $.ajax({
     type: "POST",
     async: false,
     url: pName,
     data: {"pName": pName},
     dataType: "json",
     cache: false,
     success: function(res) {
     
     $("a[href="+pName+']').parent().addClass('active');
     
     $('.cont').fadeIn("slow");
     $('.cont').html(res.content);
     }})
     });
     
     
     })
     
     
     */

    $(document).ready(function() {
        $("#imgLoad").hide();  //Скрываем прелоадер

    });

    function getData(obj_form) {
        var hData = {};

        $('input, textarea, hidden').each(function() {
            if (this.name && this.name != '') {
                hData[this.name] = this.value;
                console.log('hData[' + this.name + ']=' + hData[this.name]);
            }

        });

        return hData;
    }

});