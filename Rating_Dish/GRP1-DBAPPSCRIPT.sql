-- Drop existing tables
DROP TABLE IF EXISTS resto_review, dish_review, dish, profile_info, mobile_number, account_info, user_info;

-- Create the user_info table
CREATE TABLE IF NOT EXISTS user_info (
  first_name      VARCHAR(45) NOT NULL,
  last_name       VARCHAR(45) NOT NULL,
  middle_initial  VARCHAR(45) NOT NULL,
  gender          ENUM('Male', 'Female', 'Non-binary', 'Prefer not to say') NOT NULL,
  birthday        DATE NOT NULL,
  user_id         INT AUTO_INCREMENT NOT NULL,
  PRIMARY KEY     (user_id)
);

-- Create the account_info table
CREATE TABLE IF NOT EXISTS account_info (
  account_id          INT AUTO_INCREMENT NOT NULL,
  email               VARCHAR(45) NOT NULL,
  account_password    VARCHAR(45) NOT NULL,
  registration_date   DATE NOT NULL,
  last_login          DATE NOT NULL,
  user_id             INT NOT NULL,
  PRIMARY KEY         (account_id, email),
  FOREIGN KEY         (user_id) REFERENCES user_info(user_id)
);

-- Create the mobile_number table
CREATE TABLE IF NOT EXISTS mobile_number (
  mobile_number   VARCHAR(45) NOT NULL,
  user_id         INT NOT NULL,
  PRIMARY KEY     (mobile_number),
  FOREIGN KEY     (user_id) REFERENCES user_info(user_id)
);

-- Create the profile_info table
CREATE TABLE IF NOT EXISTS profile_info (
  profile_id    INT AUTO_INCREMENT NOT NULL,
  user_name     VARCHAR(45) NOT NULL,
  user_bio      VARCHAR(200) NOT NULL,
  user_id       INT NOT NULL,
  PRIMARY KEY   (profile_id, user_name),
  FOREIGN KEY   (user_id) REFERENCES user_info(user_id)
);

-- Create the dish table
CREATE TABLE IF NOT EXISTS dish (
  dish_id         INT AUTO_INCREMENT NOT NULL,
  dish_name       VARCHAR(45) NOT NULL,
  dish_price      DECIMAL(10, 2) NOT NULL,
  category        ENUM('Soup', 'Salad', 'Main course', 'Pasta', 'Sandwiches', 'Sides', 'Dessert', 'Special') NOT NULL,
  PRIMARY KEY     (dish_id)
);

-- Create the dish_review table
CREATE TABLE IF NOT EXISTS dish_review (
  review_id      	INT AUTO_INCREMENT NOT NULL,
  overall_rating    INT NOT NULL,
  quality_rating	INT NOT NULL,
  price_rating		INT NOT NULL,
  review_text    	VARCHAR(500) NOT NULL,
  time_of_upload    DATETIME NOT NULL,
  profile_id     	INT NOT NULL,
  dish_id	 		INT NOT NULL,
  PRIMARY KEY    	(review_id),
  FOREIGN KEY    	(profile_id) REFERENCES profile_info(profile_id),
  FOREIGN KEY	 	(dish_id) REFERENCES dish(dish_id)
);

-- Create the restaurant_review table
CREATE TABLE IF NOT EXISTS resto_review (
  review_id      	INT AUTO_INCREMENT NOT NULL,
  overall_rating    ENUM('Excellent', 'Good', 'Average', 'Fair', 'Poor') NOT NULL,
  review_text    	VARCHAR(200) NOT NULL,
  review_date    	DATETIME NOT NULL,
  profile_id     	INT NOT NULL,
  user_name     	VARCHAR(45) NOT NULL,
  
  PRIMARY KEY    	(review_id),
  CONSTRAINT fk_user
    FOREIGN KEY (profile_id, user_name)  
      REFERENCES profile_info (profile_id, user_name)
);

INSERT INTO user_info (first_name, last_name, middle_initial, gender, birthday, user_id)
VALUES
('Bernard', 'Dimero', 'T', 'Male', '2004-02-08', 1),
('Mark', 'Mallari', 'C', 'Male', '2004-05-20', 2),
('Hanna', 'Angela', 'A', 'Female', '2004-06-21', 3),
('Bob', 'Smith', 'L', 'Male', '1998-09-22', 4),
('Diana', 'Martinez', 'K', 'Female', '1980-07-11', 5);

INSERT INTO account_info (account_id, email, account_password, registration_date, last_login, user_id)
VALUES
(101, 'bernard@gmail.com', 'bernard101', '2022-03-10', '2022-03-11', 1),
(102, 'mark@gmail.com', 'mark202', '2022-05-15', '2022-05-20', 2),
(103, 'hanna@gmail.com', 'hanna303', '2022-07-22', '2022-07-24', 3),
(104, 'bob@gmail.com', 'bob404', '2022-09-05', '2022-09-06', 4),
(105, 'diana@gmail.com', 'diana505', '2022-11-12', '2022-11-15', 5);

INSERT INTO profile_info (profile_id, user_name, user_bio, user_id)
VALUES
(1001, 'garuru', 'hello!', 1),
(1002, 'qmork', 'i like games', 2),
(1003, 'anne', 'programming<3', 3),
(1004, 'b0b', 'i am BOB', 4),
(1005, 'Diana<3', '<3333', 5);

INSERT INTO mobile_number (mobile_number, user_id)
VALUES
('9270251712', 1),
('55512345678', 1),
('20794069589', 2),
('31457890324', 2),
('30123456782', 3),
('28765432112', 3),
('55678901256', 4),
('10876543218', 4),
('41516863211', 5),
('12890911297', 5);

INSERT INTO dish (dish_id, dish_name, dish_price, category) 
VALUES
(1, '1pc Chickenjoy Ala carte', 91, 'Main course'),
(3, '4pc Chickenjoy Family Box Solo', 359, 'Main course'),
(4, 'Peach Mango 3 Pies To-Go', 147, 'Sides'),
(5, 'Chicken Sandwich Supreme', 164, 'Sandwiches'),
(6, 'Creamy Macaroni Soup', 80, 'Soup');

INSERT INTO dish_review (review_id, overall_rating, quality_rating, price_rating, review_text, time_of_upload, profile_id, dish_id) 
VALUES
(1, 5, 4, 3, 'Worth talaga!', '2023-11-21 21:24:46', 1001, 4),
(2, 3, 1, 2, 'Hindi masyado masarap :(', '2023-11-21 23:49:12', 1002, 6),
(3, 4, 4, 2, 'Masarap', '2023-11-22 9:14:35', 1003, 1),
(4, 2, 3, 1, 'Ang pangit ng lasa!', '2023-11-21 21:24:46', 1004, 1),
(5, 5, 5, 3, 'SOBRANG WORTH TALAGA!', '2023-11-21 21:24:46', 1005, 6);

INSERT INTO resto_review (review_id, overall_rating, review_text, review_date, profile_id, user_name) 
VALUES
(1, 'Average', 'It was okay.', '2004-02-08', 1001, 'garuru'),
(2, 'Average', 'Fine service and ambiance.', '2004-05-20', 1001, 'garuru'),
(3, 'Excellent', 'The quality of the food is amazing!', '2004-06-21', 1002, 'qmork'),
(4, 'Poor', 'The place and the food both smelled horrible.', '1998-09-22', 1002, 'qmork'),
(5, 'Poor', 'I caught food poisoning from this place.', '1980-07-11', 1002, 'qmork');

