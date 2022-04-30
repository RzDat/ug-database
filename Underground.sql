CREATE DATABASE Underground

USE Underground

CREATE TABLE Vehicles
([Model ID]		INT 
	CONSTRAINT mid_veh_nn_pk	PRIMARY KEY,
[Model Name]	VARCHAR(25)		NOT NULL,
[GXT Name]		VARCHAR(25)		NOT NULL,
[Vehicle Type]	VARCHAR(25)		NOT NULL,
[Vehicle Class] VARCHAR(25)		NOT NULL,
[Top Speed]		VARCHAR(20)		NOT NULL)

GO

INSERT INTO Vehicles([Model ID],
					[Model Name],
					[GXT Name],
					[Vehicle Type],
					[Vehicle Class],
					[Top Speed])
SELECT [MODEL_ID]
      ,[MODEL_NAME]
      ,[GXT_NAME]
      ,[VEHICLE_TYPE]
      ,[VEHICLE_CLASS]
      ,[TOP_SPEED]
  FROM [Underground].[dbo].[UG Vehicle Documentation - Sheet1]

GO

CREATE TABLE ExclusiveAnimations
([Name]			VARCHAR(20)		NOT NULL,
[Description]	VARCHAR(50)		NOT NULL,
[Category]		 VARCHAR(50)	NOT NULL)

GO

INSERT INTO ExclusiveAnimations ([NAME]
      ,[DESCRIPTION]
      ,[CATEGORY])
SELECT [NAME]
      ,[DESCRIPTION]
      ,[CATEGORY]
FROM [Underground].[dbo].[ExclusiveAnimation_data]

GO

CREATE TABLE Weapons
([Model ID] INT
	CONSTRAINT mid_wep_pk	PRIMARY KEY,
[Weapon ID]		SMALLINT	NOT NULL,
[Model Name]	VARCHAR(30)	NOT NULL,
[Weapon Slot]	VARCHAR(35)	NOT NULL,
[GXT Name] VARCHAR(30))

GO

INSERT INTO Weapons ([Model ID],
					[Weapon ID],
					[Model Name],
					[Weapon Slot],
					[GXT Name])
SELECT [Model_ID]
      ,[Weapon_ID]
      ,[Model_name]
      ,[Weapon_slot]
      ,[GXT_name]
  FROM [Underground].[dbo].[Weapons_data]

GO

CREATE TABLE Radio
([ID] TINYINT		NOT NULL
	CONSTRAINT id_rad_pk PRIMARY KEY,
[Name] VARCHAR(30)	NOT NULL,
[GXT Name] VARCHAR(30) NOT NULL)

GO

INSERT INTO Radio	([ID],
					[Name],
					[GXT Name])
SELECT [ID]
      ,[NAME]
      ,[GXT_NAME]
  FROM [Underground].[dbo].[Radio_data]


CREATE TABLE Interior
([Screenshot]	VARCHAR(100),
[Name]			VARCHAR(50)		NOT NULL,
[Interior ID]	TINYINT			NOT NULL,
[X]				MONEY			NOT NULL,
[Y]				MONEY			NOT NULL,
[Z]				MONEY			NOT NULL,
[Location]		VARCHAR(50))

GO

INSERT INTO Interior	([Screenshot],
						[Name],
						[Interior ID],
						[X],
						[Y],
						[Z],
						[Location])
SELECT [SCREENSHOT]
      ,[NAME]
      ,[INTERIOR_ID]
      ,[X]
      ,[Y]
      ,[Z]
      ,[LOCATION]
FROM [Underground].[dbo].[Interior_data]

SELECT * FROM Interior

GO

CREATE TABLE CarMod(
[Model ID]	INT			NOT NULL,
[GXT Name]	VARCHAR(25) NOT NULL,
[Slot] VARCHAR(50)		NOT NULL,
[Price] SMALLMONEY		NOT NULL)

INSERT INTO CarMod	([Model ID],
					[GXT Name],
					[Slot],
					[Price])
SELECT	[MODEL_ID]
		,[GXT_NAME]
		,[SLOT]
		,[PRICE]
FROM [Underground].[dbo].[CarMod_data]

GO

CREATE TABLE Weather
([Weather ID] TINYINT
	CONSTRAINT wid_w_pk PRIMARY KEY NOT NULL,
[Weather Name] VARCHAR(25) NOT NULL)

INSERT INTO Weather	([Weather ID],
					[Weather Name])
SELECT [WEATHER_ID]
      ,[WEATHER_NAME]
FROM [Underground].[dbo].[Weather_data]

GO

CREATE TABLE Skins
([Model ID]		INT
	CONSTRAINT mid_sk_pk PRIMARY KEY	NOT NULL,
[Model Name]	VARCHAR(30)				NOT NULL)

INSERT INTO Skins	([Model ID],
					[Model Name])
SELECT [MODEL_ID]
      ,[MODEL_NAME]
FROM [Underground].[dbo].[Skin_data]

GO

CREATE TABLE Animations
([ID]				SMALLINT
	CONSTRAINT id_ani_pk PRIMARY KEY	NOT NULL,
[Category Dummy]	VARCHAR(15),
[Animation Index]	SMALLINT			NOT NULL,
[Animation Library] VARCHAR(30)			NOT NULL, 
[Animation Name]	VARCHAR(50)			NOT NULL,
[Animation Description] VARCHAR(100),
[Keywords]			VARCHAR(50)			NOT NULL)

INSERT INTO Animations ([ID]
      ,[Category Dummy]
      ,[Animation Index]
      ,[Animation Library]
      ,[Animation Name]
      ,[Animation Description]
      ,[Keywords])
SELECT [ID]
      ,[category_dummy]
      ,[animation_index]
      ,[animation_library]
      ,[animation_name]
      ,[animation_description]
      ,[search_keywords]
FROM [Underground].[dbo].[Animation_data]

GO

CREATE TABLE Zones
([Zone Name]	VARCHAR(25) NOT NULL,
[GXT Name]		VARCHAR(50),
[X1]			SMALLMONEY, 
[Y1]			SMALLMONEY,
[Z1]			VARCHAR(25),
[X2]			SMALLMONEY,
[Y2]			SMALLMONEY,
[Z2]			SMALLMONEY)

INSERT INTO Zones([Zone Name]
      ,[GXT Name]
      ,[X1]
      ,[Y1]
      ,[Z1]
      ,[X2]
      ,[Y2]
      ,[Z2])
SELECT [ZONE_NAME]
      ,[GXT_NAME]
      ,[X1]
      ,[Y1]
      ,[Z1]
      ,[X2]
      ,[Y2]
      ,[Z2]
  FROM [Underground].[dbo].[Zones_data]

UPDATE Zones
SET [GXT Name] = NULLIF([GXT Name], '-')

GO

CREATE TABLE VehicleColor
(ID				SMALLINT
CONSTRAINT vc_id_pk PRIMARY KEY NOT NULL,
Color VARCHAR(50) NOT NULL)

INSERT INTO VehicleColor
			([ID],
			[Color])
SELECT [ID]
      ,[COLOR]
FROM [Underground].[dbo].[VehicleColor_data]

GO

CREATE TABLE WeaponStats
([ID]			INT
CONSTRAINT ws_id_pk PRIMARY KEY NOT NULL,
[Name]		VARCHAR(25)			NOT NULL,
[Magazine]	SMALLINT				NOT NULL,
[Damage]		TINYINT				NOT NULL,
[Accuracy]	FLOAT,
[Fire Rate]	TINYINT,
[Animation]	VARCHAR(15)			NOT NULL,
[Description]	VARCHAR(150),
[Type]		VARCHAR(25)			NOT NULL)

INSERT INTO WeaponStats ([ID]
      ,[Name]
      ,[Magazine]
      ,[Damage]
      ,[Accuracy]
      ,[Fire Rate]
      ,[Animation]
      ,[Description]
      ,[Type])
SELECT [ID]
      ,[Name]
      ,[Magazine]
      ,[Damage]
      ,[Accuracy]
      ,[Fire_rate]
      ,[Animation]
      ,[Description]
      ,[Type]
FROM [Underground].[dbo].[WeaponStats_data]

GO
DELETE FROM WeaponStats WHERE ID = 29311
GO
DELETE FROM WeaponStats WHERE ID = 29314
GO

ALTER TABLE Weaponstats
ADD FOREIGN KEY ([ID]) REFERENCES Weapons([Model ID])
GO