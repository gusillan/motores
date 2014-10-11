/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pacoillan.servicios;

import com.pacoillan.pojo.Motor;
import java.util.List;

/**
 *
 * @author Gustabo
 */
public class ServicioMotores {

    private List<Motor> listaMotores;

    public void setLista(List<Motor> listaMotores) {
        this.listaMotores = listaMotores;
    }

    public StringBuilder getXml() {

        StringBuilder tXML = new StringBuilder("<?xml version='1.0'?>");

        if (listaMotores.isEmpty()) {
            tXML.append("<datos>");
            tXML.append("</datos>");
        }
        if (listaMotores.size() == 1) {
            Motor m = listaMotores.get(0);
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
        }
        if (listaMotores.size() > 1) {
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
            }
            tXML.append("</datos>");
        }
        return tXML;
    }
}
