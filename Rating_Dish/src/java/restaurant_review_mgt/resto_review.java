package restaurant_review_mgt;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 * 
 *  
 */

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

public class resto_review {
    // fields   
    public String rating;
    public String rating_type;
    public String review_text;
    public String review_date;
    public String user_name;
    public int review_id;
    public int profile_id;
    public int count;
    public int average;
    
    //list of restaurant reviews
    public ArrayList<String> rating_list = new ArrayList<>();
    public ArrayList<String> review_textlist = new ArrayList<>();
    public ArrayList<String> review_datelist = new ArrayList<>();
    public ArrayList<String> user_namelist = new ArrayList<>();
    public ArrayList<Integer> review_idlist = new ArrayList<>();
    public ArrayList<Integer> profile_idlist = new ArrayList<>();
    
    public ArrayList<Integer> count_list = new ArrayList<>();
    public ArrayList<Integer> average_list = new ArrayList<>();
    public ArrayList<String> rating_typelist = new ArrayList<>();
    
    public resto_review(){}
    
    public int get_profile_id(String username){
        try{
            // code here interacts with database
            
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT profile_id FROM profile_info WHERE user_name = ?");
            pstmt.setString(1, username);
            
            ResultSet rst = pstmt.executeQuery(); 
            while (rst.next()){
                profile_id = rst.getInt("profile_id");
            }


            
            pstmt.close();
            conn.close();
            
            return profile_id;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
    }
    
    public int restaurant_review_list(){
        try{
            // code here interacts with database
            
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT review_id, overall_rating, review_text, review_date, profile_id, user_name FROM resto_review");
            ResultSet rst = pstmt.executeQuery();
            
            review_idlist.clear();
            rating_list.clear();
            review_textlist.clear(); 
            review_datelist.clear();   
            profile_idlist.clear();  
            user_namelist.clear();
            
            while (rst.next()){
                review_id = rst.getInt("review_id");
                rating = rst.getString("overall_rating");
                review_text = rst.getString("review_text");
                review_date = rst.getString("review_date");
                profile_id = rst.getInt("profile_id");
                user_name = rst.getString("user_name");
                
                
                review_idlist.add(review_id);
                rating_list.add(rating);
                review_textlist.add(review_text); 
                review_datelist.add(review_date);   
                profile_idlist.add(profile_id);     
                user_namelist.add(user_name);
            }

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
    }
    
    public int restaurant_review_create(){
        try{  
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            //  2.1 to get the next review_id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(review_id) + 1 AS newID FROM resto_review");
            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()){
                review_id = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO resto_review (overall_rating, review_text, review_date, profile_id, user_name) VALUE (?, ?, NOW(), ?, ?)");
            pstmt.setString(1, rating);
            pstmt.setString(2, review_text);
            pstmt.setInt(3, profile_id);
            pstmt.setString(4, user_name);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            return 1;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
    }
    
    public int restaurant_review_update(){
        try{
            // code here interacts with database
            
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE resto_review SET overall_rating = ?, review_text = ?, review_date = NOW() WHERE review_id = ?");

            pstmt.setString(1, rating);
            pstmt.setString(2, review_text);
            pstmt.setInt(3, review_id);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return 1;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
    }
    
    public int restaurant_review_delete(){
        try{
            // code here interacts with database
            
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM resto_review WHERE review_id = ?");
            pstmt.setInt(1, review_id);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return 1;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
        
    }
    
    public int restaurant_review_search(String userName, String rating, String startDate, String endDate){
        try {
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            review_idlist.clear();
            rating_list.clear();
            review_textlist.clear(); 
            review_datelist.clear();   
            profile_idlist.clear();  
            user_namelist.clear();
            
            boolean is2nd = false;
            String statement = "SELECT rr.review_id, rr.overall_rating, rr.review_text, rr.review_date, p.user_name "
                                                          + "FROM resto_review rr "
                                                          + "JOIN profile_info p ON rr.profile_id = p.profile_id "
                                                          + "WHERE";
            if (!userName.equals("")){
                statement = statement + " p.user_name = '" + userName + "'";
                is2nd = true;
            }
            
            if (!rating.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " rr.overall_rating = '" + rating + "'";
            }
            
            if (!startDate.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " DATE(rr.review_date) >= '" + startDate + "'";
            }
            
            if (!endDate.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " DATE(rr.review_date) <= '" + endDate + "'";
            }
            
            PreparedStatement pstmt = conn.prepareStatement(statement);
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next()){
                review_idlist.add(rst.getInt("rr.review_id"));
                user_namelist.add(rst.getString("p.user_name"));
                review_datelist.add(rst.getString("rr.review_date"));
                rating_list.add(rst.getString("rr.overall_rating"));
                review_textlist.add(rst.getString("rr.review_text"));
            }
            
            pstmt.close();
            conn.close();
            
            if (review_idlist.isEmpty()){
                System.out.println("Gone");
                return 2;
            } else {
                System.out.println("1");
                return 1;
            }
            
        } catch (Exception e){
            System.out.println("Error");
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int restaurant_review_report(){
        try{
            // code here interacts with database
            
            // 1. connect to our database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?useSSL=false&user=root&password=12345678");
            System.out.println("Connection Successful.");
            
            // 2. prepare sql statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT   overall_rating,\n" +
                                                            "    COUNT(*) AS ratingCount,\n" +
                                                            "    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM resto_review)) AS percentage\n" +
                                                            " FROM resto_review\n" +
                                                            " WHERE YEAR(review_date) = YEAR(NOW()) AND MONTH(review_date) = MONTH(NOW())" +
                                                            " GROUP BY overall_rating;");
            ResultSet rst = pstmt.executeQuery();
            
            count_list.clear();
            average_list.clear();
            rating_typelist.clear();

            
            while (rst.next()){
                rating_type = rst.getString("overall_rating");
                count = rst.getInt("ratingCount");
                average = rst.getInt("percentage");
                
                rating_typelist.add(rating_type);
                average_list.add(average);
                count_list.add(count); 
            }

            
            pstmt.close();
            conn.close();
            
            return 1;
            
        }catch (Exception e){
            System.out.println(e.getMessage());
           return 0;
        }
    }
    
    public static void main(String []args){
        resto_review R = new resto_review();
        
       /**
        R.rating = "Good";
        R.review_text = "eh panget";
        R.user_name = "hanna";
        R.profile_id = R.get_profile_id(R.user_name);
        System.out.println(R.profile_id);

        R.restaurant_review_create();
        
       R.user_name = "what";
       R.rating = "Poor";
       R.restaurant_review_search(R.user_name, R.rating, "2023-11-02", "2023-11-23");
       **/
       R.restaurant_review_report();
    } 
}
