package createReviews;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;

public class dish {
    
    public String dish;
    public float dish_price;
    public String category;
    public int dish_id;
    
    public float price_floor;
    public float price_ceiling;
    
    public String review_year;
    public String review_quarter;
    public float avg_overall;
    public float avg_quality;
    public float avg_price;
    public int review_count;
    
    public ArrayList<String> dish_names = new ArrayList<>();
    public ArrayList<Integer> dish_ids = new ArrayList<>();
    public ArrayList<String> dish_categories = new ArrayList<>();
    public ArrayList<Float> dish_prices = new ArrayList<>();

    public dish(){}
    
    public List<String>  getDishes()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;
      List<String> multipleDishes = new ArrayList<>();
       try
      {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

        System.out.println("Connection is Successful");

        pst = con.prepareStatement("SELECT d.dish_name AS g_dish FROM dish d WHERE d.category = ?");
        pst.setString(1, category);
       

        rst = pst.executeQuery();

        while (rst.next()) 
        {
          multipleDishes.add(rst.getString("g_dish"));
        }

       return multipleDishes;
 
      }
     catch(Exception e)
      {
        System.out.println(e.getMessage());
        return multipleDishes;
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
        
    public int getDish()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
      
      try
      {
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

          System.out.println("Connection is Successful");
          pst = con.prepareStatement("SELECT d.dish_name AS g_dish FROM dish d");
          rst = pst.executeQuery();
          
          while(rst.next())
          {
              String compare_dish = rst.getString("g_dish");
              if(dish.equalsIgnoreCase(compare_dish))
              {
                  return 1;
              }
          }    
          return 0;
          
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
    public int deleteDish()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
         try
        {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

            System.out.println("Connection is Successful");
          
            pst = con.prepareStatement("DELETE FROM dish_review WHERE dish_id = (SELECT dish_id FROM dish WHERE dish_name = ?)");
            pst.setString(1, dish);
            pst.executeUpdate();

            pst = con.prepareStatement("DELETE FROM dish WHERE dish_name = ?");

            pst.setString(1, dish);
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
    
    public int addDish()
    {
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rst = null;  
        try
        {
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

          System.out.println("Connection is Successful");
          pst = con.prepareStatement("INSERT INTO dish(dish_name, dish_price, category) VALUES(?,?,?)");
          
          pst.setString(1,dish);
          pst.setFloat(2, dish_price);
          pst.setString(3, category);
          
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
    
    public ArrayList<String> get_dishList(){
        //Clears all contents of dishes
        dish_names = new ArrayList<>();
        try{
            String dishName;
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT dish_name FROM dish");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                dishName = rst.getString("dish_name");
                dish_names.add(dishName);
            }
            
            pstmt.close();
            conn.close();
            return dish_names;
        } catch (Exception e){
            System.out.println("Could not retrieve dish names");
            return null;
        }
    }
    
    public ArrayList<Integer> get_dishIds(){
        //Clears all contents of dishes
        dish_ids = new ArrayList<>();
        
        try{
            int dishID;
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT dish_id FROM dish");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                dishID = rst.getInt("dish_id");
                dish_ids.add(dishID);
            }
            
            pstmt.close();
            conn.close();
            return dish_ids;
        } catch (Exception e){
            System.out.println("Could not retrieve dish IDs");
            return null;
        }
    }
    
    public ArrayList<String> get_dishCategories(){
        dish_categories = new ArrayList<>();
        
        dish_categories.add("Soup");
        dish_categories.add("Salad");
        dish_categories.add("Main course");
        dish_categories.add("Pasta");
        dish_categories.add("Sandwiches");
        dish_categories.add("Sides");
        dish_categories.add("Dessert");
        dish_categories.add("Special");
        
        return dish_categories;
    }
    
    public int searchDishes(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            dish_names.clear();
            dish_ids.clear();
            dish_categories.clear();
            dish_prices.clear();
            
            boolean is2nd = false;
            String statement = "SELECT d.dish_id, d.dish_name, d.dish_price, d.category FROM dish d WHERE";
            
            if(!category.equals("")){
                statement = statement + " d.category = '" + category + "'";
                is2nd = true;
            }
            
            if(price_ceiling != -1){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " d.dish_price < " + price_ceiling;
            }
            
            if(price_floor != -1){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " d.dish_price > " + price_floor;
            }
            
            System.out.println(statement);
            PreparedStatement pstmt = conn.prepareStatement(statement);
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next()){
                dish_names.add(rst.getString("d.dish_name"));
                dish_ids.add(rst.getInt("d.dish_id"));
                dish_prices.add(rst.getFloat("d.dish_price"));
                dish_categories.add(rst.getString("d.category"));
            }
            
            pstmt.close();
            conn.close();
            
            if (dish_ids.isEmpty()){
                System.out.println("Gone");
                return 2;
            } else {
                System.out.println("1");
                return 1;
            }
            
        } catch (Exception e){
            return 0;
        }
    }
    
    public int viewDish(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT dish_id, dish_name, dish_price, category FROM dish WHERE dish_id = ?");
            pstmt.setInt(1, dish_id);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                dish = rst.getString("dish_name");
                dish_price = rst.getFloat("dish_price");
                category = rst.getString("category");
                System.out.println(dish + "," + dish_price + "," + category);
            }
            
            pstmt = conn.prepareStatement("SELECT d.dish_id, YEAR(dr.time_of_upload) AS review_year, QUARTER(dr.time_of_upload) AS review_quarter, AVG(dr.overall_rating) AS avg_overall, AVG(dr.quality_rating) AS avg_quality, AVG(dr.price_rating) AS avg_price, COUNT(dr.review_id) AS review_count " +
                                          "FROM	dish d " +
                                          "LEFT JOIN dish_review dr ON d.dish_id = dr.dish_id " +
                                          "WHERE d.dish_id = ? " +
                                          "GROUP BY d.dish_id, review_year, review_quarter");
            pstmt.setInt(1, dish_id);
            rst = pstmt.executeQuery();
            while(rst.next()){
                review_year = rst.getString("review_year");
                review_quarter = rst.getString("review_quarter");
                try {
                    avg_overall = rst.getFloat("avg_overall");
                } catch (Exception e){
                    avg_overall = 0;
                }
                try {
                    avg_quality = rst.getFloat("avg_quality");
                } catch (Exception e){
                    avg_quality = 0;
                }
                try {
                    avg_price = rst.getFloat("avg_price");
                } catch (Exception e){
                    avg_price = 0;
                }
                try {
                    review_count = rst.getInt("review_count");
                } catch (Exception e){
                    review_count = 0;
                }
            }
            
            System.out.println(review_year + "," + review_quarter + "," + avg_overall + "," + avg_quality + "," + avg_price + "," + review_count);
            
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e){
            System.out.println("Error");
            return 0;
        }
    }
    
    public int updateDish(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE dish SET dish_price = ?, category = ? WHERE dish_id = ?");
            pstmt.setFloat(1, dish_price);
            pstmt.setString(2, category);
            pstmt.setInt(3, dish_id);
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e){
            return 0;
        }
    }
    
    public static void main(String args[])
    {
        dish d = new dish();
        d.dish_id = 9002;
        d.viewDish();
    
    }
}
