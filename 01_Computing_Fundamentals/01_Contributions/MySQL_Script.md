-- ============================================
-- DATABASE TABLE CREATION
-- ============================================

-- Stores the different employee roles and their workstation requirements
CREATE TABLE EmployeeRoles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    StaffCount INT NOT NULL,
    Tasks VARCHAR(255) NOT NULL,
    PerformanceNeed VARCHAR(100) NOT NULL,
    BudgetPerUnit DECIMAL(8,2) NOT NULL
);

-- Stores each recommended workstation build and links it to an employee role
CREATE TABLE WorkstationBuilds (
    BuildID INT PRIMARY KEY,
    RoleID INT NOT NULL,
    BuildName VARCHAR(100) NOT NULL,
    Source VARCHAR(50) NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES EmployeeRoles(RoleID) 
);

-- Stores every individual hardware component in a workstation
CREATE TABLE BuildItems (
    ItemID INT PRIMARY KEY,
    BuildID INT NOT NULL,
    HardwareCategory VARCHAR(50) NOT NULL,
    ItemName VARCHAR(100) NOT NULL,
    Specification VARCHAR(150) NOT NULL,
    Cost DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (BuildID) REFERENCES WorkstationBuilds(BuildID) 
);

-- Stores the final recommendation and professional/ethical notes for each role
CREATE TABLE Recommendations (
    RecommendationID INT PRIMARY KEY,
    RoleID INT NOT NULL,
    Justification TEXT NOT NULL,
    Compromise TEXT NOT NULL,
    Approved BOOLEAN NOT NULL,
    EthicalNotes TEXT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES EmployeeRoles(RoleID)  
);


-- ============================================
-- DATA INSERTION
-- ============================================

-- Adds data into the EmployeeRoles table
INSERT INTO EmployeeRoles (RoleID, RoleName, StaffCount, Tasks, PerformanceNeed, BudgetPerUnit)
VALUES
(4,'3D Visualisation Specialist', 2, '3D modelling, architectural visualisation, rendering and detailed scene creation', 
'High-performance CPU/GPU, 64GB RAM, fast NVMe storage and colour-accurate 4K displays', 3750.00),
(1, 'Administrative Assistant', 2, 'Email, documents, spreadsheets, web systems, online meetings, and basic customer records', 'Camera for meeting, monitor keyboard and mouse for basic computer functions, good storage to keep records', 950.00);

-- Adds data into the WorkstationBuilds table
INSERT INTO WorkstationBuilds (BuildID, RoleID, BuildName, Source)
VALUES
(4, 4, '3D Visualisation Specialist Workstation', 'BuildCores'),
(1, 1, 'Administrative Assistant', 'BuildCores');

-- Adds hardware items into the BuildItems table
INSERT INTO BuildItems (ItemID, BuildID, HardwareCategory, ItemName, Specification, Cost)
VALUES
(1, 4, 'CPU', 'AMD Ryzen 9 9950X', 'High-performance AM5 processor', 433.99),
(2, 4, 'Motherboard', 'MSI MAG B850 TOMAHAWK MAX WIFI', 'AM5, DDR5, ATX, integrated Wi-Fi', 229.99),
(3, 4, 'GPU', 'ASUS PRIME GeForce RTX 5070 OC', '12GB GDDR7', 698.99),
(4, 4, 'RAM', 'Patriot Venom Black', '64GB (2 x 32GB) DDR5-6000 CL30', 799.99),
(5, 4, 'Storage', 'Western Digital Black SN850X', '2TB PCIe 4.0 NVMe SSD', 319.39),
(6, 4, 'CPU Cooler', 'Thermalright Phantom Spirit 120 SE ARGB', 'Dual-tower air cooler, 154mm', 35.00),
(7, 4, 'PSU', 'Corsair RM850x (2024)', '850W, fully modular', 109.99),
(8, 4, 'Case', 'Montech AIR 903 MAX', 'ATX Mid Tower, four preinstalled 140mm fans', 59.99),
(9, 4, 'Monitor', 'ASUS ProArt PA279CRV', '27-inch, 4K UHD, IPS, 60Hz', 378.98),
(10, 4, 'Monitor', 'ASUS ProArt PA279CRV', '27-inch, 4K UHD, IPS, 60Hz', 378.98),
(11, 4, 'Keyboard', 'Logitech K120', 'UK layout, wired USB', 10.99),
(12, 4, 'Mouse', 'Logitech B100', 'USB optical wired mouse', 5.99),
(13, 4, 'Webcam/Headset', 'Tewiky Full HD Webcam', '2K video, wide angle, built-in microphone', 25.94),
(14, 4, 'Webcam/Headset', 'Logitech H111', 'Stereo headset with microphone', 12.40),
(15, 4, 'Network/Cables/Adapters', 'Newlink DisplayPort 1.4 cable', '2m male-to-male HBR3', 5.99),
(16, 4, 'Network/Cables/Adapters', 'Newlink DisplayPort 1.4 cable', '2m male-to-male HBR3', 5.99),
(17, 1, 'CPU', 'AMD Ryzen 5 5500', 'AM4, 16MB Cache, Includes Cooler, DDR4, 128GB Memory', 74.99),
(18, 1, 'GPU', 'ASRock Intel Arc A580 Challenger OC 8GB GDDR6', 'PCLe 4.0, 2 Fans, 8GB Memory, 2000MHz', 220.96),
(19, 1, 'Case', 'Phanteks XT PRO ATX Mid Tower Black Tempered Glass Side Panel', 'ATX, 4 bays, 7 expansion slots, USB-C 3.0, USB 3.0', 52.98),
(20, 1, 'Motherboard', 'ASUS TUF GAMING B550-PLUS WIFI II AM4 DDR4 ATX', 'AM4, ATX, DDR4, 128GB Memory, 4 Memory slots, Wifi 6, 24-pin power, ECC and Raid support, BIOS Flashback', 108.99),
(21, 1, 'RAM', 'Corsair Vengeance RGB Pro Black DDR4-3000 CL16 16GB', '3000MHz, 2 modules, Heat spreader, 16GB Capacity', 118.99),
(22, 1, 'Storage', 'TEAMGROUP MP33 1TB M.2-2280 SSD PCIe 3.0 x4 NVMe', '1TB, NVMe, SSD', 29.72),
(23, 1, 'Power Supply', 'Gigabyte P850GM ATX 850W Fully Modular 80+ Gold Certified', '80+ Gold efficiency, Full modularity, ATX, 850W', 59.99),
(24, 1, 'Monitor', 'Dell E2216H 21.5" 1080p 60Hz TN Monitor', '60Hz, 1920px X 1080px', 81),
(25, 1, 'Keyboard', 'HP 320K Wired Standard Keyboard', 'ANSI', 17.59),
(26, 1, 'Mouse', 'Logitech M90 Wired Optical Mouse', 'No connectivity', 4.49),
(27, 1, 'Webcam', 'Logitech C930e 1080p Webcam', 'no connectivity type', 9.99);

-- Adds recommendation data into the Recommendations table
INSERT INTO Recommendations (RecommendationID, RoleID, Justification, Compromise, Approved, EthicalNotes)
VALUES
(4, 
4, 
'This workstation is designed for demanding 3D modelling, architectural visualisation, rendering and detailed scene creation. The Ryzen 9 9950X, RTX 5070 and 64GB of DDR5 RAM provide strong processing and graphics performance, while the two 4K ASUS ProArt monitors provide a detailed and spacious workspace.',
'The build remains within the £3,750 budget while prioritising CPU, GPU, memory and display capability. The final cost leaves £237.41 of flexibility for potential price changes or future adjustments.',
TRUE,
'The hardware selection balances performance, upgradeability and durability without exceeding the allocated budget. Appropriate security measures should also be used to protect confidential client information, architectural plans and project documents.');


-- ============================================
-- TESTING
-- ============================================

-- Q1: Displays all employee roles
SELECT * FROM EmployeeRoles;

