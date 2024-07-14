/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user_management;

import java.sql.*;
import java.util.*;
import java.util.Date;


public class mobile 
{
    public String mobile;
    public String userName;
    public int got_user_id;
    
       public int removeMobile()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("DELETE FROM mobile_number WHERE mobile_number = ?");
        pst.setString(1, mobile);
        pst.executeUpdate();
        
        return 1;
          
      }
      catch(Exception e)
      {
        System.out.println(e.getMessage());
        return 0;
      }
      finally 
         {
            try
            { 
             if(rst != null)
             {
                rst.close();  
             }
             if(pst != null)
             {    
                pst.close();
             }
             if(con != null)
             {    
                con.close();
             }  
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
               
            }            
         }

    }
    public List<String>  getUserMobile()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      List<String> mobileNumbers = new ArrayList<>();
       try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT ui.user_id AS g_user_id FROM profile_info pi JOIN user_info ui ON pi.user_id = ui.user_id WHERE pi.user_name = ?");
        pst.setString(1, userName);
        rst = pst.executeQuery();
        
        if(rst.next())
        {    
            got_user_id  = rst.getInt("g_user_id");
        }
        
        pst = con.prepareStatement("SELECT m.mobile_number AS users_mobile FROM mobile_number m WHERE m.user_id = ?");
        pst.setInt(1, got_user_id); // Use the user_id instead of mobile number for fetching

        rst = pst.executeQuery();

        while (rst.next()) 
        {
          mobileNumbers.add(rst.getString("users_mobile"));
        }

       return mobileNumbers;
 
      }
     catch(Exception e)
      {
        System.out.println(e.getMessage());
        return mobileNumbers;
      }
      finally 
         {
            try
            { 
             if(rst != null)
             {
                rst.close();  
             }
             if(pst != null)
             {    
                pst.close();
             }
             if(con != null)
             {    
                con.close();
             }  
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
               
            }            
         }
        
    }
    public int setMobile()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT ui.user_id AS g_user_id FROM profile_info pi JOIN user_info ui ON pi.user_id = ui.user_id WHERE pi.user_name = ?");
        pst.setString(1, userName);
        rst = pst.executeQuery();
        if(rst.next())
        {    
            got_user_id  = rst.getInt("g_user_id");
        }
        pst = con.prepareStatement("INSERT INTO mobile_number (mobile_number,user_id) VALUES(?,?)");
        
        pst.setString(1, mobile);
        pst.setInt(2, got_user_id);
        pst.executeUpdate();
        
        return 1; 
      }
     catch(Exception e)
      {
        System.out.println(e.getMessage());
        return 0;
      }
      finally 
         {
            try
            { 
             if(rst != null)
             {
                rst.close();  
             }
             if(pst != null)
             {    
                pst.close();
             }
             if(con != null)
             {    
                con.close();
             }  
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }            
         }
    }
    
    public int getMobile()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
       try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT m.mobile_number FROM mobile_number m WHERE m.mobile_number = ?");
        pst.setString(1, mobile);
        
        rst = pst.executeQuery();
        if(rst.next())///returns 1 if the mobile number is taken 
        {
            return 1;
        } 
        else// returns not if hindi
        {
            return 0;
        }
      }
     catch(Exception e)
      {
        System.out.println(e.getMessage());
        return 0;
      }
      finally 
         {
            try
            { 
             if(rst != null)
             {
                rst.close();  
             }
             if(pst != null)
             {    
                pst.close();
             }
             if(con != null)
             {    
                con.close();
             }  
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }            
         }
    }
    
    public static void main(String args[])
    {
   
     
    }
    
}
