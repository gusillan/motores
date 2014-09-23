
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Motores</title>
        <!--ESTILOS CSS -->
        <link rel="stylesheet" href="css/estilos.css" type="text/css" />
    </head>
    <body>
        <h1>Formulario de Motores</h1>
        <br>

        <form name="formMotor" id="formMotor" action="" method="POST">
            <fieldset><legend>Datos del motor</legend>
                <div>
                    <label>Nº Motor</label>
                    <input type="text"  name="idmotor" id="idmotor" class="mayuscula" size="4" required/>
                </div>
                <div>
                    <label>Código</label>
                    <input type="text"  name="codigo" id="codigo" class="mayuscula" size="10" required/>
                    <input type="button" id="ir" value="Ir" onclick="comprobarCodigoMotor();"</p>
                </div>
                <div>
                    <label>Descripción</label>
                    <input type="text"  name="descripcion" id="descripcion" class="mayuscula" size="40"/>
                </div>
                <div>
                    <label>Cilindrada</label>
                    <input type="number" name="cilindrada" id="cilindrada" size="8" required/>
                    <label>Kw</label>
                    <input type="number" name="kilowatios" id="kilowatios" size="4"/>
                    <label>Cv</label>
                    <input type="number" name="cv" id="cv" disabled="true" size ="4"/></p>            
                </div>
            </fieldset>

            <fieldset style color="black"><legend>Menú de opciones</legend>
                <div id="menu">
                    <input type="submit" value="Alta" id="botonAlta" disabled ="false"/>
                    <input type="submit" value="Baja" id="botonBaja" disabled ="false"/>
                    <input type="submit" value="Modificar" id="botonModificar" disabled ="false"/>
                    <input type="reset" value="Limpiar Formulario" id="borrarFormulario"/>
                    <a href="listaMotor.htm"><button type="button">Listado</button></a>
                </div>
            </fieldset>

            <br>
            <div id="resultado"></div>
        </form>

    </body>
    
    <!--LIBRERIAS JQUERY -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>						//Respaldo para cuando Jquery no carga de internet
      if (!window.jQuery) document.write('<script type="text/javascript" src="js/jquery-1.11.1.min.js"><\/script>');
    </script>
    <script type="text/javascript" src="js/formularioMotores.js"></script>

</html>
