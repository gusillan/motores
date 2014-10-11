package com.pacoillan.controller;

import com.pacoillan.DAO.MotorDAO;
import com.pacoillan.pojo.Motor;
import com.pacoillan.servicios.ServicioMotores;
import java.io.IOException;
import java.io.PrintWriter;
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
        List lista = motor.listAll();
        if (lista.isEmpty()) {
            mv.setViewName("noexiste");
        } else {
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
        motor.create(mot);
        response.sendRedirect("formularioMotores.htm");
    }

    @RequestMapping("bajaMotor.htm")
    public void bajaMotor(@ModelAttribute Motor mot, HttpServletResponse response) throws IOException {
        motor.delete(mot);
        response.sendRedirect("formularioMotores.htm");
    }

    @RequestMapping("modificarMotor.htm")
    public void modificacarnMotor(@ModelAttribute Motor mot, HttpServletResponse response) throws IOException {
        motor.update(mot);
        response.sendRedirect("formularioMotores.htm");
    }

    @RequestMapping("consultaCodigoMotor.htm")
    public void consultaCodigoMotor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigo = (request.getParameter("codigo").toUpperCase());
        List<Motor> listaMotores = motor.listadoPorCampo("codigo", codigo);
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServicioMotores sm = new ServicioMotores();
        sm.setLista(listaMotores);
        StringBuilder tXML = sm.getXml();
        out.println(tXML);
    }
}
