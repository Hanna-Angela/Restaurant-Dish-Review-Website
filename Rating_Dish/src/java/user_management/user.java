package user_management;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author cocxd
 */
import java.sql.*;
import java.util.*;
import java.util.Date;
public class user 
{
  public String first_name;
  public String last_name;
  public String middle_initial;
  public String birthdate;
  public String gender;
    
    public int register_user()
    {
        try
        {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
     
            System.out.println("Connection is Successful");
            PreparedStatement pst = con.prepareStatement("INSERT INTO user_info (first_name, last_name, middle_initial, gender, birthday) VALUES(?,?,?,?,?)");
            pst.setString(1,first_name);
            pst.setString(2,last_name);
            pst.setString(3,middle_initial);
            pst.setString(4,gender);
            pst.setString(5,birthdate);
            
            pst.executeUpdate();
            
            pst.close();
            con.close();
            
            return 1;
                    
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
        
 
    }
    public static void main (String args[])
    {
        user U = new user();
        U.register_user();
    }
}
