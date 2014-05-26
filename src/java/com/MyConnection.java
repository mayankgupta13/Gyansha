/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

/**
 *
 * @author Administrator
 */
import java.sql.*;
public class MyConnection {
    Connection c;
    public Connection getConnection()
    {
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");	
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return c;
    }
}
