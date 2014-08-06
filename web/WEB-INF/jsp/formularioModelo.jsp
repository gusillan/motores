
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Modelos</title>
    </head>
    <body>
        <h1>Modelo</h1>
        <br>
         <form:form name="formModelos" id="formModelos" action="altaMod.htm" method="POST" modelAttribute="modelo">
            <fieldset><legend>Datos del motor</legend>
            <p><label>Nº Modelo</label>
            <form:input path="idmodelo"  readonly="true" size="4"/>
            <p><label>Codigo : </label><form:input path="codigo" size="10"/></p>
            <p><label>Descripcion : </label><form:input path="descripcion" size="40"/></p>
            <p><label>Motor : </label><form:input path="motor.descripcion" size="10"/>
                        
            </fieldset>
            
            <input type="button" value="Modificar" id="modificarEntidad" onclick="modificarEn();">
            <input type="button" value="Baja" id="bajaEntidad" onclick="bajaEn();">
            <input type="button" value="Mostrar sus vehículos" id="buscarVehiculo" onclick="bVehiculo();">
        </form:form>
        
        ${modelo.motor.descripcion}<br>
        ${modelo.descripcion}<br>
        ${modelo.motor}
          
     
    </body>
</html>

        
        
        