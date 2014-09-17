<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function goback() {
        window.history.back();
    }
</script>




<h1>Listado de Motores</h1>
<input type="button" value="Volver" onclick="goback();">
<br>    



<c:forEach var="Motor" items="${listado}">
    Numero: ${Motor.idmotor} Código motor : ${Motor.codigo} Descripcion :  ${Motor.descripcion} <br>
</c:forEach>


