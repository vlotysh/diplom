<script>
    var CustomAlert = {
        render: function(dialog) {
            var winW = window.innerWidth;
            var winH = window.innerHeight;
            var dialogoverlay = document.getElementById('dialogoverlay');
            var dialogbox = document.getElementById('dialogbox');
            dialogoverlay.style.display = "block";
            dialogoverlay.style.height = winH + "px";
            var height = dialogbox.style.height;
            //dialogbox.style.left = (winW/2) - (550 * .5) + "px";
            dialogbox.style.top = (winH/3) - height + "px";
            dialogbox.style.display = "block";
            document.getElementById('dialogboxheader').innerHTML = "Важное сообщение";
            document.getElementById('dialogboxbody').innerHTML = dialog;
            document.getElementById('dialogboxfoot').innerHTML = "<button onclick='CustomAlert.ok()'>Ok</button>"
        },
        ok: function() {
             document.getElementById('dialogbox').style.display = "none";
             document.getElementById('dialogoverlay').style.display = "none";
        }
    };
    
    var CustomPromt = {
        render: function(dialog) {
            var winW = window.innerWidth;
            var winH = window.innerHeight;
            var dialogoverlay = document.getElementById('dialogoverlay');
            var dialogbox = document.getElementById('dialogbox');
            dialogoverlay.style.display = "block";
            dialogoverlay.style.height = winH + "px";
            var height = dialogbox.style.height;
            //dialogbox.style.left = (winW/2) - (550 * .5) + "px";
            dialogbox.style.top = (winH/3) - height + "px";
            dialogbox.style.display = "block";
            document.getElementById('dialogboxheader').innerHTML = "Важное сообщение";
            document.getElementById('dialogboxbody').innerHTML = dialog;
            document.getElementById('dialogboxfoot').innerHTML = "<button onclick='CustomPromt.no()'>No</button><button onclick='CustomPromt.ok()'>Ok</button>"
             
             return false;
    },
        ok: function() {
             document.getElementById('dialogbox').style.display = "none";
             document.getElementById('dialogoverlay').style.display = "none";
               $(this).trigger('click');
        },
         no: function() {
             document.getElementById('dialogbox').style.display = "none";
             document.getElementById('dialogoverlay').style.display = "none";
             return false;
        }
    };

    
   
</script>

<a class="ajax" href="mail">111</a>
ПРивет!


<button onclick="CustomAlert.render('Привет!');">default</button>
<div id="dialogoverlay"></div>
<div id="dialogbox">
    <div>
        <div id="dialogboxheader"></div>
        <div id="dialogboxbody"></div>
        <div id="dialogboxfoot"></div>
    </div>
</div>

<style>
    #dialogoverlay {
        display: none;
        opacity: .8;
        position: fixed;
        top: 0px;
        left: 0px;
        background: #696969;
        width: 100%;
        z-index: 9999;
    }

    #dialogbox {
        width: 100%;
        display: none;
        left: 0;
        position: fixed;
        background: #696969;
        z-index: 9999;
    }

    #dialogbox > div {
         width: 550px;
         margin: 8px auto;
        
    }

    #dialogbox > div > #dialogboxheader {
        font-size: 19px;
        padding: 10px 0;
        color: #fff;
    }

    #dialogbox > div > #dialogboxbody {
         font-size: 19px;
        padding: 10px 0;
        color: #fff;
        font-weight: bold;
    }

    #dialogbox > div > #dialogboxfoot {
        font-size: 19px;
        padding: 10px;
        text-align: right;
    }
    
    #dialogbox > div > #dialogboxfoot > button {
        background:  #9a1616;
        border: 2px solid #fff;
        color:#fff;
        width: 50px;
        text-align: center;
         font-weight: bold;
         padding: 3px;
    }
    
   
</style>

