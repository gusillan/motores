<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Modelos</title>
        
        <script>
            var objeto = new XMLHttpRequest;
            
            function comprobarMotor(mot){
                var motor = mot.value;
                objeto.open("POST","consultaXML.htm",true);
                objeto.onreadystatechange = muestravalor;
                objeto.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                objeto.send("motor="+motor);
            }
            
            function muestravalor(){
                if(objeto.readyState==4){
                    document.getElementById("tipomotor").innerHTML= objeto.responseText;
                }
            }
            
            
        </script>
        
    </head>
    <body>
        <h1>Alta Modelos</h1>
        <br>
         <form name="altaModelo" id="altaModelo" action="darAltaModelo.htm" method="POST">
            <fieldset><legend>Datos del modelo</legend>
            <p><label>Nº Modelo</label>
            <input name="idmodelor" readonly="true" size="4"/>
            <p><label>Motor : </label><input name="motor" size="10" onblur="comprobarMotor(this)"/><div id ="tipomotor"></div></p>
            <p><label>Codigo : </label><input name="codigo" size="10"/></p>
            <p><label>Descripcion : </label><input name="descripcion" size="10"/>
                     
            </fieldset>
            
            <input type="submit" value="Alta" id="botonAlta">
            <input type="reset" value="Borrar" id="borrarFormulario">
           
        </form>
       
     
    </body>
</html>
