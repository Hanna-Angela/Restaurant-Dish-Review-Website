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
import java.text.SimpleDateFormat;


public class account 
{
    public String password;
    public String verify_password;
    public String email;
    public String last_login;
    public String registration_date;
    public int user_id;
    public String username;
    
    public int set_logDate()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null; 
      try
      {
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
          System.out.println("Connection is Successful");
          
          pst = con.prepareStatement("UPDATE account_info SET last_login = ? WHERE email = ? ");
          
          String date = get_date();
          
          String entered_email = email;
          
          pst.setString(1,date);
          pst.setString(2, entered_email);
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
    
    public int getEmail()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
       try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT a.email AS g_email FROM account_info a JOIN user_info u ON a.user_id = u.user_id JOIN profile_info p ON p.user_id = u.user_id WHERE a.email = ?" );
        
        String entered_email = email;
        pst.setString(1,entered_email);
        
        rst = pst.executeQuery();
        if(rst.next())
        {
           email = rst.getString("g_email");
           return 1;
        }
        else
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
    public int isEight()
    {
        try
        {
            if(password.length() <= 7)
            {
                return 1;
            }
            else
            {
                return 0;
            }
                
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public int getUsername()
    {   
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
       
       try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT p.user_name AS g_username FROM account_info a JOIN user_info u ON a.user_id = u.user_id JOIN profile_info p ON p.user_id = u.user_id WHERE a.email = ?" );
        
        String entered_email = email;
        pst.setString(1,entered_email);
        
        rst = pst.executeQuery();
        if(rst.next())
        {
           username = rst.getString("g_username");
           return 1;
        }
        else
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
    public String get_date()
    {
      Date currentDate = new Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String formattedDate = dateFormat.format(currentDate);
      
      return formattedDate;
      
    }
    public int login_credentials()
    {
        try
        {
          Connection con;
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

          System.out.println("Connection is Successful");
          PreparedStatement pst = con.prepareStatement("SELECT email, account_password FROM account_info WHERE email = ?");
          
          String entered_email = email;
          
          pst.setString(1,entered_email);
          ResultSet rst = pst.executeQuery();
          
          if(rst.next())
          {
              String active_email = rst.getString("email");
              verify_password = rst.getString("account_password");
              
              if(password.equals(verify_password))
              {    
                  pst.close();
                  con.close();
                  rst.close();
            
                  return 1;
              }
              else
              {
                  return 0;
              }
          }
          else
          {
              return 0;
          }
        }
        catch(Exception e)
        {
         System.out.println(e.getMessage());
         return 0;   
        }
        
    }
    public int password_verification()
    {
      try
      {    
        boolean value = password.equals(verify_password);
        if(value)
        {
          return 1;
        }
      
        else
        {
            return 0;
        }
      }
      catch(Exception e)
      {
        System.out.println(e.getMessage());
        return 0;
      }
     }
    
    public int account_assignment()
    {
      try
      {
  
        registration_date = get_date();
        last_login = get_date();
        Connection con;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        PreparedStatement pst = con.prepareStatement("SELECT MAX(user_id) AS reference FROM user_info");
        ResultSet rst = pst.executeQuery();
        while(rst.next())
        {
           user_id = rst.getInt("reference"); 
        }
        
        pst = con.prepareStatement("INSERT INTO account_info (email, account_password, registration_date, last_login, user_id) VALUES(?,?,?,?,?)");

        pst.setString(1,email);
        pst.setString(2,password);
        pst.setString(3,registration_date);
        pst.setString(4,last_login);
        pst.setInt(5,user_id);

        pst.executeUpdate();

        pst.close();
        con.close();
        rst.close();
            
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
       
        
    }     
}
