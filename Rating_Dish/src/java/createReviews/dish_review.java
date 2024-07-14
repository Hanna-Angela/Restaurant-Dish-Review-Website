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

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class dish_review {
    //Variables for the review table
    public int review_id;
    public int overall_rating;
    public int quality_rating;
    public int price_rating;
    public String review_text;
    public String time_of_upload;
    public int profile_id;
    public int dish_id;
    
    //Variables for recent review
    public String dish_name;
    public String user_name;
    public String dish_category;
    
    //ArrayLists
    public ArrayList<Integer> review_idList = new ArrayList<>();
    public ArrayList<String> user_nameList = new ArrayList<>();
    public ArrayList<String> time_of_uploadList = new ArrayList<>();
    public ArrayList<String> dish_nameList = new ArrayList<>();
    public ArrayList<Integer> overall_ratingList = new ArrayList<>();
    public ArrayList<Integer> quality_ratingList = new ArrayList<>();
    public ArrayList<Integer> price_ratingList = new ArrayList<>();
    public ArrayList<String> review_textList = new ArrayList<>();
    
    public ArrayList<Integer> profile_idList= new ArrayList<>();
    public ArrayList<String> rating_textList= new ArrayList<>();
    public ArrayList<Integer> dish_idList= new ArrayList<>();
    public ArrayList<String> dish_categoryList = new ArrayList<>();
    
    
    public dish_review(){}
    
    public boolean profileNametoId(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT p.profile_id FROM profile_info p WHERE p.user_name = ?");
            pstmt.setString(1, user_name);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                profile_id = rst.getInt("p.profile_id");
            }
            
            pstmt.close();
            conn.close();
            
            return true;
        } catch (Exception e){
            return false;
        }
    }
    
    public int upload_dishReview(){
        try{
            if (profileNametoId()){
                //Connects to database
                Connection conn;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");

                //Inserts data into the review table
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO dish_review (overall_rating, quality_rating, price_rating, review_text, time_of_upload, profile_id, dish_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
                pstmt.setInt(1, overall_rating);
                pstmt.setInt(2, quality_rating);
                pstmt.setInt(3, price_rating);
                pstmt.setString(4, review_text);

                LocalDateTime dt_now = LocalDateTime.now();
                DateTimeFormatter dt_format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                pstmt.setString(5, dt_now.format(dt_format));

                pstmt.setInt(6, profile_id);
                pstmt.setInt(7, dish_id);

                pstmt.executeUpdate();

                pstmt.close();
                conn.close();
            }
            return 1;
        } catch (Exception e){
            System.out.println("Error");
            return 0;
        }
    }
    
    public boolean get_recentDishReview(){
        try{
            //Connects to database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT dr.review_id, dr.overall_rating, dr.quality_rating, dr.price_rating, dr.review_text, dr.time_of_upload, p.user_name, d.dish_name, d.category "
                                                          + "FROM dish_review dr "
                                                          + "JOIN dish d ON dr.dish_id = d.dish_id " 
                                                          + "JOIN profile_info p ON dr.profile_id = p.profile_id "
                                                          + "WHERE dr.review_id = (SELECT MAX(review_id) FROM dish_review)");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                review_id = rst.getInt("dr.review_id");
                overall_rating = rst.getInt("dr.overall_rating");
                quality_rating = rst.getInt("dr.quality_rating");
                price_rating = rst.getInt("dr.price_rating");
                review_text = rst.getString("dr.review_text");
                time_of_upload = rst.getString("dr.time_of_upload");
                dish_name = rst.getString("d.dish_name");
                user_name = rst.getString("p.user_name");
                dish_category = rst.getString("d.category");
            }
            
            pstmt.close();
            conn.close();
            return true;
        } catch (Exception e){
            return false;
        }
    }
    
    public int searchDishReview(String userName, Integer dishId, String startDate, String endDate, String dishCategory){
        try {
            //Connects to database
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            review_idList.clear();
            user_nameList.clear();
            time_of_uploadList.clear();
            dish_nameList.clear();
            overall_ratingList.clear();
            quality_ratingList.clear();
            price_ratingList.clear();
            review_textList.clear();
            
            boolean is2nd = false;
            String statement = "SELECT dr.review_id, dr.overall_rating, dr.quality_rating, dr.price_rating, dr.review_text, dr.time_of_upload, p.user_name, d.dish_name, d.category "
                                                          + "FROM dish_review dr "
                                                          + "JOIN profile_info p ON dr.profile_id = p.profile_id "
                                                          + "JOIN dish d ON dr.dish_id = d.dish_id "
                                                          + "WHERE";
            if (!userName.equals("")){
                statement = statement + " p.user_name = '" + userName + "'";
                is2nd = true;
            }
            
            if (dishId != -1){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " dr.dish_id = '" + dishId + "'";
            }
            
            if (!startDate.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " DATE(dr.time_of_upload) >= '" + startDate + "'";
            }
            
            if (!endDate.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " DATE(dr.time_of_upload) <= '" + endDate + "'";
            }
            
            if (!dishCategory.equals("")){
                if (is2nd){
                    statement = statement + " AND";
                } else {
                    is2nd = true;
                }
                statement = statement + " d.category = '" + dishCategory +  "'";
            }
            
            PreparedStatement pstmt = conn.prepareStatement(statement);
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next()){
                review_idList.add(rst.getInt("dr.review_id"));
                user_nameList.add(rst.getString("p.user_name"));
                time_of_uploadList.add(rst.getString("dr.time_of_upload"));
                dish_nameList.add(rst.getString("d.dish_name"));
                overall_ratingList.add(rst.getInt("dr.overall_rating"));
                quality_ratingList.add(rst.getInt("dr.quality_rating"));
                price_ratingList.add(rst.getInt("dr.price_rating"));
                review_textList.add(rst.getString("dr.review_text"));
                dish_categoryList.add(rst.getString("d.category"));
            }
            
            pstmt.close();
            conn.close();
            
            if (review_idList.isEmpty()){
                System.out.println("Gone");
                return 2;
            } else {
                System.out.println("1");
                return 1;
            }
            
        } catch (Exception e){
            System.out.println("Error");
            return 0;
        }
    }
    
    public ArrayList<Integer> get_dishReviewIds(){
        //Clears all contents of dishes
        review_idList.clear();
        
        try{
            int reviewID;
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT review_id FROM dish_review");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                reviewID = rst.getInt("review_id");
                review_idList.add(reviewID);
            }
            
            pstmt.close();
            conn.close();
            return review_idList;
        } catch (Exception e){
            System.out.println("Could not retrieve reviews of dish IDs");
            return null;
        }
    }
    
    public int viewDishReview(int reviewId){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT	dr.review_id, p.user_name, d.dish_name, d.category, dr.time_of_upload, dr.overall_rating, dr.quality_rating, dr.price_rating, dr.review_text " +
                                                            "FROM	dish_review dr " +
                                                                        "JOIN dish d ON dr.dish_id = d.dish_id " +
                                                                        "JOIN profile_info p ON dr.profile_id = p.profile_id " +
                                                            "WHERE	dr.review_id = ?");
            pstmt.setInt(1, reviewId);
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                review_id = rst.getInt("dr.review_id");
                user_name = rst.getString("p.user_name");
                dish_name = rst.getString("d.dish_name");
                dish_category = rst.getString("d.category");
                time_of_upload = rst.getString("dr.time_of_upload");
                overall_rating = rst.getInt("dr.overall_rating");
                quality_rating = rst.getInt("dr.quality_rating");
                price_rating = rst.getInt("dr.price_rating");
                review_text = rst.getString("dr.review_text");
            }

            
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e){
            System.out.println("Could not retrieve reviews of dish IDs");
            return 0;
        }
    }
    
    public boolean updateDishReview(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE dish_review SET overall_rating = ?, quality_rating = ?, price_rating = ?, review_text = ? WHERE review_id = ?");
            pstmt.setInt(1, overall_rating);
            pstmt.setInt(2, quality_rating);
            pstmt.setInt(3, price_rating);
            pstmt.setString(4, review_text);
            pstmt.setInt(5, review_id);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            return true;
        } catch (Exception e){
            System.out.println("Error");
            return false;
        }
    }
    
    public boolean deleteDishReview(){
         try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Restaurant_Review?user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM dish_review WHERE review_id = ?");
            pstmt.setInt(1, review_id);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            return true;
        } catch (Exception e){
            System.out.println("Error");
            return false;
        }
    }
    
    /*
    public static void main(String[] args){
        dish_review r = new dish_review();
        
        r.review_id = 9;
        r.deleteDishReview();
    }*/
}
