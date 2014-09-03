/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pacoillan.test;

import com.pacoillan.DAO.MotorDAO;
import com.pacoillan.DAOHibernate.MotorDAOHibernate;
import com.pacoillan.pojo.Motor;

/**
 *
 * @author Gustabo
 */
public class TestDao {
    public static void main (String [] agrs){
        MotorDAO motor = new MotorDAOHibernate();
        Motor m = motor.read(1);
        System.out.println("El motor leido es "+m.getDescripcion());
    }
    
}
