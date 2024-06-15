CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    make VARCHAR(50) NOT NULL,    -- brand
    bodytype VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL CHECK (state IN ('new', 'used', 'accident', 'drowned', 'needs investments')),
    model VARCHAR(50) NOT NULL,
    fuel VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,         -- euro
    power INT NOT NULL,           -- hp (horsepower)
    torque INT NOT NULL,          -- newton meters (n/m)
    gearbox VARCHAR(20) NOT NULL, -- automate, manual
    color VARCHAR(30),
    upholstery VARCHAR(50),       -- materials for salon
    traction VARCHAR(10) NOT NULL, -- rwd, fwd, awd
    grade SMALLINT CHECK (grade >= 0 AND grade <= 10) -- from 0 to 10
);

INSERT INTO cars (make, bodytype, state, model, fuel, price, power, torque, gearbox, color, upholstery, traction, grade) VALUES
('Toyota', 'Sedan', 'new', 'Camry', 'Gasoline', 30000, 203, 250, 'Automatic', 'Red', 'Leather', 'FWD', 7),
('Honda', 'Sedan', 'new', 'Civic', 'Gasoline', 25000, 174, 220, 'Manual', 'Blue', 'Fabric', 'FWD', 8),
('Ford', 'Coupe', 'new', 'Mustang', 'Gasoline', 55000, 450, 410, 'Manual', 'Black', 'Leather', 'RWD', 9),
('Chevrolet', 'Hatchback', 'new', 'Bolt', 'Electric', 37000, 200, 360, 'Automatic', 'White', 'Fabric', 'FWD', 6),
('BMW', 'SUV', 'used', 'X5', 'Diesel', 70000, 335, 450, 'Automatic', 'Grey', 'Leather', 'AWD', 10),
('Audi', 'Sedan', 'new', 'A4', 'Gasoline', 42000, 252, 370, 'Automatic', 'Silver', 'Leather', 'AWD', 9),
('Mercedes', 'Sedan', 'new', 'C-Class', 'Gasoline', 50000, 255, 400, 'Automatic', 'Black', 'Leather', 'RWD', 9),
('Tesla', 'Sedan', 'new', 'Model 3', 'Electric', 50000, 283, 430, 'Automatic', 'Blue', 'Fabric', 'RWD', 10),
('Nissan', 'Hatchback', 'new', 'Leaf', 'Electric', 32000, 147, 320, 'Automatic', 'Green', 'Fabric', 'FWD', 6),
('Volkswagen', 'Hatchback', 'new', 'Golf', 'Diesel', 29000, 147, 250, 'Manual', 'White', 'Fabric', 'FWD', 7),
('Hyundai', 'Sedan', 'new', 'Elantra', 'Gasoline', 22000, 147, 179, 'Automatic', 'Red', 'Fabric', 'FWD', 6),
('Kia', 'SUV', 'new', 'Sorento', 'Gasoline', 40000, 290, 350, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Mazda', 'SUV', 'new', 'CX-5', 'Gasoline', 35000, 227, 310, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Subaru', 'Wagon', 'new', 'Outback', 'Gasoline', 36000, 182, 239, 'Automatic', 'Green', 'Fabric', 'AWD', 8),
('Jeep', 'SUV', 'used', 'Wrangler', 'Gasoline', 45000, 285, 260, 'Manual', 'Yellow', 'Fabric', '4WD', 8),
('Dodge', 'Sedan', 'used', 'Charger', 'Gasoline', 50000, 292, 353, 'Automatic', 'Black', 'Leather', 'RWD', 7),
('Lexus', 'SUV', 'new', 'RX', 'Hybrid', 60000, 308, 247, 'Automatic', 'Silver', 'Leather', 'AWD', 10),
('Infiniti', 'Sedan', 'used', 'Q50', 'Gasoline', 45000, 300, 295, 'Automatic', 'White', 'Leather', 'RWD', 8),
('Acura', 'Sedan', 'new', 'TLX', 'Gasoline', 42000, 272, 280, 'Automatic', 'Red', 'Leather', 'FWD', 7),
('Cadillac', 'SUV', 'new', 'Escalade', 'Gasoline', 85000, 420, 460, 'Automatic', 'Black', 'Leather', 'AWD', 9),
('Volvo', 'SUV', 'used', 'XC90', 'Hybrid', 70000, 400, 472, 'Automatic', 'Blue', 'Leather', 'AWD', 9),
('Porsche', 'Coupe', 'new', '911', 'Gasoline', 120000, 379, 450, 'Manual', 'Red', 'Leather', 'RWD', 10),
('Land Rover', 'SUV', 'used', 'Defender', 'Diesel', 80000, 296, 350, 'Automatic', 'Green', 'Leather', 'AWD', 8),
('Jaguar', 'Sedan', 'new', 'XF', 'Gasoline', 55000, 296, 295, 'Automatic', 'Black', 'Leather', 'RWD', 8),
('Alfa Romeo', 'Sedan', 'new', 'Giulia', 'Gasoline', 50000, 280, 306, 'Automatic', 'White', 'Leather', 'RWD', 8),
('Maserati', 'Sedan', 'used', 'Ghibli', 'Gasoline', 75000, 345, 369, 'Automatic', 'Blue', 'Leather', 'RWD', 9),
('Aston Martin', 'Coupe', 'new', 'DB11', 'Gasoline', 200000, 630, 700, 'Automatic', 'Silver', 'Leather', 'RWD', 10),
('Ferrari', 'Convertible', 'new', 'Portofino', 'Gasoline', 250000, 591, 560, 'Automatic', 'Red', 'Leather', 'RWD', 10),
('Lamborghini', 'Coupe', 'new', 'Huracan', 'Gasoline', 300000, 630, 600, 'Automatic', 'Yellow', 'Leather', 'AWD', 10),
('McLaren', 'Coupe', 'used', '720S', 'Gasoline', 300000, 710, 770, 'Automatic', 'Orange', 'Leather', 'RWD', 10),
('Bentley', 'SUV', 'new', 'Bentayga', 'Gasoline', 250000, 542, 568, 'Automatic', 'Green', 'Leather', 'AWD', 10),
('Rolls-Royce', 'Sedan', 'new', 'Phantom', 'Gasoline', 450000, 563, 664, 'Automatic', 'Black', 'Leather', 'RWD', 10),
('Genesis', 'Sedan', 'new', 'G70', 'Gasoline', 37000, 252, 260, 'Automatic', 'White', 'Leather', 'RWD', 7),
('Lincoln', 'SUV', 'used', 'Navigator', 'Gasoline', 90000, 450, 510, 'Automatic', 'Black', 'Leather', 'AWD', 9),
('Mini', 'Hatchback', 'new', 'Cooper', 'Gasoline', 30000, 189, 207, 'Manual', 'Blue', 'Leather', 'FWD', 7),
('Peugeot', 'Hatchback', 'new', '208', 'Diesel', 20000, 100, 250, 'Manual', 'Red', 'Fabric', 'FWD', 6),
('Renault', 'Hatchback', 'new', 'Clio', 'Gasoline', 22000, 130, 200, 'Manual', 'Silver', 'Fabric', 'FWD', 6),
('Fiat', 'Hatchback', 'new', '500', 'Electric', 25000, 118, 220, 'Automatic', 'Green', 'Fabric', 'FWD', 6),
('Suzuki', 'Hatchback', 'new', 'Swift', 'Gasoline', 18000, 89, 120, 'Manual', 'White', 'Fabric', 'FWD', 5),
('Mitsubishi', 'SUV', 'used', 'Outlander', 'Hybrid', 35000, 221, 332, 'Automatic', 'Black', 'Leather', 'AWD', 7),
('Toyota', 'SUV', 'used', 'Highlander', 'Gasoline', 50000, 295, 263, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Honda', 'SUV', 'new', 'CR-V', 'Gasoline', 35000, 190, 179, 'Automatic', 'Red', 'Leather', 'AWD', 8),
('Ford', 'SUV', 'new', 'Explorer', 'Gasoline', 45000, 300, 310, 'Automatic', 'White', 'Leather', 'AWD', 8),
('Chevrolet', 'SUV', 'used', 'Tahoe', 'Gasoline', 60000, 355, 383, 'Automatic', 'Black', 'Leather', '4WD', 8),
('BMW', 'Sedan', 'new', '3 Series', 'Gasoline', 50000, 255, 295, 'Automatic', 'Silver', 'Leather', 'RWD', 9),
('Audi', 'SUV', 'new', 'Q5', 'Gasoline', 50000, 261, 273, 'Automatic', 'Blue', 'Leather', 'AWD', 9),
('Mercedes-Benz', 'SUV', 'used', 'GLE', 'Gasoline', 75000, 362, 369, 'Automatic', 'White', 'Leather', 'AWD', 9),
('Nissan', 'Sedan', 'used', 'Altima', 'Gasoline', 24000, 188, 244, 'Automatic', 'Blue', 'Fabric', 'FWD', 7),
('Hyundai', 'SUV', 'new', 'Tucson', 'Gasoline', 31000, 181, 175, 'Automatic', 'Red', 'Fabric', 'AWD', 7),
('Kia', 'Sedan', 'new', 'Stinger', 'Gasoline', 40000, 365, 376, 'Automatic', 'Black', 'Leather', 'RWD', 9),
('Mazda', 'Sedan', 'new', 'Mazda6', 'Gasoline', 27000, 187, 250, 'Automatic', 'Blue', 'Fabric', 'FWD', 7),
('Subaru', 'SUV', 'new', 'Forester', 'Gasoline', 30000, 182, 176, 'Automatic', 'Green', 'Fabric', 'AWD', 8),
('Jeep', 'SUV', 'used', 'Grand Cherokee', 'Gasoline', 55000, 293, 260, 'Automatic', 'Yellow', 'Leather', 'AWD', 8),
('Dodge', 'SUV', 'used', 'Durango', 'Gasoline', 45000, 295, 260, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Lexus', 'Sedan', 'new', 'ES', 'Gasoline', 45000, 302, 267, 'Automatic', 'Silver', 'Leather', 'FWD', 9),
('Infiniti', 'SUV', 'used', 'QX60', 'Gasoline', 50000, 295, 270, 'Automatic', 'White', 'Leather', 'AWD', 8),
('Acura', 'SUV', 'new', 'MDX', 'Gasoline', 60000, 290, 267, 'Automatic', 'Red', 'Leather', 'AWD', 9),
('Cadillac', 'Sedan', 'new', 'CT6', 'Gasoline', 60000, 335, 385, 'Automatic', 'Black', 'Leather', 'AWD', 9),
('Volvo', 'Sedan', 'used', 'S60', 'Hybrid', 45000, 400, 472, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Porsche', 'SUV', 'new', 'Cayenne', 'Gasoline', 100000, 335, 332, 'Automatic', 'Red', 'Leather', 'AWD', 10),
('Land Rover', 'SUV', 'used', 'Range Rover', 'Diesel', 90000, 254, 600, 'Automatic', 'Green', 'Leather', 'AWD', 9),
('Jaguar', 'SUV', 'new', 'F-Pace', 'Gasoline', 65000, 247, 365, 'Automatic', 'Black', 'Leather', 'AWD', 9),
('Alfa Romeo', 'SUV', 'new', 'Stelvio', 'Gasoline', 50000, 280, 306, 'Automatic', 'White', 'Leather', 'AWD', 8),
('Maserati', 'SUV', 'used', 'Levante', 'Gasoline', 85000, 345, 369, 'Automatic', 'Blue', 'Leather', 'AWD', 9),
('Aston Martin', 'Sedan', 'new', 'Rapide', 'Gasoline', 200000, 552, 630, 'Automatic', 'Silver', 'Leather', 'RWD', 10),
('Ferrari', 'Coupe', 'new', 'F8 Tributo', 'Gasoline', 275000, 710, 770, 'Automatic', 'Red', 'Leather', 'RWD', 10),
('Lamborghini', 'SUV', 'new', 'Urus', 'Gasoline', 350000, 641, 850, 'Automatic', 'Yellow', 'Leather', 'AWD', 10),
('McLaren', 'Coupe', 'used', '570S', 'Gasoline', 200000, 562, 600, 'Automatic', 'Orange', 'Leather', 'RWD', 10),
('Bentley', 'Sedan', 'new', 'Flying Spur', 'Gasoline', 250000, 626, 664, 'Automatic', 'Green', 'Leather', 'AWD', 10),
('Rolls-Royce', 'SUV', 'new', 'Cullinan', 'Gasoline', 400000, 563, 664, 'Automatic', 'Black', 'Leather', 'AWD', 10),
('Genesis', 'SUV', 'new', 'GV80', 'Gasoline', 60000, 375, 391, 'Automatic', 'White', 'Leather', 'AWD', 9),
('Lincoln', 'Sedan', 'used', 'Continental', 'Gasoline', 50000, 400, 400, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Mini', 'SUV', 'new', 'Countryman', 'Gasoline', 35000, 189, 207, 'Manual', 'Blue', 'Leather', 'AWD', 7),
('Peugeot', 'Sedan', 'new', '508', 'Diesel', 30000, 160, 300, 'Automatic', 'Red', 'Fabric', 'FWD', 7),
('Renault', 'SUV', 'new', 'Kadjar', 'Gasoline', 30000, 160, 270, 'Manual', 'Silver', 'Fabric', 'FWD', 7),
('Fiat', 'SUV', 'new', '500X', 'Gasoline', 25000, 177, 215, 'Automatic', 'Green', 'Fabric', 'AWD', 6),
('Suzuki', 'SUV', 'new', 'Vitara', 'Gasoline', 28000, 140, 220, 'Manual', 'White', 'Fabric', 'AWD', 6),
('Mitsubishi', 'Sedan', 'used', 'Lancer', 'Gasoline', 25000, 168, 197, 'Manual', 'Black', 'Fabric', 'FWD', 7),
('Toyota', 'SUV', 'used', '4Runner', 'Gasoline', 45000, 270, 278, 'Automatic', 'Blue', 'Leather', '4WD', 8),
('Honda', 'SUV', 'new', 'Pilot', 'Gasoline', 40000, 280, 262, 'Automatic', 'Red', 'Leather', 'AWD', 8),
('Ford', 'SUV', 'new', 'Bronco', 'Gasoline', 50000, 310, 400, 'Automatic', 'White', 'Leather', '4WD', 9),
('Chevrolet', 'SUV', 'used', 'Suburban', 'Gasoline', 70000, 355, 383, 'Automatic', 'Black', 'Leather', '4WD', 8),
('BMW', 'Coupe', 'new', '4 Series', 'Gasoline', 60000, 382, 500, 'Automatic', 'Silver', 'Leather', 'RWD', 9),
('Audi', 'Coupe', 'new', 'A5', 'Gasoline', 55000, 349, 369, 'Automatic', 'Blue', 'Leather', 'AWD', 9),
('Tesla', 'SUV', 'new', 'Model X', 'Electric', 90000, 670, 850, 'Automatic', 'White', 'Leather', 'AWD', 10),
('Volkswagen', 'SUV', 'new', 'Tiguan', 'Gasoline', 33000, 184, 221, 'Automatic', 'Red', 'Fabric', 'AWD', 7),
('Volvo', 'SUV', 'used', 'XC40', 'Gasoline', 42000, 248, 258, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Chevrolet', 'Sedan', 'new', 'Malibu', 'Gasoline', 27000, 160, 184, 'Automatic', 'Silver', 'Fabric', 'FWD', 7),
('GMC', 'SUV', 'new', 'Yukon', 'Gasoline', 70000, 355, 383, 'Automatic', 'Black', 'Leather', '4WD', 8),
('Toyota', 'Sedan', 'new', 'Avalon', 'Gasoline', 41000, 301, 267, 'Automatic', 'Green', 'Leather', 'FWD', 8),
('Nissan', 'SUV', 'new', 'Murano', 'Gasoline', 45000, 260, 240, 'Automatic', 'White', 'Leather', 'AWD', 7),
('Jeep', 'SUV', 'new', 'Cherokee', 'Gasoline', 35000, 270, 295, 'Automatic', 'Red', 'Fabric', '4WD', 7),
('Audi', 'Sedan', 'new', 'A3', 'Gasoline', 37000, 228, 258, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('BMW', 'SUV', 'used', 'X6', 'Gasoline', 75000, 523, 553, 'Automatic', 'Black', 'Leather', 'AWD', 9),
('Mercedes-Benz', 'Sedan', 'new', 'A-Class', 'Gasoline', 35000, 188, 221, 'Automatic', 'Silver', 'Leather', 'FWD', 8),
('Jaguar', 'Sedan', 'used', 'XE', 'Gasoline', 43000, 296, 295, 'Automatic', 'Green', 'Leather', 'AWD', 8),
('Lexus', 'SUV', 'new', 'GX', 'Gasoline', 55000, 301, 329, 'Automatic', 'White', 'Leather', '4WD', 8),
('Porsche', 'Sedan', 'new', 'Panamera', 'Gasoline', 120000, 443, 405, 'Automatic', 'Red', 'Leather', 'AWD', 10),
('Maserati', 'Sedan', 'used', 'Ghibli', 'Gasoline', 80000, 345, 369, 'Automatic', 'Blue', 'Leather', 'RWD', 9),
('Land Rover', 'SUV', 'new', 'Discovery', 'Gasoline', 65000, 355, 365, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Lincoln', 'SUV', 'new', 'Nautilus', 'Gasoline', 51000, 335, 380, 'Automatic', 'Silver', 'Leather', 'AWD', 8),
('Genesis', 'Sedan', 'new', 'G80', 'Gasoline', 55000, 375, 391, 'Automatic', 'White', 'Leather', 'AWD', 9),
('Infiniti', 'Sedan', 'used', 'Q50', 'Gasoline', 40000, 300, 295, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Acura', 'Sedan', 'new', 'TLX', 'Gasoline', 48000, 272, 280, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Cadillac', 'SUV', 'used', 'XT5', 'Gasoline', 50000, 310, 271, 'Automatic', 'Red', 'Leather', 'AWD', 8),
('Aston Martin', 'SUV', 'new', 'DBX', 'Gasoline', 180000, 542, 516, 'Automatic', 'Green', 'Leather', 'AWD', 10),
('Bentley', 'SUV', 'new', 'Bentayga', 'Gasoline', 200000, 542, 568, 'Automatic', 'White', 'Leather', 'AWD', 10),
('Rolls-Royce', 'Sedan', 'new', 'Phantom', 'Gasoline', 450000, 563, 664, 'Automatic', 'Black', 'Leather', 'RWD', 10),
('Ferrari', 'SUV', 'new', 'Purosangue', 'Gasoline', 350000, 715, 716, 'Automatic', 'Red', 'Leather', 'AWD', 10),
('Lamborghini', 'Coupe', 'new', 'Huracan', 'Gasoline', 250000, 630, 600, 'Automatic', 'Yellow', 'Leather', 'AWD', 10),
('McLaren', 'Coupe', 'new', '720S', 'Gasoline', 300000, 710, 568, 'Automatic', 'Orange', 'Leather', 'RWD', 10),
('Tesla', 'Sedan', 'new', 'Model S', 'Electric', 95000, 670, 850, 'Automatic', 'Silver', 'Leather', 'AWD', 10),
('Honda', 'SUV', 'used', 'CR-V', 'Gasoline', 30000, 190, 179, 'Automatic', 'Blue', 'Leather', 'AWD', 8),
('Ford', 'Sedan', 'new', 'Fusion', 'Gasoline', 27000, 245, 275, 'Automatic', 'Red', 'Fabric', 'AWD', 7),
('Chevrolet', 'SUV', 'new', 'Equinox', 'Gasoline', 32000, 170, 203, 'Automatic', 'Black', 'Fabric', 'FWD', 7),
('Toyota', 'SUV', 'new', 'Highlander', 'Gasoline', 45000, 295, 263, 'Automatic', 'White', 'Leather', 'AWD', 8),
('Nissan', 'SUV', 'new', 'Armada', 'Gasoline', 60000, 390, 394, 'Automatic', 'Silver', 'Leather', 'AWD', 8),
('Jeep', 'SUV', 'new', 'Compass', 'Gasoline', 32000, 180, 175, 'Automatic', 'Blue', 'Fabric', '4WD', 7),
('Audi', 'SUV', 'new', 'Q5', 'Gasoline', 55000, 261, 273, 'Automatic', 'Red', 'Leather', 'AWD', 9),
('BMW', 'SUV', 'new', 'X7', 'Gasoline', 90000, 523, 553, 'Automatic', 'White', 'Leather', 'AWD', 9),
('Mercedes-Benz', 'SUV', 'new', 'GLS', 'Gasoline', 85000, 362, 369, 'Automatic', 'Silver', 'Leather', 'AWD', 9),
('Jaguar', 'SUV', 'new', 'E-Pace', 'Gasoline', 45000, 246, 269, 'Automatic', 'Black', 'Leather', 'AWD', 8),
('Lexus', 'SUV', 'new', 'NX', 'Gasoline', 45000, 235, 258, 'Automatic', 'Green', 'Leather', 'AWD', 8),
('Porsche', 'SUV', 'new', 'Macan', 'Gasoline', 60000, 248, 273, 'Automatic', 'Blue', 'Leather', 'AWD', 9),
('Maserati', 'SUV', 'new', 'Grecale', 'Gasoline', 75000, 523, 553, 'Automatic', 'Red', 'Leather', 'AWD', 9);