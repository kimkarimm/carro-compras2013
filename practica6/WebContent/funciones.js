$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    var min = 6;
    $(".boton").click(function (){
        $(".error").remove();
        if( $(".nombre").val() == "" ){
            $(".nombre").focus().after("<span class='error'>Ingrese un nombre</span>");
            return false;
        }else if ($(".apellido").val()==""){
        	$(".apellido").focus().after("<span class='error'>Ingrese su apellido</span>");
        	return false;
        }else if( $(".email").val() == "" || !emailreg.test($(".email").val()) ){
            $(".email").focus().after("<span class='error'>Ingrese un email correcto</span>");
            return false;
        }else if($(".nombreUsr").val()==""){
        	$(".nombreUsr").focus().after("<span class='error'>Ingrese un nombre de usuario correcto</span>");
        	return false;
        }
    });

$(".nombre, .apellido").keyup(function(){
    if( $(this).val() != "" ){
        $(".error").fadeOut();
        return false;
    }
});
$(".email").keyup(function(){
    if( $(this).val() != "" && emailreg.test($(this).val())){
        $(".error").fadeOut();
        return false;
    }
});
});