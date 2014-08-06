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

        </style>  

        <script>
            function cerrarVentana() {
                window.opener.inicio();              
                window.close();                
            }

            function seleccionOpcion() {
                var eleccion = document.getElementById("opciones").options.value;
                window.opener.funcion1(eleccion);
                window.close();
            }
            function alta(){
                window.opener.alta();
                window.close();
                    
            }
        </script>

        <title>Ventana Selectora</title>
    </head>
    <body>
        <h1 id="pru"></h1>
        <br>
        <select id="opciones" size="8">

        </select>
        <input type="button" name="seleccionar" value="Seleccionar" onclick="seleccionOpcion()">
        <input type="button" name="alta" value="Dar de Alta" onclick="alta()">
        <input type="button" name="cancelar" value="Cancelar" onclick="cerrarVentana()">
    </body>
</html>




