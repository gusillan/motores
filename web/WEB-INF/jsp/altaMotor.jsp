<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <style type="text/css">
            body {
                color: grey;
                background-color: blanchedalmond; 
            }
            input.mayuscula {
                text-transform: uppercase;
            }
        </style>  
        
        <script>
            function comprobarCodigo(codigo){
                alert("hola"+codigo.value);
            }
        </script>
        
        <title>Alta Motores</title>
    </head>
    <body>
        <h1>Alta Motores</h1>
        <br>
         <form name="altaMotor" id="altaMotor" action="darAltaMotor.htm" method="POST">
            <fieldset><legend>Datos del motor</legend>
            <p><label>Nº Motor</label>
            <input name="idmotor" readonly="true" size="4"/>
            <p><label>Codigo : </label><input name="codigo" size="10" class="mayuscula" onblur="comprobarCodigo(this);"/></p>
            <p><label>Descripcion : </label><input name="descripcion" size="40"/></p>
            <p><label>Cilindrada : </label><input name="cilindrada" size="10"/>
            <label>Kilowatios : </label><input name="kilowatios" size="10"/></p>            
            </fieldset>
            
            <input type="submit" value="Alta" id="botonAlta">
            <input type="reset" value="Borrar" id="borrarFormulario">
           
        </form>
       
     
    </body>
</html>

        
        
        
       