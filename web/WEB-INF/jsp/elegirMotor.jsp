<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                   
        
        <h1>Listado de Motores</h1>
        <br>
       
        
     
            
                <c:forEach var="Motor" items="${lista}">
                     Numero: ${Motor.idmotor} Código motor : ${Motor.codigo} Descripcion :  ${Motor.descripcion} <br>
                </c:forEach>
           
                   
