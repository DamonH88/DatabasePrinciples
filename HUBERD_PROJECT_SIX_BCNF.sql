/* CSC6302 Database Principles
	Unit Six: Project Six: BCNF
    HUBERD_PROJECT_SIX_BCNF
    Damon Huber
    Star Wars The Old Republic Database
*/
DROP DATABASE IF EXISTS StarWarsGame;
CREATE DATABASE StarWarsGame;
USE  StarWarsGame;

CREATE TABLE IF NOT EXISTS Factions (
FactionName varchar(200) not null,
FactionRace VARCHAR(100) not null,
PRIMARY KEY (FactionName)

);

CREATE TABLE IF NOT EXISTS Items (
ItemName VARCHAR(100),
ItemType VARCHAR(100),
ItemId INT, -- Usable by all classes
PRIMARY KEY (ItemId)
);

DROP TABLE IF EXISTS CharacterBuild;
CREATE TABLE CharacterBuild (
CharacterName VARCHAR(200)  not null,
CharacterFaction VARCHAR(200) not null,
CharacterGender VARCHAR(10) not null,
CharacterLevel INT,
InventoryId INT,
PRIMARY KEY ( CharacterName),
FOREIGN KEY (CharacterFaction) REFERENCES Factions (FactionName) on update cascade on delete cascade,
FOREIGN KEY (InventoryId) REFERENCES Items (ItemId) on update cascade on delete cascade 
);


CREATE TABLE IF NOT EXISTS Gear ( 
GearName VARCHAR(100),
GearType VARCHAR(100),
GearSlot VARCHAR(100),
PRIMARY KEY (GearName)
);

CREATE TABLE IF NOT EXISTS Combat (
CombatStats INT not null, 
SingleAttack VARCHAR(200) not null,
ComboAttack VARCHAR(200) not null,
PowerAttack VARCHAR(200) not null,
AreaAttack VARCHAR(200) not null,
PRIMARY KEY (CombatStats)
);

CREATE TABLE IF NOT EXISTS Class (
ClassName VARCHAR(100) not null,
ClassType VARCHAR(100) not null,
FactionName VARCHAR(100) not null,
ClassStats INT not null,
ClassGear VARCHAR(100) not null,
PRIMARY KEY(ClassName, FactionName),
FOREIGN KEY (FactionName) REFERENCES Factions (FactionName) on update cascade on delete cascade,
FOREIGN KEY (ClassStats) REFERENCES Combat (CombatStats) on update cascade on delete cascade,
FOREIGN KEY (ClassGear) REFERENCES Gear (GearName) on update cascade on delete cascade
);

-- Factions
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Republic 1", "Human");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Republic 2", "Cyborg");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Republic 3", "Mirialan");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Republic 4", "Twi''lek");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Imperial 1", "Human");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Imperial 2", "Chiss");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Imperial 3", "Zabrak");
INSERT INTO Factions (FactionName, FactionRace) VALUES ("Imperial 4", "Sith Pureblood");
SELECT * FROM Factions;

-- Items
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Med Pack", "Health", 11);
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Offense Stim", "Stim", 12);
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Defense Stim", "Stim", 13);
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Experience Boost", "Enhancement", 14);
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Damage Boost", "Enhancement", 15);
INSERT INTO Items (ItemName, ItemType, ItemId) VALUES ("Credit Chip", "Currency", 16);
SELECT * FROM Items;

-- Character Build
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Luke", "Republic", "Male", 71, 1);
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Han Solo", "Republic", "Male", 70, 2);
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Leia", "Republic", "Female", 70, 3);
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Lando", "Republic", "Male", 70, 4);
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Obi Wan", "Republic", "Male", 80, 5);
INSERT INTO CharacterBuild (CharacterName, CharacterFaction, CharacterGender, CharacterLevel, InventoryId) VALUES ("Darth Vader", "Imperial", "Male", 80, 6);
SELECT * FROM CharacterBuild;

-- Gear
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Head Piece", "Robe", "Head");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("ChestPiece", "Robe", "Torso");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Belt", "Robe", "Waist");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Leggings", "Robe", "Leg");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Boots", "Robe", "Foot");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Wrist Guard", "Robe", "Wrist");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Gloves", "Robe", "Hand");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Helmet", "Armor", "Head");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("ChestPlate", "Armor", "Torso");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Bandolier", "Armor", "Waist");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Leg Plates", "Armor", "Leg");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Armor Boots", "Armor", "Foot");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Bracers", "Armor", "Wrist");
INSERT INTO Gear (GearName, GearType, GearSlot) VALUES ("Gauntlet", "Armor", "Hand");
SELECT * FROM Gear;

-- Combat
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "1", "Lightsaber Single Strike", "Lightsaber Double Strike", "SaberThrow", "Whirlwind");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "2", "Lightsaber Single Blade", "Lightsaber Double Blade", "Force Sever", "SaberWave");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "3", "Single Shot", "Rapid Fire", "Power Shot", "Grenade");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "4", "Sucker Punch", "Dirty Trick", "Overcharge Shot", "Roundhouse");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "5", "Lightsaber Single Blow", "Lightsaber Double Blow", "Force Lightning", "Tempest");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "6", "Lightsaber Impale", "Force Cleave", "SaberLance", "Force Distruction");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "7", "BoltShot", "Concussive Blast", "Headshot", "Incendiary Shot");
INSERT INTO Combat (CombatStats, SingleAttack, ComboAttack, PowerAttack, AreaAttack) VALUES ( "8", "Precise Shot", "Carbine Burst", "Headshot", "Incendiary Shot");
SELECT * FROM Combat;

-- Class
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "1", "Head Piece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "2", "ChestPiece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "3", "Belt");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "4", "Leggings");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "5", "Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "6", "Wrist Guard");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Knight", "Melee", "Republic", "7", "Gloves");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "8", "Head Piece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "9", "ChestPiece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "10", "Belt");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "11", "Leggings");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "12", "Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "13", "Wrist Guard");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Jedi Consular", "Melee", "Republic", "14", "Gloves");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Trooper", "Ranged", "Republic", "15", "Helmet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "16", "ChestPlate");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "17", "Bandolier");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "18", "Leg Plates");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "19", "Armor Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "20", "Bracers");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Republic Troope", "Ranged", "Republic", "21", "Gauntlet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "22", "Helmet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "23", "ChestPlate");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "24", "Bandolier");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "25", "Leg Plates");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "26", "Armor Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "27", "Bracers");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Smuggler", "Ranged", "Republic", "28", "Gauntlet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "29", "Head Piece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "30", "ChestPiece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "31", "Belt");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "32", "Leggings");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "33", "Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "34", "Wrist Guard");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Warrior", "Melee", "Republic", "35", "Gloves");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "36", "Head Piece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "37", "ChestPiece");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "38", "Belt");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "39", "Leggings");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "40", "Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "41", "Wrist Guard");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Sith Inquisitor", "Melee", "Imperial", "42", "Gloves");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "43", "Helmet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "44", "ChestPlate");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "45", "Bandolier");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "46", "Leg Plates");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "47", "Armor Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "48", "Bracers");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Imperial Agent", "Ranged", "Imperial", "49", "Gauntlet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "50", "Helmet");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "51", "ChestPlate");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "52", "Bandolier");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "53", "Leg Plates");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "54", "Armor Boots");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "55", "Bracers");
INSERT INTO Class (ClassName, ClassType, FactionName, ClassStats, ClassGear) VALUES ("Bounty Hunter", "Ranged", "Imperial", "56", "Gauntlet");
SELECT * FROM Class;

SELECT * FROM CharacterBuild;
SELECT * FROM Factions;
SELECT * FROM Items;
SELECT * FROM Gear;
SELECT * FROM Combat;
SELECT * FROM Class;

