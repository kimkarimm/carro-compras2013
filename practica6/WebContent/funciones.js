$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    $(".boton").click(function (){
        $(".error").remove();
        if( $(".nombre").val() == "" ){
            $(".nombre").focus().after("<span class='error'>Ingrese su nombre</span>");
            return false;
        }else if ($(".apellido").val()==""){
        	$(".apellido").focus().after("<span class='error'>Ingrese su apellido</span>");
        	return false;
        }else if( $(".email").val() == "" || !emailreg.test($(".email").val()) ){
            $(".email").focus().after("<span class='error'>Ingrese un email correcto</span>");
            return false;
            
        }else if($(".nombreUsr").val()==""){
        	$(".nombreUsr").focus().after("<span class='error'>Ingrese un nombre de usuario correcto</span>");
        }else if( $(".password").val() == ""){
            $(".password").focus().after("<span class='error'>Ingrese una contrase�a</span>");
            return false;
        }else if( $(".confirm_password").val() == "" ){
            $(".confirm_password").focus().after("<span class='error'>Contrasenias no coincidentes</span>");
            return false;
        }
    });
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