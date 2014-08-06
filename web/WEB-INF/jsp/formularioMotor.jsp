
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Motores</title>
    </head>
    <body>
        <h1>Motor</h1>
        <br>
         <form:form name="formMotor" id="formMotor" action="altaMotor.htm" method="POST" modelAttribute="motor">
            <fieldset><legend>Datos del motor</legend>
            <p><label>Nº Motor</label>
            <form:input path="idmotor"  readonly="true" size="4"/>
            <p><label>Codigo : </label><form:input path="codigo" size="10"/></p>
            <p><label>Descripcion : </label><form:input path="descripcion" size="40"/></p>
            <p><label>Cilindrada : </label><form:input path="cilindrada" size="10"/>
            <label>Kilowatios : </label><form:input path="kilowatios" size="10"/></p>            
            </fieldset>
            
            <input type="button" value="Modificar" id="modificarEntidad" onclick="modificarEn();">
            <input type="button" value="Baja" id="bajaEntidad" onclick="bajaEn();">
            <input type="button" value="Mostrar sus vehículos" id="buscarVehiculo" onclick="bVehiculo();">
        </form:form>
        
        ${motor.idmotor}<br>
        ${motor.descripcion}<br>
        ${motor.cilindrada}<br>
        <br>
        ${motor.modelos}
        <br>
        
        
         <c:forEach var="Modelo" items="${motor.modelos}">
                     Numero: ${Modelo.idmodelo} Código modelo : ${Modelo.codigo} Descripcion :  ${Modelo.descripcion} <br>
         </c:forEach>
     
    </body>
</html>

        
        
        
       
            
   