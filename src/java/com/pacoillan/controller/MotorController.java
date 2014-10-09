package com.pacoillan.controller;

import com.pacoillan.DAO.ModeloDAO;
import com.pacoillan.DAO.MotorDAO;
import com.pacoillan.pojo.Modelo;
import com.pacoillan.pojo.Motor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MotorController {

    ModelAndView mv = new ModelAndView();
    @Autowired
    MotorDAO motor;
   
    @RequestMapping("listaMotor.htm")
    public ModelAndView listaMotor() {
     
        System.out.println("Ha llegado al Controller Lista Motor-----");       
        List lista = motor.listAll();
        //lista = motor.listadoPorCampo("kilowatios", "66");
        if (lista.isEmpty()) {
            mv.setViewName("noexiste");            
        }else{
        System.out.println("Esta es la lista" +lista);
        mv.addObject("listado", lista);
        mv.setViewName("listadoMotores");
        }
        return mv;
    }

    @RequestMapping("formularioMotores.htm")
    public String formularioMotores() {
        return "formularioMotores";
    }

    @RequestMapping("altaMotor.htm")
    public void altaMotor(@ModelAttribute Motor mot, HttpServletResponse response) throws IOException {
        System.err.println("/////***** OJO SE VA A DAR DE ALTA ****** ////"+mot.getDescripcion() );
        motor.create(mot);
        response.sendRedirect("formularioMotores.htm");
        
    }
    
    @RequestMapping("bajaMotor.htm")
    public ModelAndView bajaMotor(@ModelAttribute Motor mot) {                   
        motor.delete(mot);
        mv.setViewName("formularioMotores");
        return mv;
    }
    
    @RequestMapping("modificarMotor.htm")
    public ModelAndView modificacarnMotor(@ModelAttribute Motor mot) {
        motor.update(mot);
        mv.setViewName("formularioMotores");
        return mv;
    }

    @RequestMapping("consultaCodigoMotor.htm")
    public void consultaCodigoMotor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigo = (request.getParameter("codigo").toUpperCase());
        List<Motor> listaMotores = motor.listadoPorCampo("codigo", codigo);
        response.setContentType("text/xml;charset=UTF-8");
        if (listaMotores.isEmpty()) {
            System.out.println("SIN RESULTADOS");

            PrintWriter out = response.getWriter();
            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");
            tXML.append("</datos>");

            System.out.println(tXML);

            out.println(tXML);

        }
        if (listaMotores.size() == 1) {
            System.out.println("COINCIDE SOLO UNO");
            Motor m = listaMotores.get(0);
            System.out.println(m.getDescripcion());
            PrintWriter out = response.getWriter();

            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");
            tXML.append("<idmotor>");
            tXML.append(m.getIdmotor());
            tXML.append("</idmotor>");
            tXML.append("<codigo>");
            tXML.append(m.getCodigo());
            tXML.append("</codigo>");
            tXML.append("<descripcion>");
            tXML.append(m.getDescripcion());
            tXML.append("</descripcion>");
            tXML.append("<cilindrada>");
            tXML.append(m.getCilindrada());
            tXML.append("</cilindrada>");
            tXML.append("<kilowatios>");
            tXML.append(m.getKilowatios());
            tXML.append("</kilowatios>");
            tXML.append("</datos>");

            System.out.println(tXML);

            out.println(tXML);
            /*StringBuilder json = new StringBuilder();
             json.append("{descripcion:'");
             json.append(m.getDescripcion());
             json.append("', cilindrada:'");
             json.append(m.getCilindrada());
             json.append("', kilowatios:'");
             json.append(m.getKilowatios());
             json.append("'}");
            
             System.out.println(json);
            
             out.println(json);*/

        }
        if (listaMotores.size() > 1) {
            System.out.println("COINCIDEN VARIOS CODIGOS");

            PrintWriter out = response.getWriter();
            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");
            for (Motor m : listaMotores) {
                tXML.append("<idmotor>");
                tXML.append(m.getIdmotor());
                tXML.append("</idmotor>");
                tXML.append("<codigo>");
                tXML.append(m.getCodigo());
                tXML.append("</codigo>");
                tXML.append("<descripcion>");
                tXML.append(m.getDescripcion());
                tXML.append("</descripcion>");
                tXML.append("<cilindrada>");
                tXML.append(m.getCilindrada());
                tXML.append("</cilindrada>");
                tXML.append("<kilowatios>");
                tXML.append(m.getKilowatios());
                tXML.append("</kilowatios>");
                System.out.println(m.getCodigo() + " " + m.getDescripcion());
            }
            tXML.append("</datos>");
            System.out.println("XML FoRmAdO");
            System.out.println(tXML);
            out.println(tXML);

        }

    }
    
    @RequestMapping("selector.htm")
    public String selector() {
        return "selector";
    }
}
