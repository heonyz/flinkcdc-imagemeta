CREATE DATABASE IF NOT EXISTS db_1;
CREATE DATABASE IF NOT EXISTS db_2;
CREATE DATABASE IF NOT EXISTS db_3;


USE db_1;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE factory (
    factory_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    factory_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE inspection_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    factory_id INT NOT NULL,
    image_path TEXT NOT NULL,
    inspection_time DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (factory_id) REFERENCES factory(factory_id) ON DELETE CASCADE
);

CREATE TABLE detection_result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    image_id INT NOT NULL,
    defect_type VARCHAR(255) NOT NULL,
    defect_coordinates JSON NOT NULL,
    is_defective BOOLEAN NOT NULL,
    confidence_score DECIMAL(3, 2) NOT NULL CHECK (confidence_score BETWEEN 0.0 AND 1.0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (image_id) REFERENCES inspection_image(image_id) ON DELETE CASCADE
);


USE db_2;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE factory (
    factory_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    factory_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE inspection_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    factory_id INT NOT NULL,
    image_path TEXT NOT NULL,
    inspection_time DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (factory_id) REFERENCES factory(factory_id) ON DELETE CASCADE
);

CREATE TABLE detection_result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    image_id INT NOT NULL,
    defect_type VARCHAR(255) NOT NULL,
    defect_coordinates JSON NOT NULL,
    is_defective BOOLEAN NOT NULL,
    confidence_score DECIMAL(3, 2) NOT NULL CHECK (confidence_score BETWEEN 0.0 AND 1.0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (image_id) REFERENCES inspection_image(image_id) ON DELETE CASCADE
);


USE db_3;

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE factory (
    factory_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    factory_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE inspection_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    factory_id INT NOT NULL,
    image_path TEXT NOT NULL,
    inspection_time DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (factory_id) REFERENCES factory(factory_id) ON DELETE CASCADE
);

CREATE TABLE detection_result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    image_id INT NOT NULL,
    defect_type VARCHAR(255) NOT NULL,
    defect_coordinates JSON NOT NULL,
    is_defective BOOLEAN NOT NULL,
    confidence_score DECIMAL(3, 2) NOT NULL CHECK (confidence_score BETWEEN 0.0 AND 1.0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (image_id) REFERENCES inspection_image(image_id) ON DELETE CASCADE
);



USE db_1;


INSERT INTO user (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eva', 'eva@example.com'),
('Frank', 'frank@example.com'),
('Grace', 'grace@example.com'),
('Hannah', 'hannah@example.com'),
('Ian', 'ian@example.com'),
('Jack', 'jack@example.com');


INSERT INTO factory (user_id, factory_name, location) VALUES
(1, 'Factory A', 'Location X'),
(2, 'Factory B', 'Location Y'),
(3, 'Factory C', 'Location Z'),
(4, 'Factory D', 'Location W'),
(5, 'Factory E', 'Location V'),
(6, 'Factory F', 'Location U'),
(7, 'Factory G', 'Location T'),
(8, 'Factory H', 'Location S'),
(9, 'Factory I', 'Location R'),
(10, 'Factory J', 'Location Q');


INSERT INTO inspection_image (factory_id, image_path, inspection_time) VALUES
(1, '/images/factoryA_1.jpg', '2023-01-01 10:00:00'),
(2, '/images/factoryB_1.jpg', '2023-01-02 11:00:00'),
(3, '/images/factoryC_1.jpg', '2023-01-03 12:00:00'),
(4, '/images/factoryD_1.jpg', '2023-01-04 13:00:00'),
(5, '/images/factoryE_1.jpg', '2023-01-05 14:00:00'),
(6, '/images/factoryF_1.jpg', '2023-01-06 15:00:00'),
(7, '/images/factoryG_1.jpg', '2023-01-07 16:00:00'),
(8, '/images/factoryH_1.jpg', '2023-01-08 17:00:00'),
(9, '/images/factoryI_1.jpg', '2023-01-09 18:00:00'),
(10, '/images/factoryJ_1.jpg', '2023-01-10 19:00:00');


INSERT INTO detection_result (image_id, defect_type, defect_coordinates, is_defective, confidence_score) VALUES
(1, 'Crack', '{"x": 10, "y": 20}', TRUE, 0.95),
(2, 'Dent', '{"x": 30, "y": 40}', FALSE, 0.85),
(3, 'Scratch', '{"x": 50, "y": 60}', TRUE, 0.90),
(4, 'Hole', '{"x": 70, "y": 80}', TRUE, 0.92),
(5, 'Corrosion', '{"x": 15, "y": 25}', FALSE, 0.88),
(6, 'Fracture', '{"x": 35, "y": 45}', TRUE, 0.97),
(7, 'Bend', '{"x": 55, "y": 65}', FALSE, 0.75),
(8, 'Discoloration', '{"x": 75, "y": 85}', TRUE, 0.89),
(9, 'Warping', '{"x": 20, "y": 30}', FALSE, 0.80),
(10, 'Overheating', '{"x": 40, "y": 50}', TRUE, 0.93);


USE db_2;


INSERT INTO user (name, email) VALUES
('Oliver', 'oliver@example.com'),
('Sophia', 'sophia@example.com'),
('Liam', 'liam@example.com'),
('Emma', 'emma@example.com'),
('Noah', 'noah@example.com'),
('Ava', 'ava@example.com'),
('Elijah', 'elijah@example.com'),
('Isabella', 'isabella@example.com'),
('James', 'james@example.com'),
('Mia', 'mia@example.com');


INSERT INTO factory (user_id, factory_name, location) VALUES
(1, 'Blue Steel Factory', 'New York'),
(2, 'Sunrise Manufacturing', 'Los Angeles'),
(3, 'Evergreen Plant', 'Chicago'),
(4, 'Oceanic Industries', 'Houston'),
(5, 'Mountain Works', 'Phoenix'),
(6, 'Galaxy Foundry', 'Philadelphia'),
(7, 'Nova Assembly', 'San Antonio'),
(8, 'Stellar Forge', 'San Diego'),
(9, 'Lunar Processing', 'Dallas'),
(10, 'Solar Refineries', 'San Jose');


INSERT INTO inspection_image (factory_id, image_path, inspection_time) VALUES
(1, '/images/blue_steel_1.jpg', '2023-02-01 09:00:00'),
(2, '/images/sunrise_1.jpg', '2023-02-02 10:00:00'),
(3, '/images/evergreen_1.jpg', '2023-02-03 11:00:00'),
(4, '/images/oceanic_1.jpg', '2023-02-04 12:00:00'),
(5, '/images/mountain_1.jpg', '2023-02-05 13:00:00'),
(6, '/images/galaxy_1.jpg', '2023-02-06 14:00:00'),
(7, '/images/nova_1.jpg', '2023-02-07 15:00:00'),
(8, '/images/stellar_1.jpg', '2023-02-08 16:00:00'),
(9, '/images/lunar_1.jpg', '2023-02-09 17:00:00'),
(10, '/images/solar_1.jpg', '2023-02-10 18:00:00');


INSERT INTO detection_result (image_id, defect_type, defect_coordinates, is_defective, confidence_score) VALUES
(1, 'Fracture', '{"x": 12, "y": 34}', TRUE, 0.87),
(2, 'Scratch', '{"x": 45, "y": 67}', FALSE, 0.78),
(3, 'Dent', '{"x": 89, "y": 23}', TRUE, 0.92),
(4, 'Crack', '{"x": 56, "y": 78}', TRUE, 0.85),
(5, 'Discoloration', '{"x": 21, "y": 43}', FALSE, 0.74),
(6, 'Warping', '{"x": 34, "y": 65}', TRUE, 0.88),
(7, 'Overheating', '{"x": 76, "y": 54}', TRUE, 0.91),
(8, 'Hole', '{"x": 43, "y": 32}', FALSE, 0.83),
(9, 'Corrosion', '{"x": 65, "y": 87}', TRUE, 0.89),
(10, 'Deformation', '{"x": 23, "y": 76}', TRUE, 0.94);


USE db_3;

INSERT INTO user (name, email) VALUES
('Luna', 'luna@example.com'),
('Ethan', 'ethan@example.com'),
('Charlotte', 'charlotte@example.com'),
('Mason', 'mason@example.com'),
('Amelia', 'amelia@example.com'),
('Logan', 'logan@example.com'),
('Harper', 'harper@example.com'),
('Lucas', 'lucas@example.com'),
('Ella', 'ella@example.com'),
('Benjamin', 'benjamin@example.com');


INSERT INTO factory (user_id, factory_name, location) VALUES
(1, 'Zenith Manufacturing', 'Seattle'),
(2, 'Pioneer Workshop', 'Denver'),
(3, 'Vista Engineering', 'Austin'),
(4, 'Horizon Mechanics', 'Columbus'),
(5, 'Aurora Production', 'Fort Worth'),
(6, 'Echo Plant', 'Charlotte'),
(7, 'Spectrum Systems', 'San Francisco'),
(8, 'Vertex Assembly', 'Indianapolis'),
(9, 'Quantum Industries', 'Washington'),
(10, 'Prime Tech', 'Boston');


INSERT INTO inspection_image (factory_id, image_path, inspection_time) VALUES
(1, '/images/zenith_1.jpg', '2023-03-01 08:30:00'),
(2, '/images/pioneer_1.jpg', '2023-03-02 09:45:00'),
(3, '/images/vista_1.jpg', '2023-03-03 10:50:00'),
(4, '/images/horizon_1.jpg', '2023-03-04 11:35:00'),
(5, '/images/aurora_1.jpg', '2023-03-05 12:20:00'),
(6, '/images/echo_1.jpg', '2023-03-06 13:15:00'),
(7, '/images/spectrum_1.jpg', '2023-03-07 14:10:00'),
(8, '/images/vertex_1.jpg', '2023-03-08 15:05:00'),
(9, '/images/quantum_1.jpg', '2023-03-09 16:00:00'),
(10, '/images/prime_1.jpg', '2023-03-10 17:30:00');


INSERT INTO detection_result (image_id, defect_type, defect_coordinates, is_defective, confidence_score) VALUES
(1, 'Crack', '{"x": 11, "y": 22}', TRUE, 0.88),
(2, 'Fracture', '{"x": 33, "y": 44}', FALSE, 0.76),
(3, 'Dent', '{"x": 55, "y": 66}', TRUE, 0.89),
(4, 'Scratch', '{"x": 77, "y": 88}', TRUE, 0.92),
(5, 'Discoloration', '{"x": 99, "y": 11}', FALSE, 0.73),
(6, 'Warping', '{"x": 12, "y": 34}', TRUE, 0.91),
(7, 'Overheating', '{"x": 56, "y": 78}', TRUE, 0.95),
(8, 'Hole', '{"x": 90, "y": 21}', FALSE, 0.84),
(9, 'Corrosion', '{"x": 23, "y": 45}', TRUE, 0.87),
(10, 'Deformation', '{"x": 67, "y": 89}', TRUE, 0.93);
