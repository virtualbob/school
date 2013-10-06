-- Load sample data into the gifts table

USE wedding;
DELETE FROM gifts;

INSERT INTO `gifts` VALUES
    (NULL,'Mikasa Studio Nova Tivoli White 20 Piece Dinnerset','Myer',1,'White','102.10',NULL),
    (NULL,'Richmond Tigers autographed print (unframed)','www.greatmoments.com.au',1,'NA','375.00',NULL),
    (NULL,'Breville Rice Cooker','Myer',1,'Silver','95.00','NULL'),
    (NULL,'Krups - Nespresso 986 coffee machine','Myer',1,'Black','608.00',NULL),
    (NULL,'Click Clack Airtight Cannisters - Small Coffee Jar 0.6 Ltr','Myer',3,'Clear with White Lid','4.67ea (14.01 total)',NULL),
    (NULL,'Avanti Twin Wall Mixing Bowls 2.8 Ltr','Myer',2,'Silver','41.65ea (83.30 total)',NULL),
    (NULL,'Lithograph - David Boyd \"Sorting the Score\", approx 1\' sq.','Port Jackson Press, 397 Brunswick St, Fitzroy',1,'NA','100.00',NULL),
    (NULL,'Le Creuset Wok','Myer',1,'Blue','258.00',NULL),
    (NULL,'Willow 12 Tin Muffin Tray','Myer',1,'Silver','9.07',NULL),
    (NULL,'Baileys Comet 6 Ladder','Bunnings',1,'Silver','97.50',NULL),
    (NULL,'Makita Drill HP1500k','Bunnings',1,'Black/Green','128.00','hugh'),
    (NULL,'Makita B04553 Palm Sander','Bunnings',1,'Black/Green','121.99',NULL),
    (NULL,'Stanley Shifting Spanner 6\'\'','Bunnings',2,'Silver','10.40ea',NULL);
