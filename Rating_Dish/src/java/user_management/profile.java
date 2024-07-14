package user_management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
public class profile 
{
    public String username;
    public String new_username;
    public int id_profile;
    public String new_bio;
    public String bio;
    public int user_id;
    public String gender;
    
    public List<String> get_username()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      List<String> Username = new ArrayList<>();
      
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        
        pst = con.prepareStatement("SELECT p.user_name AS g_user_name FROM user_info u JOIN profile_info p ON p.user_id = u.user_id WHERE u.gender = ?");
        pst.setString(1, gender); // Use the user_id instead of mobile number for fetching

        rst = pst.executeQuery();
        while(rst.next())
        {
            Username.add(rst.getString("g_user_name"));
          
        }
         return Username;
      }
        
      catch(Exception e)
      {
        System.out.println(e.getMessage());
        return Username;
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
    
    public String getBio()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null; 
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT p.user_bio AS g_bio FROM profile_info p WHERE p.user_name = ?");
        pst.setString(1, username);
        rst = pst.executeQuery(); 
        
        if(rst.next())
        {
          bio = rst.getString("g_bio");
          return bio;
        }
        else
        {
          return bio;
        }
      }
        
      catch(Exception e)
      {
        System.out.println(e.getMessage());
        return bio;
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
    
    public int getProfileId()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT p.profile_id AS i_profile FROM profile_info p WHERE p.user_name = ?");
        pst.setString(1, username);
        rst = pst.executeQuery(); 
        
        if(rst.next())
        {
            id_profile = rst.getInt("i_profile");
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
                return 0;
            }            
         }
    }
    
    public int setBio()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
        
        System.out.println("Connection is Successful");
        getProfileId();
        pst = con.prepareStatement("UPDATE profile_info SET user_bio = ? WHERE profile_id = ? ");
        pst.setString(1,new_bio);
        pst.setInt(2,id_profile);
        
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
                return 0;
            }            
         }
       
    }        
    public int setUsername()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        
        getProfileId();
        pst = con.prepareStatement("UPDATE profile_info SET user_name = ? WHERE profile_id = ? ");
        pst.setString(1,new_username);
        pst.setInt(2,id_profile);
        
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
                return 0;
            }            
         }
       
    }
    public int profileSetUp()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
      try
      {

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT MAX(user_id) AS reference FROM user_info");
        rst = pst.executeQuery();
        while(rst.next())
        {
           user_id = rst.getInt("reference"); 
        }
        
        pst = con.prepareStatement("INSERT INTO profile_info (user_name, user_bio, user_id) VALUES(?,?,?)");

        pst.setString(1,username);
        pst.setString(2,bio);
        pst.setInt(3,user_id);

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
    public int isUsernameTaken()
    {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rst = null;
         try
        {
     
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

          System.out.println("Connection is Successful");
          pst = con.prepareStatement("SELECT user_name FROM profile_info WHERE user_name = ?");
          
          String entered_username = username;
          
          pst.setString(1,entered_username);
          rst = pst.executeQuery();
          
          if(rst.next())
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
    
       public int getUserId()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        pst = con.prepareStatement("SELECT u.user_id AS g_user_id FROM profile_info p JOIN user_info u ON p.user_id = u.user_id  WHERE p.user_name = ?");
        pst.setString(1, username);
        rst = pst.executeQuery(); 
        
        if(rst.next())
        {
            user_id = rst.getInt("g_user_id");
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
                return 0;
            }            
         }
    }
    
    public int deleteProfile()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      
      try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");
        getUserId();
        getProfileId();
        
            pst = con.prepareStatement("DELETE FROM mobile_number WHERE user_id = ?");
            pst.setInt(1, user_id);
            pst.executeUpdate();

            // Step 3: Delete from account_info table(ok na to)
            pst = con.prepareStatement("DELETE FROM account_info WHERE user_id = ?");
            pst.setInt(1, user_id);
            pst.executeUpdate();

            // Step 4: Delete from resto_review table(ok na to)
            pst = con.prepareStatement("DELETE FROM resto_review WHERE user_name = ?");
            pst.setString(1, username);
            pst.executeUpdate();

            // Step 5: Delete from dish_review table(ok na to)
            pst = con.prepareStatement("DELETE FROM dish_review WHERE profile_id = ?");
            pst.setInt(1, id_profile);
            pst.executeUpdate();

            // Step 6: Delete from profile_info table
            pst = con.prepareStatement("DELETE FROM profile_info WHERE user_name = ?");
            pst.setString(1, username);
            pst.executeUpdate();
            
            // Step 4: Delete from user_info table (optional, depending on your use case)
            pst = con.prepareStatement("DELETE FROM user_info WHERE user_id = ?");
            pst.setInt(1, user_id);
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
    
    public static void main(String args[])
    {
        
    }
            
}
