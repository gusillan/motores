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
    @Autowired
    ModeloDAO modelo;

    @RequestMapping("motoresListado.htm")
    public ModelAndView motoresListado() {

        List<Motor> lista = new ArrayList<Motor>();
        lista = motor.listAll();
        //lista = motor.listadoPorCampo("kilowatios", "66");
        if (lista.size() == 0) {
            mv.setViewName("noexiste");
            return mv;
        }
        System.out.println(lista);
        mv.addObject("lista", lista);
        mv.setViewName("listadoMotores");
        return mv;
    }

    @RequestMapping("motoresConsulta.htm")
    public String motoresConsulta() {
        return "consultaMotores";
    }

    @RequestMapping("consulta.htm")
    public ModelAndView consulta(HttpServletRequest request) {
        int numero = Integer.parseInt(request.getParameter("motor"));
        Motor m = motor.read(numero);
        mv.addObject("motor", m);
        mv.setViewName("formularioMotor");
        return mv;
    }
    
    @RequestMapping("consultaXML.htm")
    public void consultaXML(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int numero = Integer.parseInt(request.getParameter("motor"));
        Motor m = motor.read(numero);
        response.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(m.getDescripcion());
        out.close();
               
    }
    

    @RequestMapping("motoresAlta.htm")
    public String motoresAlta() {
        return "altaMotor";
    }

    @RequestMapping("darAltaMotor.htm")
    public ModelAndView darAltaMotor(@ModelAttribute Motor mot) {
        Motor mo = motor.create(mot);
        mv.addObject("motor", mo);
        mv.setViewName("formularioMotor");
        return mv;
    }
    
    @RequestMapping("motoresAltaAjax.htm")
    public String motoresAltaAjax() {
        return "altaMotorAjax";
    }
    
    @RequestMapping("consultaCodigoMotorAjax.htm")
    public void consultaCodigoMotorAjax(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigo = (request.getParameter("codigo").toUpperCase());
        List<Motor> listaMotores = motor.listadoPorCampo("codigo", codigo);
        response.setContentType("text/xml;charset=UTF-8");
        if (listaMotores.isEmpty()){
            System.out.println("SIN RESULTADOS");
            
            PrintWriter out = response.getWriter();
            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");                   
            tXML.append("</datos>");
            
            System.out.println(tXML);
            
            out.println(tXML);
            
        }if (listaMotores.size()==1){
            System.out.println("COINCIDE SOLO UNO");  
            Motor m = listaMotores.get(0);
            System.out.println(m.getDescripcion());
            PrintWriter out = response.getWriter();
            
            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");
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
                       
        }if (listaMotores.size()>1){
            System.out.println("COINCIDEN VARIOS CODIGOS");
            
            PrintWriter out = response.getWriter();
            StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");
            tXML.append("<datos>");
            for(Motor m: listaMotores){
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
                System.out.println(m.getCodigo()+" "+m.getDescripcion());
            }
            tXML.append("</datos>");
            System.out.println("XML FoRmAdO");
            System.out.println(tXML);
            out.println(tXML);           
            
        }        
        
    }
   
    

    @RequestMapping("motoresBaja.htm")
    public String motoresBaja() {
        return "bajaMotor";
    }

    @RequestMapping("baja.htm")
    public ModelAndView baja(HttpServletRequest request) {
        int numero = Integer.parseInt(request.getParameter("motor"));
        Motor m = motor.read(numero);
        motor.delete(m);
        mv.addObject("motor", m);
        mv.setViewName("formularioMotor");
        return mv;
    }

    @RequestMapping("modelosAlta.htm")
    public String modeloAlta() {
        return "altaModelo";
    }

    @RequestMapping("darAltaModelo.htm")
    public void darAltaModelo(@ModelAttribute Modelo mod) {
        System.out.println(mod);
    }

    @RequestMapping("modelosConsulta.htm")
    public String modelosConsulta() {
        return "consultaModelos";
    }
    
    @RequestMapping("consultaMod.htm")
    public ModelAndView consultaMod(HttpServletRequest request) {
        int numero = Integer.parseInt(request.getParameter("modelo"));
        Modelo mo = modelo.read(numero);
        mv.addObject("modelo", mo);
        mv.setViewName("formularioModelo");
        
        System.out.println(mo.getDescripcion());
        System.out.println(mo.getMotor().getDescripcion());
        
        return mv;
    }
    @RequestMapping("selector.htm")
    public String selector() {
        return "selector";
    }
}
