/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Listeners */
$("#botonAlta").click(function(){
    darDeAlta();
});
$("#botonBaja").click(function(){
    darDeBaja();
});
$("#botonModificar").click(function(){
    modificar();
});
$("#ir").click(function(){
    comprobarCodigoMotor();
});

$("#borrarFormulario").click(function(){
     $("#codigo").focus();
});
$("input[type=text]").keyup(function(){     //Todos los input tipo text se hacen mayusculas
    var cadena = $(this).val();
    cadena = cadena.toUpperCase();
    $(this).val(cadena);
});

$(document).ready(function(){     
    $("#codigo").focus();                   // Es igual que document.getElementById("codigo").focus();
});

var objeto = new XMLHttpRequest;

function comprobarCodigoMotor() {
    var codigo = document.getElementById("codigo").value.toUpperCase();
    
    if (codigo !== "") {
        objeto.open("POST", "consultaCodigoMotor.htm", true);
        objeto.onreadystatechange = muestravalor;
        objeto.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        objeto.send("codigo=" + codigo);
    } else {
        alert("Tiene que introducir algún caracter");
        document.getElementById("codigo").focus();
    }

}

function selecciona(numero) {
    var n = parseInt(numero);
    rellenaFormulario(n);
}
function seleccionOpcion() {
                var eleccion = document.getElementById("opciones").selectedIndex;
                selecciona(eleccion);
                
              
            }


function muestravalor() {
    if (objeto.readyState === 4) {

        raiz = objeto.responseXML;
        idmotor = raiz.getElementsByTagName("idmotor");
        codigo = raiz.getElementsByTagName("codigo");
        descripcion = raiz.getElementsByTagName("descripcion");
        cilindrada = raiz.getElementsByTagName("cilindrada");
        kilowatios = raiz.getElementsByTagName("kilowatios");

        if (codigo.length === 0) {
            respuesta = confirm("No existe el codigo. Desea darlo de alta?");
            if (respuesta === true) {
                alta();
            } else {
                borrarCodigo();
            }
        }
        else if (codigo.length === 1) {
            rellenaFormulario(0);
        }
        else if (codigo.length > 1) {
            cargarOpcionesSecundaria();
        }
    }
}
function cargarOpcionesSecundaria() {
    
    var s = document.getElementById("opciones");

    for (p = 0; p < codigo.length; p++) {
        var opt = document.createElement("option");
        opt.value = p;
        opt.text = codigo.item(p).firstChild.nodeValue + " - " + descripcion.item(p).firstChild.nodeValue;
        s.add(opt, p);
    }
    s.options[0].selected = "selected";
    document.getElementById("ir").disabled = true;
    document.getElementById("botonBaja").disabled = false;
    document.getElementById("botonModificar").disabled = false;
  
}
//            function listado() {
//                //alert("listado");
//                location.href = "Motores/listaMotor.htm";
//            }
function rellenaFormulario(n) {
    document.getElementById("idmotor").value = idmotor.item(n).firstChild.nodeValue;
    document.getElementById("codigo").value = codigo.item(n).firstChild.nodeValue;
    document.getElementById("descripcion").value = descripcion.item(n).firstChild.nodeValue;
    document.getElementById("cilindrada").value = cilindrada.item(n).firstChild.nodeValue;
    document.getElementById("kilowatios").value = kilowatios.item(n).firstChild.nodeValue;
    document.getElementById("cv").value = ((kilowatios.item(n).firstChild.nodeValue) * 1.36).toFixed(2);

    document.getElementById("botonAlta").disabled = true;
    document.getElementById("botonBaja").disabled = false;
    document.getElementById("botonModificar").disabled = false;
    document.getElementById("ir").disabled = true;

}
//            function inicio() {
//                document.getElementById("codigo").value = "";
//                document.getElementById("codigo").focus();
//                document.getElementById("botonAlta").disabled = true;
//                document.getElementById("botonBaja").disabled = true;
//                document.getElementById("botonModificar").disabled = true;
//                document.getElementById("ir").disabled = false;
//            }
function alta() {
    document.getElementById("botonAlta").disabled = false;
    document.getElementById("descripcion").focus();
}
function darDeAlta() {
    document.getElementById("formMotor").action = "altaMotor.htm";
    document.getElementById("formMotor").submit();
}

function darDeBaja() {
    document.getElementById("formMotor").action = "bajaMotor.htm";
    document.getElementById("formMotor").submit();
}

function modificar() {
    document.getElementById("formMotor").action = "modificarMotor.htm";
    document.getElementById("formMotor").submit();
}




   


