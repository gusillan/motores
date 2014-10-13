/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//bajar, subir y elegir opcion dentro del modal
var KEY_ENTER=13;
var KEY_LEFT=37;
var KEY_UP=38;
var KEY_RIGHT=39;
var KEY_DOWN=40;


/* Listeners */
/****************************************************************************/
$("#codigo").keyup(function(event){
    if(event.keyCode === KEY_ENTER){
        $("#ir").click();
    }
});
$("#ir").click(function() {
    comprobarCodigoMotor();
});

$("#borrarFormulario").click(function() {
    $("#codigo").focus();
    document.getElementById("botonAlta").disabled = true;
    document.getElementById("botonBaja").disabled = true;
    document.getElementById("botonModificar").disabled = true;
    document.getElementById("ir").disabled = false;
    document.getElementById("codigo").readOnly = false;   
});
$("input[type=text]").keyup(function() {     //Todos los input tipo text se hacen mayusculas
    var cadena = $(this).val();
    cadena = cadena.toUpperCase();
    $(this).val(cadena);
});

$(document).ready(function() {
    $("#codigo").focus();                   // Es igual que document.getElementById("codigo").focus();
});



$('#ventanaSelectora').on('shown.bs.modal', function () {
    var codeList = document.getElementById("codeList");
    var selected = codeList.selectedIndex;
    var length = codeList.options.length;

    $("#ventanaSelectora").keyup(function(event){
        if(event.keyCode === KEY_ENTER){
            console.log("enter");
            $("#seleccionar").click();
        }else if(event.keyCode === KEY_UP){
            console.log("up");
            if(selected>0)
                selected--;
            codeList.options[selected].selected = true;
        }else if(event.keyCode === KEY_DOWN){
            console.log("down");
            if(selected<length-1)
                selected++;
            codeList.options[selected].selected = true;
        }
        
    });
});



/* Configuracion de inicio */
/****************************************************************************/
$("document").ready(function() {

});



/* Ventana selectora de codigo motor */
/****************************************************************************/
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

function seleccionOpcion() {
    var eleccion = document.getElementById("codeList").selectedIndex;
    var n = parseInt(eleccion);
    rellenaFormulario(n);
    // Aqui debe ir la funcion para acultar la vantana modal
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
                $("#codigo").val("").focus();   //borra el codigo y pone el foco en él.
            }
        }
        else if (codigo.length === 1) {
            rellenaFormulario(0);
        }
        else if (codigo.length > 1) {
            cargarOpcionesSecundaria();
            $('#ventanaSelectora').modal('show');
        }
    }
}

function cargarOpcionesSecundaria() {

    var s = document.getElementById("codeList");

    $("#codeList option").remove(); //borra las opciones que pueda haber anteriores
    
    for (var p = 0; p < codigo.length; p++) {
        var opt = document.createElement("option");
        opt.value = p;
        opt.text = codigo.item(p).firstChild.nodeValue + " - " + descripcion.item(p).firstChild.nodeValue;
        s.add(opt, p);
    }
    s.options[0].selected = "selected";
}




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
    document.getElementById("codigo").readOnly = true;
}



/* Funciones de elementales del formulario */
/****************************************************************************/
function alta() {
    document.getElementById("botonAlta").disabled = false;
    document.getElementById("descripcion").focus();
}



