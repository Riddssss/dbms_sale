-- Database creation and usage
CREATE DATABASE saler3;
USE saler3;

-- Creating User table
CREATE TABLE Userproductcategory (
    uid INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    dob DATE,
    age INT,
    location VARCHAR(100)
);

-- Creating Category table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Creating Brand table
CREATE TABLE Brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    brand_mail VARCHAR(100),
    store_location VARCHAR(100),
    sale_info VARCHAR(255),
    coupons VARCHAR(255),
    sale_dates VARCHAR(255)
);

-- Creating Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_info VARCHAR(255),
    product_image VARCHAR(255),
    availability VARCHAR(50),
    price INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Creating BrandAdmin table
CREATE TABLE BrandAdmin (
    admin_id INT PRIMARY KEY,
    admin_email VARCHAR(100),
    legal_documents VARCHAR(255),
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

-- Creating table for relationship between Brand and Product (One Brand can have many Products)
CREATE TABLE BrandProduct (
    brand_id INT,
    product_id INT,
    PRIMARY KEY (brand_id, product_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Creating table for relationship between User and Product (User can purchase multiple Products)
CREATE TABLE UserProduct (
    uid INT,
    product_id INT,
    purchase_date DATE,
    PRIMARY KEY (uid, product_id),
    FOREIGN KEY (uid) REFERENCES User(uid),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Creating table for relationship between User and Brand (Users can subscribe to multiple Brands)
CREATE TABLE UserBrand (
    uid INT,
    brand_id INT,
    subscription_date DATE,
    PRIMARY KEY (uid, brand_id),
    FOREIGN KEY (uid) REFERENCES User(uid),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

-- Creating table for relationship between Category and Brand (Brands can belong to multiple Categories)
CREATE TABLE BrandCategory (
    brand_id INT,
    category_id INT,
    PRIMARY KEY (brand_id, category_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Inserting values into User table
INSERT INTO User (uid, name, email, phone_number, dob, age, location)
VALUES
(1, 'Anushka Kenia', 'kenia.anushka@gmail.com', '9920987564', '1990-05-10', 18, 'Mumbai'),
(2, 'Divyam Shah', 'divyam42@gmail.com', '9876543217', '1985-12-01', 39, 'Delhi'),
(3, 'Dev Bhatt', 'dev.bhatt@yahoo.com', '9978657892', '1992-03-15', 32, 'Mumbai'),
(4, 'Sambhavi Lodaya', 'samlodaya@yahoo.com', '9823658876', '1987-07-22', 15, 'Pune'),
(5, 'Pia Sejpal', 'piasejpal@gmail.com', '9934776621', '1995-11-30', 29, 'Nagpur'),
(6, 'Krish Ghalla', 'krishkrish@gmail.com.com', '9807659888', '1990-05-10', 45, 'Nashik'),
(7, 'Pratham Sejpal', 'prathams@gmail.com', '9324205770', '1985-12-01', 20, 'Delhi'),
(8, 'Pall Dedhia', 'palld@yahoo.com', '8169194906', '1992-03-15', 30, 'Agra'),
(9, 'Devansh Bhatt', 'devansh21@yahoo.com', '8769067854', '1987-07-22',13, 'Hyderabad'),
(10, 'Veer Patel', 'patel.veer@gmail.com', '9619942112', '1995-11-30', 23, 'Chennai');

-- Inserting values into Category table
INSERT INTO Category (category_id, category_name)
VALUES
(1, 'Clothes'),
(2, 'Electronics'),
(3, 'Sports'),
(4, 'Food');

-- Inserting values into Brand table (24 brands)
INSERT INTO Brand (brand_id, brand_name, brand_mail, store_location, sale_info, coupons, sale_dates)  
VALUES  
    (1, 'Gap', 'contact@gap.com', 'Mumbai', '50% off on Clothes', 'COUPON50', '2024-12-01 to 2024-12-31'),  
    (2, 'Sony', 'support@sony.com', 'Chennai', '30% off on Electronics', 'COUPON30', '2024-11-01 to 2024-11-30'),  
    (3, 'Nike', 'support@nike.com', 'Hyderabad', 'Buy 1 Get 1 Free', 'COUPONB1G1', '2024-10-01 to 2024-10-15'),  
    (4, 'Adidas', 'support@adidas.com', 'Pune', '20% off on Sports items', 'COUPON20', '2024-09-15 to 2024-09-30'),  
    (5, 'Kraft', 'contact@kraft.com', 'Nashik', 'Free delivery on orders over $100', 'COUPONFREEDEL', '2024-08-01 to 2024-08-31'),  
    (6, 'Zara', 'contact@zara.com', 'Patna', '25% off on Clothes', 'COUPON25', '2024-11-15 to 2024-11-30'),  
    (7, 'Samsung', 'support@samsung.com', 'Mumbai', '10% off on Electronics', 'COUPON10', '2024-10-10 to 2024-10-25'),  
    (8, 'Apple', 'support@apple.com', 'Chennai', 'Free shipping on Electronics', 'COUPONSHIP', '2024-09-01 to 2024-09-10'),  
    (9, 'Under Armour', 'contact@underarmour.com', 'Hyderabad', 'Discount on all Sports items', 'COUPONSPORT', '2024-08-15 to 2024-08-31'),  
    (10, 'Nestlé', 'contact@nestle.com', 'Pune', '20% off on Food items', 'COUPONFOOD', '2024-07-01 to 2024-07-15'),  
    (11, 'H&M', 'contact@hm.com', 'Nashik', '50% off on Clothes', 'COUPONCLOTHES', '2024-12-01 to 2024-12-31'),  
    (12, 'Panasonic', 'support@panasonic.com', 'Patna', 'Exclusive on Electronics', 'COUPONELECTRO', '2024-11-01 to 2024-11-30'),  
    (13, 'Reebok', 'support@reebok.com', 'Mumbai', 'Sports sale 30%', 'COUPONSPORT30', '2024-10-01 to 2024-10-15'),  
    (14, 'PepsiCo', 'contact@pepsico.com', 'Chennai', 'Free Food items delivery', 'COUPONFREEFOOD', '2024-09-15 to 2024-09-30'),  
    (15, 'Levi\'s', 'contact@levis.com', 'Hyderabad', 'Buy 2 Get 1 Free Clothes', 'COUPONB2G1', '2024-08-01 to 2024-08-31'),  
    (16, 'LG Electronics', 'support@lge.com', 'Pune', 'Special offers on Electronics', 'COUPONSPECIAL', '2024-07-10 to 2024-07-25'),  
    (17, 'Puma', 'support@puma.com', 'Nashik', '40% off on Sports items', 'COUPON40', '2024-06-15 to 2024-06-30'),  
    (18, 'Tyson Foods', 'contact@tysonfoods.com', 'Patna', 'Food discounts 10%', 'COUPON10FOOD', '2024-05-01 to 2024-05-15'),  
    (19, 'Uniqlo', 'contact@uniqlo.com', 'Mumbai', '50% off on Clothes', 'COUPON50CLOTHES', '2024-04-01 to 2024-04-15'),  
    (20, 'General Mills', 'contact@generalmills.com', 'Chennai', 'Huge Electronics sale', 'COUPONELECTRONICSHUGE', '2024-03-15 to 2024-03-31'),  
    (21, 'Asics', 'support@asics.com', 'Hyderabad', 'Sports sale 15%', 'COUPONSPORT15', '2024-02-01 to 2024-02-15'),  
    (22, 'Kellogg\'s', 'contact@kelloggs.com', 'Pune', 'Food sale 5%', 'COUPONFOOD5', '2024-01-15 to 2024-01-31'),  
    (23, 'Tommy Hilfiger', 'contact@tommyhilfiger.com', 'Nashik', 'Clothes at 25% off', 'COUPON25CLOTHES', '2024-12-15 to 2024-12-31'),  
    (24, 'HP', 'support@hp.com', 'Patna', 'Electronics holiday discount', 'COUPONHOLIDAY', '2024-11-10 to 2024-11-25');  

-- Inserting values into BrandCategory table to assign each brand to a category (6 brands per category)
INSERT INTO BrandCategory (brand_id, category_id)  
VALUES  
    -- Clothes  
    (1, 1), (6, 1), (11, 1), (15, 1), (19, 1), (23, 1),  
    -- Electronics  
    (2, 2), (7, 2), (8, 2), (12, 2), (16, 2), (24, 2),  
    -- Sports  
    (3, 3), (4, 3), (9, 3), (13, 3), (17, 3), (21, 3),  
    -- Food  
    (5, 4), (10, 4), (14, 4), (18, 4), (22, 4), (20, 4);  

-- Inserting values into Product table with 6 products per brand (144 products in total)
INSERT INTO Product (product_id, product_name, product_info, product_image, availability, price, category_id)
VALUES
    -- Products for Brand 1 (Gap - Category ID: 1)
    (1, 'Cotton T-shirt', 'Comfortable cotton T-shirt', 'cotton_tshirt.jpg', 'In Stock', 900, 1),
    (2, 'Slim Fit Jeans', 'Denim jeans, slim fit', 'slim_fit_jeans.jpg', 'In Stock', 1200, 1),
    (3, 'Hoodie', 'Warm and cozy hoodie', 'hoodie.jpg', 'Out of Stock', 1800, 1),
    (4, 'Jacket', 'Water-resistant jacket', 'jacket.jpg', 'In Stock', 2500, 1),
    (5, 'Beanie', 'Knitted winter beanie', 'beanie.jpg', 'In Stock', 300, 1),
    (6, 'Socks', 'Cotton socks', 'socks.jpg', 'In Stock', 100, 1),

    -- Products for Brand 2 (Sony - Category ID: 2)
    (7, '4K TV', 'High-resolution 4K TV', '4k_tv.jpg', 'Out of Stock', 45000, 2),
    (8, 'Bluetooth Speaker', 'Portable Bluetooth speaker', 'bluetooth_speaker.jpg', 'In Stock', 2500, 2),
    (9, 'Noise Cancelling Headphones', 'Over-ear noise-cancelling headphones', 'headphones.jpg', 'In Stock', 12000, 2),
    (10, 'Digital Camera', 'Compact digital camera', 'camera.jpg', 'In Stock', 20000, 2),
    (11, 'Soundbar', 'High-quality soundbar', 'soundbar.jpg', 'In Stock', 8000, 2),
    (12, 'Gaming Console', 'Popular gaming console', 'console.jpg', 'Out of Stock', 30000, 2),

    -- Products for Brand 3 (Nike - Category ID: 3)
    (13, 'Running Shoes', 'Lightweight running shoes', 'running_shoes.jpg', 'In Stock', 5000, 3),
    (14, 'Basketball Shoes', 'High-top basketball shoes', 'basketball_shoes.jpg', 'In Stock', 6000, 3),
    (15, 'Track Pants', 'Comfortable track pants', 'track_pants.jpg', 'Out of Stock', 1500, 3),
    (16, 'Sports Jacket', 'Windproof sports jacket', 'sports_jacket.jpg', 'In Stock', 3000, 3),
    (17, 'Backpack', 'Durable sports backpack', 'backpack.jpg', 'In Stock', 2000, 3),
    (18, 'Fitness Band', 'Activity tracking fitness band', 'fitness_band.jpg', 'In Stock', 2500, 3),

    -- Products for Brand 4 (Adidas - Category ID: 3)
    (19, 'Football Shoes', 'Football cleats for grass surfaces', 'football_shoes.jpg', 'In Stock', 5500, 3),
    (20, 'Joggers', 'Breathable joggers for workouts', 'joggers.jpg', 'In Stock', 1800, 3),
    (21, 'Yoga Mat', 'Non-slip yoga mat', 'yoga_mat.jpg', 'In Stock', 1000, 3),
    (22, 'Water Bottle', 'Insulated sports water bottle', 'water_bottle.jpg', 'Out of Stock', 600, 3),
    (23, 'Running Shorts', 'Lightweight running shorts', 'running_shorts.jpg', 'In Stock', 700, 3),
    (24, 'Sweatband', 'Sweat-wicking headband', 'sweatband.jpg', 'In Stock', 200, 3),

    -- Products for Brand 5 (Kraft - Category ID: 4)
    (25, 'Mac and Cheese', 'Instant mac and cheese', 'mac_cheese.jpg', 'In Stock', 150, 4),
    (26, 'Tomato Ketchup', 'Classic tomato ketchup', 'ketchup.jpg', 'In Stock', 100, 4),
    (27, 'Mayonnaise', 'Creamy mayonnaise', 'mayonnaise.jpg', 'Out of Stock', 200, 4),
    (28, 'Cheese Slices', 'Processed cheese slices', 'cheese_slices.jpg', 'In Stock', 300, 4),
    (29, 'Peanut Butter', 'Smooth peanut butter', 'peanut_butter.jpg', 'In Stock', 250, 4),
    (30, 'BBQ Sauce', 'Smoky BBQ sauce', 'bbq_sauce.jpg', 'In Stock', 150, 4),

    -- Products for Brand 6 (Zara - Category ID: 1)
    (31, 'Blazer', 'Slim fit blazer', 'blazer.jpg', 'In Stock', 4000, 1),
    (32, 'Formal Pants', 'Classic fit formal pants', 'formal_pants.jpg', 'In Stock', 2000, 1),
    (33, 'Dress Shirt', 'Crisp white dress shirt', 'dress_shirt.jpg', 'Out of Stock', 1500, 1),
    (34, 'Casual Trousers', 'Stretchable casual trousers', 'casual_trousers.jpg', 'In Stock', 1200, 1),
    (35, 'Polo T-shirt', 'Comfortable polo t-shirt', 'polo_tshirt.jpg', 'In Stock', 800, 1),
    (36, 'Sneakers', 'Versatile white sneakers', 'sneakers.jpg', 'Out of Stock', 2500, 1),

   -- Products for Brand 7 (Samsung - Category ID: 2)
    (37, 'Galaxy Smartphone', 'Latest Samsung Galaxy model', 'galaxy_smartphone.jpg', 'In Stock', 80000, 2),
    (38, 'Smart TV', '55-inch Samsung Smart TV', 'smart_tv.jpg', 'In Stock', 65000, 2),
    (39, 'Washing Machine', 'Front-load washing machine', 'washing_machine.jpg', 'Out of Stock', 30000, 2),
    (40, 'Refrigerator', 'Double door refrigerator', 'refrigerator.jpg', 'In Stock', 50000, 2),
    (41, 'Microwave Oven', 'Convection microwave oven', 'microwave_oven.jpg', 'In Stock', 15000, 2),
    (42, 'Air Conditioner', '1.5 Ton split AC', 'air_conditioner.jpg', 'Out of Stock', 40000, 2),

    -- Products for Brand 8 (Apple - Category ID: 2)
    (43, 'iPhone', 'Apple iPhone latest model', 'iphone.jpg', 'In Stock', 90000, 2),
    (44, 'MacBook Pro', '16-inch MacBook Pro', 'macbook_pro.jpg', 'Out of Stock', 150000, 2),
    (45, 'iPad', 'Apple iPad with Retina display', 'ipad.jpg', 'In Stock', 60000, 2),
    (46, 'Apple Watch', 'Series 6 Apple Watch', 'apple_watch.jpg', 'In Stock', 45000, 2),
    (47, 'AirPods', 'Wireless AirPods with charging case', 'airpods.jpg', 'In Stock', 20000, 2),
    (48, 'HomePod', 'Smart speaker by Apple', 'homepod.jpg', 'Out of Stock', 35000, 2),

    -- Products for Brand 9 (Under Armour - Category ID: 3)
    (49, 'Training Shoes', 'Comfortable training shoes', 'training_shoes.jpg', 'In Stock', 4000, 3),
    (50, 'Sports Cap', 'Breathable sports cap', 'sports_cap.jpg', 'In Stock', 800, 3),
    (51, 'Gym Shorts', 'Stretchable gym shorts', 'gym_shorts.jpg', 'Out of Stock', 1500, 3),
    (52, 'Compression Shirt', 'Tight-fitting compression shirt', 'compression_shirt.jpg', 'In Stock', 1200, 3),
    (53, 'Running Socks', 'High-performance running socks', 'running_socks.jpg', 'In Stock', 500, 3),
    (54, 'Arm Sleeves', 'Moisture-wicking arm sleeves', 'arm_sleeves.jpg', 'Out of Stock', 600, 3),

    -- Products for Brand 10 (Nestlé - Category ID: 4)
    (55, 'Nescafe Coffee', 'Instant coffee powder', 'nescafe.jpg', 'In Stock', 300, 4),
    (56, 'Maggi Noodles', '2-minute instant noodles', 'maggi.jpg', 'In Stock', 50, 4),
    (57, 'KitKat', 'Chocolate wafer', 'kitkat.jpg', 'Out of Stock', 100, 4),
    (58, 'Milk Powder', 'Instant milk powder', 'milk_powder.jpg', 'In Stock', 250, 4),
    (59, 'Fruit Yogurt', 'Fruit-flavored yogurt', 'fruit_yogurt.jpg', 'In Stock', 200, 4),
    (60, 'Milo', 'Chocolate malt drink', 'milo.jpg', 'Out of Stock', 150, 4),

    -- Products for Brand 11 (H&M - Category ID: 1)
    (61, 'Denim Jacket', 'Classic denim jacket', 'denim_jacket.jpg', 'In Stock', 3000, 1),
    (62, 'Casual Shirt', 'Cotton casual shirt', 'casual_shirt.jpg', 'Out of Stock', 1200, 1),
    (63, 'Chinos', 'Slim-fit chinos', 'chinos.jpg', 'In Stock', 1500, 1),
    (64, 'Skirt', 'A-line skirt', 'skirt.jpg', 'In Stock', 1000, 1),
    (65, 'Formal Blazer', 'Formal office blazer', 'formal_blazer.jpg', 'In Stock', 4000, 1),
    (66, 'Cardigan', 'Soft knit cardigan', 'cardigan.jpg', 'Out of Stock', 1500, 1),

    -- Products for Brand 12 (Panasonic - Category ID: 2)
    (67, 'Electric Iron', 'Lightweight electric iron', 'electric_iron.jpg', 'In Stock', 1500, 2),
    (68, 'Mixer Grinder', 'Multi-purpose mixer grinder', 'mixer_grinder.jpg', 'In Stock', 3000, 2),
    (69, 'LED Light', 'Energy-saving LED light', 'led_light.jpg', 'Out of Stock', 300, 2),
    (70, 'Hair Dryer', 'Compact hair dryer', 'hair_dryer.jpg', 'In Stock', 2000, 2),
    (71, 'Toaster', '2-slice toaster', 'toaster.jpg', 'In Stock', 1500, 2),
    (72, 'Electric Kettle', '1.5L electric kettle', 'electric_kettle.jpg', 'Out of Stock', 1200, 2),

    -- Products for Brand 13 (Reebok - Category ID: 3)
    (73, 'Fitness Shoes', 'High-grip fitness shoes', 'fitness_shoes.jpg', 'In Stock', 4500, 3),
    (74, 'Sports Water Bottle', 'Reebok branded bottle', 'sports_water_bottle.jpg', 'In Stock', 700, 3),
    (75, 'Athletic Socks', 'Performance athletic socks', 'athletic_socks.jpg', 'Out of Stock', 500, 3),
    (76, 'Training Gloves', 'Anti-slip training gloves', 'training_gloves.jpg', 'In Stock', 1200, 3),
    (77, 'Jogging Tights', 'Stretchable jogging tights', 'jogging_tights.jpg', 'In Stock', 1600, 3),
    (78, 'Gym Bag', 'Large capacity gym bag', 'gym_bag.jpg', 'Out of Stock', 2500, 3),

    -- Products for Brand 14 (PepsiCo - Category ID: 4)
    (79, 'Pepsi', 'Carbonated soft drink', 'pepsi.jpg', 'In Stock', 50, 4),
    (80, 'Lays Chips', 'Potato chips', 'lays_chips.jpg', 'In Stock', 20, 4),
    (81, 'Doritos', 'Tortilla chips', 'doritos.jpg', 'Out of Stock', 30, 4),
    (82, 'Mountain Dew', 'Citrus-flavored soda', 'mountain_dew.jpg', 'In Stock', 40, 4),
    (83, '7Up', 'Lemon-lime soda', '7up.jpg', 'In Stock', 40, 4),
    (84, 'Tropicana Juice', 'Orange juice', 'tropicana.jpg', 'Out of Stock', 100, 4),

    -- Products for Brand 15 (Levi's - Category ID: 1)
    (85, '501 Original Jeans', 'Iconic Levi\'s jeans', '501_jeans.jpg', 'In Stock', 2500, 1),
    (86, 'Trucker Jacket', 'Classic denim trucker jacket', 'trucker_jacket.jpg', 'In Stock', 3500, 1),
    (87, 'Graphic Tee', 'Levi\'s logo tee', 'graphic_tee.jpg', 'Out of Stock', 1200, 1),
    (88, 'Cargo Shorts', 'Casual cargo shorts', 'cargo_shorts.jpg', 'In Stock', 1500, 1),
    (89, 'Denim Shirt', 'Western denim shirt', 'denim_shirt.jpg', 'In Stock', 1800, 1),
    (90, 'Classic Belt', 'Leather belt', 'classic_belt.jpg', 'Out of Stock', 800, 1),

-- Products for Brand 16 (LG Electronics - Category ID: 2)
    (91, 'Smart Refrigerator', 'Wi-Fi enabled refrigerator', 'smart_refrigerator.jpg', 'In Stock', 60000, 2),
    (92, 'OLED TV', '65-inch 4K OLED TV', 'oled_tv.jpg', 'Out of Stock', 90000, 2),
    (93, 'Washing Machine', 'Front load washing machine', 'washing_machine.jpg', 'In Stock', 35000, 2),
    (94, 'Microwave Oven', 'Convection microwave', 'microwave.jpg', 'In Stock', 12000, 2),
    (95, 'Air Purifier', 'Smart air purifier', 'air_purifier.jpg', 'Out of Stock', 20000, 2),
    (96, 'Soundbar', 'High-definition soundbar', 'soundbar.jpg', 'In Stock', 15000, 2),

    -- Products for Brand 17 (Puma - Category ID: 3)
    (97, 'Running Shoes', 'Breathable running shoes', 'running_shoes.jpg', 'In Stock', 4000, 3),
    (98, 'Track Jacket', 'Lightweight track jacket', 'track_jacket.jpg', 'In Stock', 2500, 3),
    (99, 'Gym Shorts', 'Elastic waist gym shorts', 'gym_shorts.jpg', 'Out of Stock', 1500, 3),
    (100, 'Yoga Pants', 'Comfortable yoga pants', 'yoga_pants.jpg', 'In Stock', 2000, 3),
    (101, 'Duffel Bag', 'Spacious sports duffel bag', 'duffel_bag.jpg', 'In Stock', 2200, 3),
    (102, 'Baseball Cap', 'Adjustable baseball cap', 'baseball_cap.jpg', 'Out of Stock', 800, 3),

    -- Products for Brand 18 (Tyson Foods - Category ID: 4)
    (103, 'Chicken Nuggets', 'Frozen chicken nuggets', 'chicken_nuggets.jpg', 'In Stock', 500, 4),
    (104, 'Buffalo Wings', 'Spicy buffalo wings', 'buffalo_wings.jpg', 'In Stock', 700, 4),
    (105, 'Grilled Chicken Breast', 'Pre-cooked grilled chicken', 'grilled_chicken.jpg', 'Out of Stock', 600, 4),
    (106, 'Turkey Bacon', 'Lean turkey bacon', 'turkey_bacon.jpg', 'In Stock', 300, 4),
    (107, 'Chicken Sausage', 'Smoked chicken sausage', 'chicken_sausage.jpg', 'In Stock', 400, 4),
    (108, 'Beef Jerky', 'Original beef jerky', 'beef_jerky.jpg', 'Out of Stock', 800, 4),

    -- Products for Brand 19 (Uniqlo - Category ID: 1)
    (109, 'HeatTech Shirt', 'Heat-retaining long sleeve', 'heattech_shirt.jpg', 'In Stock', 1000, 1),
    (110, 'Down Jacket', 'Lightweight down jacket', 'down_jacket.jpg', 'Out of Stock', 3500, 1),
    (111, 'Lounge Pants', 'Soft lounge pants', 'lounge_pants.jpg', 'In Stock', 1200, 1),
    (112, 'Sweatshirt', 'Casual crew neck sweatshirt', 'sweatshirt.jpg', 'In Stock', 900, 1),
    (113, 'Ultra Stretch Jeans', 'Skinny fit jeans', 'stretch_jeans.jpg', 'In Stock', 1300, 1),
    (114, 'Padded Vest', 'Water-resistant padded vest', 'padded_vest.jpg', 'Out of Stock', 1800, 1),

    -- Products for Brand 20 (General Mills - Category ID: 4)
    (115, 'Cheerios', 'Whole grain oats cereal', 'cheerios.jpg', 'In Stock', 300, 4),
    (116, 'Nature Valley Bars', 'Granola bars', 'nature_valley.jpg', 'In Stock', 200, 4),
    (117, 'Lucky Charms', 'Marshmallow cereal', 'lucky_charms.jpg', 'Out of Stock', 400, 4),
    (118, 'Fiber One Bars', 'Fiber-rich snack bars', 'fiber_one.jpg', 'In Stock', 250, 4),
    (119, 'Bisquick Mix', 'Baking mix for pancakes', 'bisquick.jpg', 'In Stock', 150, 4),
    (120, 'Chex Mix', 'Savory snack mix', 'chex_mix.jpg', 'Out of Stock', 200, 4),

    -- Products for Brand 21 (Asics - Category ID: 3)
    (121, 'Gel-Kayano Shoes', 'Cushioned running shoes', 'gel_kayano.jpg', 'In Stock', 6000, 3),
    (122, 'Tennis Shoes', 'Court tennis shoes', 'tennis_shoes.jpg', 'In Stock', 5000, 3),
    (123, 'Sports Socks', 'Breathable sports socks', 'sports_socks.jpg', 'Out of Stock', 300, 3),
    (124, 'Running Jacket', 'Waterproof running jacket', 'running_jacket.jpg', 'In Stock', 2000, 3),
    (125, 'Athletic Shorts', 'Moisture-wicking shorts', 'athletic_shorts.jpg', 'In Stock', 1500, 3),
    (126, 'Headband', 'Stretchable headband', 'headband.jpg', 'Out of Stock', 500, 3),

    -- Products for Brand 22 (Kellogg's - Category ID: 4)
    (127, 'Corn Flakes', 'Classic corn flakes cereal', 'corn_flakes.jpg', 'In Stock', 150, 4),
    (128, 'Frosted Flakes', 'Sugar-coated flakes', 'frosted_flakes.jpg', 'In Stock', 200, 4),
    (129, 'Rice Krispies', 'Puffed rice cereal', 'rice_krispies.jpg', 'Out of Stock', 250, 4),
    (130, 'Special K', 'Low-calorie cereal', 'special_k.jpg', 'In Stock', 300, 4),
    (131, 'Pringles', 'Stackable potato chips', 'pringles.jpg', 'In Stock', 100, 4),
    (132, 'Pop-Tarts', 'Toaster pastries', 'pop_tarts.jpg', 'Out of Stock', 150, 4),

    -- Products for Brand 23 (Tommy Hilfiger - Category ID: 1)
    (133, 'Polo Shirt', 'Classic polo shirt', 'polo_shirt.jpg', 'In Stock', 2000, 1),
    (134, 'Denim Jeans', 'Slim-fit denim jeans', 'denim_jeans.jpg', 'Out of Stock', 3000, 1),
    (135, 'Crew Neck T-shirt', 'Soft cotton t-shirt', 'crew_neck_tshirt.jpg', 'In Stock', 1200, 1),
    (136, 'Sweater', 'Cable-knit sweater', 'sweater.jpg', 'In Stock', 3500, 1),
    (137, 'Chinos', 'Comfortable chinos', 'chinos.jpg', 'Out of Stock', 2500, 1),
    (138, 'Blazer', 'Tailored blazer', 'blazer.jpg', 'In Stock', 4000, 1),

    -- Products for Brand 24 (HP - Category ID: 2)
    (139, 'Laptop', 'High-performance laptop', 'hp_laptop.jpg', 'In Stock', 80000, 2),
    (140, 'Printer', 'Multi-function laser printer', 'hp_printer.jpg', 'Out of Stock', 15000, 2),
    (141, 'Gaming Mouse', 'Ergonomic gaming mouse', 'gaming_mouse.jpg', 'In Stock', 2500, 2),
    (142, 'Keyboard', 'Mechanical keyboard', 'keyboard.jpg', 'In Stock', 3000, 2),
    (143, 'Monitor', '27-inch LED monitor', 'monitor.jpg', 'Out of Stock', 12000, 2),
    (144, 'Docking Station', 'Universal docking station', 'docking_station.jpg', 'In Stock', 5000, 2);


-- Inserting values into BrandAdmin table with an admin for each brand
INSERT INTO BrandAdmin (admin_id, admin_email, legal_documents, brand_id)
VALUES
    (1, 'admin@gap.com', 'LegalDocGap', 1),
    (2, 'admin@sony.com', 'LegalDocSony', 2),
    (3, 'admin@nike.com', 'LegalDocNike', 3),
    (4, 'admin@adidas.com', 'LegalDocAdidas', 4),
    (5, 'admin@kraft.com', 'LegalDocKraft', 5),
    (6, 'admin@zara.com', 'LegalDocZara', 6),
    (7, 'admin@samsung.com', 'LegalDocSamsung', 7),
    (8, 'admin@apple.com', 'LegalDocApple', 8),
    (9, 'admin@underarmour.com', 'LegalDocUnderArmour', 9),
    (10, 'admin@nestle.com', 'LegalDocNestle', 10),
    (11, 'admin@hm.com', 'LegalDocHM', 11),
    (12, 'admin@panasonic.com', 'LegalDocPanasonic', 12),
    (13, 'admin@reebok.com', 'LegalDocReebok', 13),
    (14, 'admin@pepsico.com', 'LegalDocPepsiCo', 14),
    (15, 'admin@levis.com', 'LegalDocLevis', 15),
    (16, 'admin@lge.com', 'LegalDocLG', 16),
    (17, 'admin@puma.com', 'LegalDocPuma', 17),
    (18, 'admin@tysonfoods.com', 'LegalDocTyson', 18),
    (19, 'admin@uniqlo.com', 'LegalDocUniqlo', 19),
    (20, 'admin@generalmills.com', 'LegalDocGeneralMills', 20),
    (21, 'admin@asics.com', 'LegalDocAsics', 21),
    (22, 'admin@kelloggs.com', 'LegalDocKelloggs', 22),
    (23, 'admin@tommyhilfiger.com', 'LegalDocTommyHilfiger', 23),
    (24, 'admin@hp.com', 'LegalDocHP', 24);

-- Inserting values into BrandProduct relationship table for each product under each brand
INSERT INTO BrandProduct (brand_id, product_id)
VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
    (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12),
    (3, 13), (3, 14), (3, 15), (3, 16), (3, 17), (3, 18),
    (4, 19), (4, 20), (4, 21), (4, 22), (4, 23), (4, 24),
    (5, 25), (5, 26), (5, 27), (5, 28), (5, 29), (5, 30),
    (6, 31), (6, 32), (6, 33), (6, 34), (6, 35), (6, 36),
    (7, 37), (7, 38), (7, 39), (7, 40), (7, 41), (7, 42),
    (8, 43), (8, 44), (8, 45), (8, 46), (8, 47), (8, 48),
    (9, 49), (9, 50), (9, 51), (9, 52), (9, 53), (9, 54),
    (10, 55), (10, 56), (10, 57), (10, 58), (10, 59), (10, 60),
    (11, 61), (11, 62), (11, 63), (11, 64), (11, 65), (11, 66),
    (12, 67), (12, 68), (12, 69), (12, 70), (12, 71), (12, 72),
    (13, 73), (13, 74), (13, 75), (13, 76), (13, 77), (13, 78),
    (14, 79), (14, 80), (14, 81), (14, 82), (14, 83), (14, 84),
    (15, 85), (15, 86), (15, 87), (15, 88), (15, 89), (15, 90),
    (16, 91), (16, 92), (16, 93), (16, 94), (16, 95), (16, 96),
    (17, 97), (17, 98), (17, 99), (17, 100), (17, 101), (17, 102),
    (18, 103), (18, 104), (18, 105), (18, 106), (18, 107), (18, 108),
    (19, 109), (19, 110), (19, 111), (19, 112), (19, 113), (19, 114),
    (20, 115), (20, 116), (20, 117), (20, 118), (20, 119), (20, 120),
    (21, 121), (21, 122), (21, 123), (21, 124), (21, 125), (21, 126),
    (22, 127), (22, 128), (22, 129), (22, 130), (22, 131), (22, 132),
    (23, 133), (23, 134), (23, 135), (23, 136), (23, 137), (23, 138),
    (24, 139), (24, 140), (24, 141), (24, 142), (24, 143), (24, 144);



SELECT uid FROM User;
SELECT product_id FROM Product;
SELECT brand_id FROM Brand;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS=0;

-- Insert into UserProduct table
INSERT INTO UserProduct (uid, product_id, purchase_date)
VALUES
    (1, 1, '2024-09-01'),
    (2, 2, '2024-09-05'),
    (3, 3, '2024-09-10'),
    (4, 4, '2024-09-15'),
    (5, 5, '2024-09-20'),
    (6, 6, '2024-09-25'),
    (7, 7, '2024-10-01'),
    (8, 8, '2024-10-05'),
    (9, 9, '2024-10-10'),
    (10, 10, '2024-10-15'),
    (11, 11, '2024-10-20'),
    (12, 12, '2024-10-25'),
    (13, 13, '2024-11-01'),
    (14, 14, '2024-11-05'),
    (15, 15, '2024-11-10'),
    (16, 16, '2024-11-15'),
    (17, 17, '2024-11-20'),
    (18, 18, '2024-11-25'),
    (19, 19, '2024-12-01'),
    (20, 20, '2024-12-05'),
    (21, 21, '2024-12-10'),
    (22, 22, '2024-12-15'),
    (23, 23, '2024-12-20'),
    (24, 24, '2024-12-25');

-- Insert into UserBrand table
INSERT INTO UserBrand (uid, brand_id, subscription_date)
VALUES
    (1, 1, '2024-01-01'),
    (2, 2, '2024-02-01'),
    (3, 3, '2024-03-01'),
    (4, 4, '2024-04-01'),
    (5, 5, '2024-05-01'),
    (6, 6, '2024-06-01'),
    (7, 7, '2024-07-01'),
    (8, 8, '2024-08-01'),
    (9, 9, '2024-09-01'),
    (10, 10, '2024-10-01'),
    (11, 11, '2024-11-01');

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM user;
SELECT * FROM brand;
SELECT * FROM product;
