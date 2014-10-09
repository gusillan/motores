
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Motores</title>
        
        <!--ESTILOS CSS -->  
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css" />
        <link rel="stylesheet" href="css/estilos.css" type="text/css" />
    </head>
    <body role="document">
        <div class="container">
            <h1 class="center-block">Formulario de Motores</h1>
            <form  role="form" name="formMotor" id="formMotor" class="form-horizontal" action="" method="POST">
                <div class="form-group">
                    <label for="idmotor" class="col-sm-2 control-label">Nº Motor</label>
                    <div class="col-sm-2">
                        <input type="text"  name="idmotor" id="idmotor" class="form-control mayuscula" size="4" readonly/>   
                    </div>          
                </div>
 
                <legend>Datos del motor</legend>
                <div class="form-group">
                    <label for="codigo" class="col-sm-2 control-label">Código</label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input type="text" name="codigo" id="codigo" class="form-control mayuscula" id="matricula" required/>
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="button" id="ir" data-target="#ventanaSelectora">Ir</button>
                            </span>
                        </div><!-- /input-group -->
                    </div>
                </div>
                <div class="form-group">
                    <label for="descripcion" class="col-sm-2 control-label">Descripción</label>
                    <div class="col-sm-8">
                        <input type="text"  name="descripcion" id="descripcion" class="form-control mayuscula" size="40" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cilindrada" class="col-sm-2 control-label">Cilindrada</label>
                    <div class="col-sm-2">
                        <input type="number" name="cilindrada" id="cilindrada" class="form-control" size="8" required/>
                    </div>
                    <label for="kilowatios"  class="col-sm-1 control-label">Kw</label>
                    <div class="col-sm-2">
                        <input type="number" step="0.01" min="0" name="kilowatios" id="kilowatios" class="form-control" size="4" required/>
                    </div>
                    <label for="cv" class="col-sm-1 control-label">Cv</label>
                    <div class="col-sm-2">
                        <input type="number" name="cv" id="cv" disabled="true" class="form-control" size ="4"/>            
                    </div>
                </div>
            
                <legend>Menú de opciones</legend>
                <div class="navbar navbar-inverse">
                    <div class="container">
                        <div class="btn-group">
                            <input type="submit" formaction="altaMotor.htm" value="Alta" id="botonAlta" class="btn btn-primary navbar-btn" disabled ="false"/>
                            <input type="submit" formaction="bajaMotor.htm" value="Baja" id="botonBaja" class="btn btn-danger navbar-btn" disabled ="false"/>
                            <input type="submit" formaction="modificarMotor.htm" value="Modificar" id="botonModificar" class="btn btn-warning navbar-btn" disabled ="false"/>
                        </div>
                        <input type="reset" value="Limpiar Formulario" id="borrarFormulario" class="btn btn-primary navbar-btn"/>
                        <a href="listaMotor.htm" role="button" class="btn btn-info navbar-btn navbar-btn">Listado</a>
                    </div>
                </div>
                
                <div id="resultado"></div>
            </form>     
            
        </div><!-- container -->
        
        
        <!-- ventana selectora para codigo de motor -->
        <div class="modal" id="ventanaSelectora" tabindex="-1" role="dialog" aria-labelledby="modal1Label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="modal1Label">Ventana Selectora</h4>
                    </div>
                    <div class="modal-body">
                        <select class="list-group" id="codeList" size="10"><!--data-dismiss="modal"-->

                        </select>
                    </div>
                    <div class="modal-footer">
                        <input type="button" id="seleccionar" name="seleccionar" value="Seleccionar" onclick="seleccionOpcion();"  data-dismiss="modal">
                        <input type="button" name="alta" value="Dar de Alta" onclick="alta();" data-dismiss="modal">
                        <input type="button" name="cancelar" value="Cancelar" data-dismiss="modal">
                    </div>
                </div>
            </div>
        </div>
        
        
    </body>
    
    <!--LIBRERIAS JQUERY -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>						//Respaldo para cuando Jquery no carga de internet
        if (!window.jQuery) document.write('<script type="text/javascript" src="js/jquery-1.11.1.min.js"><\/script>');
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/formularioMotores.js"></script>

</html>

