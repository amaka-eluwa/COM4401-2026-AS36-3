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
(1, 'Administrative Assistant', 3, 'Email, documents, spreadsheets, web systems, online meetings, and basic customer records', 'Webcam, Monitor, Keyboard, Mouse, Sufficient storage', 950.00),
(2, 'Project Manager', 2, 'Organising tasks and deadlines, meetings and presentations', 'Efficient multitasking, video conferencing, webcam, high storage capacity', 1300.00),
(3, 'Architect / CAD Designer', 5, 'CAD drawings, architectural design, 3D modelling, visualisation and design documentation', 'Dedicated GPU, 32GB RAM, fast NVMe storage and reliable CPU performance for CAD and 3D modelling', 2500.00),
(4, '3D Visualisation Specialist', 2, '3D modelling, architectural visualisation, rendering and detailed scene creation', 'High-performance CPU/GPU, 64GB RAM, fast NVMe storage and colour-accurate 4K displays', 3750.00);


-- Adds data into the WorkstationBuilds table
INSERT INTO WorkstationBuilds (BuildID, RoleID, BuildName, Source)
VALUES
(1, 1, 'Administrative Assistant Workstation', 'BuildCores'),
(2, 2, 'Project Manager Workstation', 'BuildCores'),
(3, 3, 'Architect / CAD Designer Workstation', 'BuildCores'),
(4, 4, '3D Visualisation Specialist Workstation', 'BuildCores');


-- Adds hardware items into the BuildItems table
INSERT INTO BuildItems (ItemID, BuildID, HardwareCategory, ItemName, Specification, Cost)
VALUES
(1, 1, 'CPU', 'AMD Ryzen 5 5500', 'AM4, 16MB Cache, Includes Cooler, DDR4, 128GB Memory', 74.99),
(2, 1, 'GPU', 'ASRock Intel Arc A580 Challenger OC 8GB GDDR6', 'PCIe 4.0, 2 Fans, 8GB Memory, 2000MHz', 220.96),
(3, 1, 'Case', 'Phanteks XT PRO ATX Mid Tower Black Tempered Glass Side Panel', 'ATX, 4 bays, 7 expansion slots, USB-C 3.0, USB 3.0', 52.98),
(4, 1, 'Motherboard', 'ASUS TUF GAMING B550-PLUS WIFI II AM4 DDR4 ATX', 'AM4, ATX, DDR4, 128GB Memory, 4 Memory slots, Wi-Fi 6, 24-pin power, ECC and RAID support, BIOS Flashback', 108.99),
(5, 1, 'RAM', 'Corsair Vengeance RGB Pro Black DDR4-3000 CL16 16GB', '3000MHz, 2 modules, heat spreader, 16GB capacity', 118.99),
(6, 1, 'Storage', 'TEAMGROUP MP33 1TB M.2-2280 SSD PCIe 3.0 x4 NVMe', '1TB, NVMe, SSD', 29.72),
(7, 1, 'Power Supply', 'Gigabyte P850GM ATX 850W Fully Modular 80+ Gold Certified', '80+ Gold efficiency, fully modular, ATX, 850W', 59.99),
(8, 1, 'Monitor', 'Dell E2216H 21.5" 1080p 60Hz TN Monitor', '60Hz, 1920px X 1080px', 81.00),
(9, 1, 'Keyboard', 'HP 320K Wired Standard Keyboard', 'ANSI', 17.59),
(10, 1, 'Mouse', 'Logitech M90 Wired Optical Mouse', 'Wired optical mouse', 4.49),
(11, 1, 'Webcam', 'Logitech C930e 1080p Webcam', '1080p webcam', 9.99),

(12, 2, 'Case', 'Corsair 3000D RS Black', 'ATX Mid Tower case', 59.99),
(13, 2, 'CPU', 'AMD Ryzen 7 9700X', 'AM5 processor', 244.99),
(14, 2, 'Motherboard', 'Gigabyte B650M GAMING PLUS WIFI DDR5 Micro ATX', 'AM5, DDR5, Micro ATX, integrated Wi-Fi', 141.73),
(15, 2, 'GPU', 'ASUS GeForce GT 730 2GB GDDR5', '2GB GDDR5 dedicated graphics', 59.00),
(16, 2, 'RAM', 'Crucial Pro Overclocking 32GB (2x16GB) DDR5 6000 CL36 Black', '32GB DDR5-6000 memory', 419.99),
(17, 2, 'CPU Cooler', 'Noctua NH-L9A-AM5 Air 37mm Brown / Silver', 'AM5 air cooler', 39.95),
(18, 2, 'Storage', 'Kingston NV3 2TB M.2 SSD PCIe 4.0 NVMe', '2TB PCIe 4.0 NVMe SSD', 229.99),
(19, 2, 'Power Supply', 'MSI MAG A650GL Black 650W Fully Modular 80+ Gold', '650W fully modular, 80+ Gold', 70.99),
(20, 2, 'Case Fan', 'HYTE FA12 Fans 4-Pack Snow White', '120mm case fans, 4-pack', 19.99),
(21, 2, 'Webcam', 'NexiGo N60 1080p Webcam', '1080p webcam for video conferencing', 27.19),
(22, 2, 'Keyboard', 'Redragon K745 Wired Gasket RGB Gaming Keyboard', 'Wired keyboard', 54.99),
(23, 2, 'Mouse', 'Logitech M220 Wireless Mouse with Silent Clicks', 'Wireless mouse', 17.49),

(24, 3, 'Case', 'Montech AIR 903 BASE ATX Mid Tower Black Tempered Glass Side Panel', 'ATX Mid Tower, tempered glass side panel, good airflow and upgrade space', 49.99),
(25, 3, 'CPU', 'AMD Ryzen 9 9900X3D', 'High-performance processor for CAD, 3D modelling and multitasking', 433.17),
(26, 3, 'Motherboard', 'ASUS TUF GAMING B850-PLUS WIFI', 'AM5, DDR5, ATX, integrated Wi-Fi and Ethernet', 159.99),
(27, 3, 'GPU', 'ASUS PRIME GeForce RTX 5070 12GB GDDR7 OC Edition', '12GB GDDR7 dedicated graphics', 698.99),
(28, 3, 'RAM', 'TEAMGROUP T-Create Expert 32GB (2x16GB) DDR5 6000 CL30 Black', '32GB DDR5-6000 CL30 memory', 475.37),
(29, 3, 'CPU Cooler', 'ARCTIC Freezer 36 (Black) CPU Cooler', 'CPU air cooler for demanding workloads', 22.99),
(30, 3, 'Storage', 'Western Digital Black SN850X 2TB SSD M.2 PCIe 4.0 NVMe', '2TB PCIe 4.0 NVMe SSD', 319.99),
(31, 3, 'Power Supply', 'Corsair RM750e (2025) White 750W Fully Modular', '750W fully modular power supply', 109.90),
(32, 3, 'Case Fan', 'ARCTIC P12 PWM PST 120mm Black', '120mm PWM case fan for improved airflow', 20.63),
(33, 3, 'Keyboard', 'Logitech K120 UK Layout Wired Standard Keyboard', 'UK layout, wired standard keyboard', 10.99),
(34, 3, 'Webcam', 'Logitech C925e 1080p Webcam', '1080p webcam for online meetings and design reviews', 53.99),
(35, 3, 'Mouse', 'Logitech PRO X Superlight 2 Wireless/Wired Optical White Gaming Mouse', 'Wireless/wired optical mouse for detailed CAD work', 109.99),

(36, 4, 'CPU', 'AMD Ryzen 9 9950X', 'High-performance AM5 processor', 433.99),
(37, 4, 'Motherboard', 'MSI MAG B850 TOMAHAWK MAX WIFI', 'AM5, DDR5, ATX, integrated Wi-Fi', 229.99),
(38, 4, 'GPU', 'ASUS PRIME GeForce RTX 5070 OC', '12GB GDDR7', 698.99),
(39, 4, 'RAM', 'Patriot Venom Black', '64GB (2 x 32GB) DDR5-6000 CL30', 799.99),
(40, 4, 'Storage', 'Western Digital Black SN850X', '2TB PCIe 4.0 NVMe SSD', 319.39),
(41, 4, 'CPU Cooler', 'Thermalright Phantom Spirit 120 SE ARGB', 'Dual-tower air cooler, 154mm', 35.00),
(42, 4, 'PSU', 'Corsair RM850x (2024)', '850W, fully modular', 109.99),
(43, 4, 'Case', 'Montech AIR 903 MAX', 'ATX Mid Tower, four preinstalled 140mm fans', 59.99),
(44, 4, 'Monitor', 'ASUS ProArt PA279CRV', '27-inch, 4K UHD, IPS, 60Hz', 378.98),
(45, 4, 'Monitor', 'ASUS ProArt PA279CRV', '27-inch, 4K UHD, IPS, 60Hz', 378.98),
(46, 4, 'Keyboard', 'Logitech K120', 'UK layout, wired USB', 10.99),
(47, 4, 'Mouse', 'Logitech B100', 'USB optical wired mouse', 5.99),
(48, 4, 'Webcam/Headset', 'Tewiky Full HD Webcam', '2K video, wide angle, built-in microphone', 25.94),
(49, 4, 'Webcam/Headset', 'Logitech H111', 'Stereo headset with microphone', 12.40),
(50, 4, 'Network/Cables/Adapters', 'Newlink DisplayPort 1.4 cable', '2m male-to-male HBR3', 5.99),
(51, 4, 'Network/Cables/Adapters', 'Newlink DisplayPort 1.4 cable', '2m male-to-male HBR3', 5.99);


-- Adds data into the Recommendations table
INSERT INTO Recommendations (RecommendationID, RoleID, Justification, Compromise, Approved, EthicalNotes)
VALUES
(
1,
1,
'This workstation is designed to complete basic computer functions such as emails, data transfer and video calls. The RAM and storage provide sufficient capacity for effective use. The webcam and monitor provide adequate quality for online meetings and communication.',
'No compromises were made to the build as all of the components fit within the budget. A budget of £950 was given for each unit and the build comes out to £779.69, leaving £170.31 of the budget for other uses.',
TRUE,
'The hardware has been selected to perform effectively and allow for upgrades if necessary. Security measures should be considered to protect client information.'
),

(
2,
2,
'This workstation is designed for project management tasks including planning projects, organising deadlines, managing documents and spreadsheets, attending online meetings and communicating with clients and team members. The Ryzen 7 9700X and 32GB of RAM provide strong multitasking performance, while the fast NVMe storage provides ample capacity for project files, documents and applications.',
'The build is designed to stay within the £1,300 budget per workstation while prioritising reliable processing performance, sufficient memory and fast storage. The components provide suitable performance for everyday project management without spending unnecessarily on specialist hardware.',
TRUE,
'The hardware selection balances performance, reliability, value and future upgradeability. Responsible purchasing should avoid unnecessary high-cost components and consider energy efficiency, warranties and expected lifespan. Appropriate security measures should also be used to protect confidential client information, project documents and business data.'
),

(
3,
3,
'This workstation is designed for architectural CAD work, 3D modelling, design documentation and visualisation. The Ryzen 9 9900X3D and RTX 5070 provide strong processing and dedicated graphics performance, while the 32GB of DDR5 memory and fast 2TB NVMe SSD provide suitable capacity for large design files and multitasking.',
'The build remains within the £2,500 budget while prioritising the CPU, dedicated GPU, memory and fast storage required for CAD and 3D modelling. The final cost is £2,465.99, leaving £34.01 of the budget available for price changes or future adjustments.',
TRUE,
'The hardware selection considers performance, upgradeability, durability and responsible use of the allocated budget. Appropriate security measures should be used to protect confidential client information, architectural plans and project documents.'
),

(
4,
4,
'This workstation is designed for demanding 3D modelling, architectural visualisation, rendering and detailed scene creation. The Ryzen 9 9950X, RTX 5070 and 64GB of DDR5 RAM provide strong processing and graphics performance, while the two 4K ASUS ProArt monitors provide a detailed and spacious workspace.',
'The build remains within the £3,750 budget while prioritising CPU, GPU, memory and display capability. The final cost leaves £237.41 of flexibility for potential price changes or future adjustments.',
TRUE,
'The hardware selection balances performance, upgradeability and durability without exceeding the allocated budget. Appropriate security measures should also be used to protect confidential client information, architectural plans and project documents.'
);


-- ============================================
-- TESTING
-- ============================================

-- Q1: Displays all employee roles
SELECT * FROM EmployeeRoles;


-- -- Q2: Displays each role name and its budget per workstation
-- SELECT RoleName, BudgetPerUnit FROM EmployeeRoles;


-- -- Q3: Displays roles with a budget over £1000 per workstation
-- SELECT RoleName, BudgetPerUnit FROM EmployeeRoles
-- WHERE BudgetPerUnit > 1000;


-- -- Q4: Displays roles and their staff count, with the largest teams first
-- SELECT RoleName, StaffCount FROM EmployeeRoles
-- ORDER BY StaffCount DESC;


-- -- Q5: Displays every item that belongs to Build 1
-- SELECT * FROM BuildItems
-- WHERE BuildID = 1;


-- -- Q6: Counts the number of items in Build 1
-- SELECT COUNT(*) AS ItemCount 
-- FROM BuildItems
-- WHERE BuildID = 1;


-- -- Q7: Calculates the total cost of Build 1
-- SELECT SUM(Cost) AS TotalCost 
-- FROM BuildItems
-- WHERE BuildID = 1;


-- -- Q8: Calculates the total cost of every build and orders them from most expensive to least expensive
-- SELECT BuildID, SUM(Cost) AS TotalCost 
-- FROM BuildItems
-- GROUP BY BuildID
-- ORDER BY TotalCost DESC;


-- -- Q9: Displays each build name with its related role name
-- SELECT WorkstationBuilds.BuildName, EmployeeRoles.RoleName 
-- FROM WorkstationBuilds
-- JOIN EmployeeRoles
-- ON WorkstationBuilds.RoleID = EmployeeRoles.RoleID;


-- -- Q10: Displays every item with its build name and role name
-- SELECT BuildItems.ItemName, WorkstationBuilds.BuildName, EmployeeRoles.RoleName
-- FROM BuildItems
-- JOIN WorkstationBuilds
-- ON BuildItems.BuildID = WorkstationBuilds.BuildID
-- JOIN EmployeeRoles
-- ON WorkstationBuilds.RoleID = EmployeeRoles.RoleID;


-- -- Q11: Calculates total spending for each role
-- SELECT EmployeeRoles.RoleName, SUM(BuildItems.Cost) AS TotalSpend
-- FROM EmployeeRoles
-- JOIN WorkstationBuilds
-- ON EmployeeRoles.RoleID = WorkstationBuilds.RoleID
-- JOIN BuildItems
-- ON WorkstationBuilds.BuildID = BuildItems.BuildID
-- GROUP BY EmployeeRoles.RoleName;
