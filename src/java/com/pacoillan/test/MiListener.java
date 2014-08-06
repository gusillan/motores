/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pacoillan.test;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Gustabo
 */
public class MiListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Aplicacion WEB Arrancada");
       
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Aplicacion WEB Parada");
    }
    
}
