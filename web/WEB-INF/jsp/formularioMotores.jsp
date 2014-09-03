<%-- 
    Document   : altaMotorAjax
    Created on : 02-abr-2014, 22:52:32
    Author     : Gustabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Motores</title>

        <style type="text/css">
            body {
                color: #000000;
                background-color: #FFE4C4;
                font-family: Tahoma;
            }
            input.mayuscula {
                text-transform: uppercase;
            }
            #menu {
                background-color: #D3D3D3;

            }
        </style>

        <script>
            var objeto = new XMLHttpRequest;

            function comprobarCodigoMotor() {                
                var codigo = document.getElementById("codigo").value.toUpperCase();
                document.getElementById("codigo").value = codigo;
                if (codigo != "") {
                    objeto.open("POST", "consultaCodigoMotor.htm", true);
                    objeto.onreadystatechange = muestravalor;
                    objeto.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    objeto.send("codigo=" + codigo);
                }else{                    
                    alert("Tiene que introducir algún caracter");
                    document.getElementById("codigo").focus();
                }
                
            }

            function funcion1(numero) {
                var n = parseInt(numero);
                document.getElementById("idmotor").value = idmotor.item(n).firstChild.nodeValue;
                document.getElementById("codigo").value = codigo.item(n).firstChild.nodeValue;
                document.getElementById("descripcion").value = descripcion.item(n).firstChild.nodeValue;
                document.getElementById("cilindrada").value = cilindrada.item(n).firstChild.nodeValue;
                document.getElementById("kilowatios").value = kilowatios.item(n).firstChild.nodeValue;
                document.getElementById("cv").value = ((kilowatios.item(n).firstChild.nodeValue) * 1.36).toFixed(2);
            }

            function muestravalor() {
                if (objeto.readyState == 4) {

                    raiz = objeto.responseXML;
                    idmotor = raiz.getElementsByTagName("idmotor");
                    codigo = raiz.getElementsByTagName("codigo");
                    descripcion = raiz.getElementsByTagName("descripcion");
                    cilindrada = raiz.getElementsByTagName("cilindrada");
                    kilowatios = raiz.getElementsByTagName("kilowatios");


                    if (codigo.length == 0) {
                        respuesta = confirm("No existe el codigo. Desea darlo de alta?");
                        if (respuesta == true) {
                            alta();
                        } else {
                            borrarCodigo();
                        }

                    }
                    else if (codigo.length == 1) {
                        document.getElementById("codigo").value = codigo.item(0).firstChild.nodeValue;
                        document.getElementById("descripcion").value = descripcion.item(0).firstChild.nodeValue;
                        document.getElementById("cilindrada").value = cilindrada.item(0).firstChild.nodeValue;
                        document.getElementById("kilowatios").value = kilowatios.item(0).firstChild.nodeValue;
                        document.getElementById("cv").value = (kilowatios.item(0).firstChild.nodeValue) * 1.36;
                    }
                    else if (codigo.length > 1) {
                        var myventana = window.open("selector.htm", "miventana", "width=700,height=300");
                        myventana.document.getElementById("pru").innerHTML = "<p>Motores</p>";
                        var s = myventana.document.getElementById("opciones");

                        for (p = 0; p < codigo.length; p++) {
                            var opt = myventana.document.createElement("option");
                            opt.value = p;
                            opt.text = codigo.item(p).firstChild.nodeValue + " " + descripcion.item(p).firstChild.nodeValue;
                            s.add(opt, p);
                        }
                        s.options[0].selected = "selected";
                        document.getElementById("ir").disabled = true;
                        document.getElementById("botonBaja").disabled = false;
                        document.getElementById("botonModificar").disabled = false;

                    }

                }
            }
            function listado() {
                //alert("listado");
                location.href = "/Motores/motoresListado.htm";
            }
            function inicio() {
                document.getElementById("codigo").value = "";
                document.getElementById("codigo").focus();
                document.getElementById("botonAlta").disabled = true;
                document.getElementById("botonBaja").disabled = false;
                document.getElementById("botonModificar").disabled = true;
                document.getElementById("ir").disabled = false;
            }
            function alta(){
                document.getElementById("botonAlta").disabled = false;
                document.getElementById("descripcion").focus();
            }
            function darDeAlta(){
                document.getElementById("formMotor").action="altaMotor.htm";
                document.getElementById("formMotor").submit();
            }
           
            function darDeBaja(){
                document.getElementById("formMotor").action="bajaMotor.htm";
                document.getElementById("formMotor").submit();
            }
            
            function modificar(){
                document.getElementById("formMotor").action="modificarMotor.htm";
                document.getElementById("formMotor").submit();
            }




        </script>

    </head>
    <body>
        <h1>Formulario de Motores</h1>
        <br>
        <form name="formMotor" id="formMotor" action="" method="POST">
            <fieldset><legend>Datos del motor</legend>
                <p><label>Nº Motor</label>
                    <input name="idmotor" id="idmotor" disabled="true" size="4"/>
                <p><label>Código : </label><input name="codigo" id="codigo" size="10" class="mayuscula"/>
                    <input type="button" id="ir" value="Ir" onclick="comprobarCodigoMotor()"</p>
                <p><label>Descripción : </label><input name="descripcion" id="descripcion" size="40" 
                                                       onkeyup="this.value = this.value.toUpperCase()"
                                                       class = "mayuscula"/></p>
                <p><label>Cilindrada : </label><input name="cilindrada" id="cilindrada" size="8"/>
                    <label>Kw : </label><input name="kilowatios" id="kilowatios" size="4"/>
                    <label>Cv : </label><input name="cv" id="cv" disabled="true" size ="4"/></p>            
            </fieldset>

            <fieldset style color="black"><legend>Menú de opciones</legend>
                <div id="menu">
                    <input type="submit" value="Alta" id="botonAlta" disabled ="false" onclick="darDeAlta();"/>
                    <input type="submit" value="Baja" id="botonBaja" disabled ="false" onclick="darDeBaja();" />
                    <input type="submit" value="Modificar" id="botonModificar" disabled ="false" onclick="modificar();"/>
                    <input type="reset" value="Limpiar Formulario" id="borrarFormulario" onclick="inicio();"/>
                    <input type="submit" value="Listado" onclick="listado();"/>
                </div>
            </fieldset>


            <br>
            <div id="resultado"></div>
        </form>

    </body>
</html>
