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
<?php
$url = HTML::urlParser('Ссылки: (http://vk.com), www.hotline.ua, http://rozetka.ua. http://diplom/');
echo $url.'<br>';

function HumanSize($Bytes)
{
  $Type=array("", "kilo", "mega", "giga", "tera", "peta", "exa", "zetta", "yotta");
  $Index=0;
  while($Bytes>=1024)
  {
    $Bytes/=1024;
    $Index++;
  }
  $str = "". substr($Bytes, 0, 4)." ".$Type[$Index]."bytes";
   //$str = substr($str, 0, 4);
  return $str;
};
$df_c = disk_free_space(getenv('DOCUMENT_ROOT'));
$df_f = disk_total_space(getenv('DOCUMENT_ROOT'));

$space_n = $df_f - $df_c;
$percent = substr($space_n/$df_f,0,4) *100;


echo $percent.'% <br>';
echo 'Свободного  места: '.HumanSize($df_c).'<br>';
echo 'Занятого места: '.HumanSize($space_n).'<br>';
echo 'Всего места: '.HumanSize($df_f).'<br>';

$directory = getenv('DOCUMENT_ROOT').'/media/css/';
$dir = scandir($directory);
$scanned_directory = array_splice($dir, 2);
var_dump($scanned_directory);
//list($dirname,$basename,$extension,$filename) = pathinfo('/index.php');
var_dump(pathinfo('/index.php'));
$filename = getenv('DOCUMENT_ROOT').'/media/images/anonimus.jpg';
echo File::mime(getenv('DOCUMENT_ROOT').'/media/images/anonimus.jpg') . '<br>';
echo 'Размер файла ' . $filename . ': ' . HumanSize(filesize($filename));

?>

<div style="width: 300px;border: 1px solid #ccc;border-radius: 5px;height: 30px;"><div style="border-radius: 5px 0 0 5px;width: <?=$percent.'%'?>;background-color:red;height: 100%;"></div></div>
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

