create database IRIDOLOGY

use  IRIDOLOGY

CREATE TABLE [TypeUser](
	IDTypeUser int primary key,
	TypeUser varchar(50)
)

CREATE TABLE [User] (
	IDUser int primary key,
	[User] varchar(50),
	[Password] varchar(300),
	[Status] bit,
	IDTypeUser int,

	CONSTRAINT fk_IDTypeUser FOREIGN KEY (IDTypeUser) REFERENCES TypeUser (IDTypeUser)
)
CREATE TABLE [InfoUser] (
	IDInfoUser int primary key,
	IDUser int,
	UserName varchar(350),
	UserLastName varchar(350),
	UserMail varchar(350),
	UserPhone varchar(50),
	UserCountry varchar(350),
	UserLenguage varchar(50),
	CONSTRAINT fk_IDUser FOREIGN KEY (IDUser) REFERENCES [User] (IDUser)
)
--drop table [SetupFindings]
--drop table [SetupSymptoms]
--drop table [SetupBodyOrgans]
--drop table [SetupSystems]

CREATE TABLE [SetupSystems](
	IDSetupSystems INT PRIMARY KEY,
	SetupSystems VARCHAR(50),
	RangeMax decimal(12,2),
	RangeMin decimal(12,2),
	Lenguage varchar(50)
)

CREATE TABLE [SetupBodyOrgans](
	IDSetupBodyOrgans INT PRIMARY KEY,
	IDSetupSystems INT,
	BodyOrgans VARCHAR(50),
	[Left] bit,
	[Right] bit,
	Men bit,
	Womman bit,
	RangeMax decimal(12,2),
	RangeMin decimal(12,2),
	Lenguage varchar(50)
	CONSTRAINT fk_IDSetupSystems FOREIGN KEY (IDSetupSystems) REFERENCES [SetupSystems] (IDSetupSystems)
)

CREATE TABLE [SetupSymptoms](
	IDSetupSymptoms INT PRIMARY KEY,
	IDSetupBodyOrgans INT,
	Symptoms varchar(350),
	RangeMax decimal(12,2),
	RangeMin decimal(12,2),
	Lenguage varchar(50)
	CONSTRAINT fk_IDSetupBodyOrgans FOREIGN KEY (IDSetupBodyOrgans) REFERENCES [SetupBodyOrgans] (IDSetupBodyOrgans)
)

CREATE TABLE [SetupFindings](
	IDSetupFindings INT PRIMARY KEY,
	IDSetupBodyOrgans INT,
	Foods varchar(350),
	NotFoods varchar(350),
	Findings varchar(350),
	RangeMax decimal(12,2),
	RangeMin decimal(12,2),
	Lenguage varchar(50)
	CONSTRAINT fk_IDSetupFindings FOREIGN KEY (IDSetupBodyOrgans) REFERENCES [SetupBodyOrgans] (IDSetupBodyOrgans)
)

--ID	ID_SYSTEMS	ORGAN NAME	LEFT	RIGHT	LANGUAGE

SELECT [User].IDUser, [User].[User], [User].[Password], [User].[Status], [User].IDTypeUser, 
	[InfoUser].IDInfoUser, [InfoUser].IDUser, [InfoUser].UserName, [InfoUser].UserLastName, [InfoUser].UserMail, [InfoUser].UserPhone, [InfoUser].UserCountry, [InfoUser].UserLenguage, 
	[TypeUser].IDTypeUser, [TypeUser].TypeUser 
FROM [User] 
LEFT OUTER JOIN [InfoUser] ON [User].IDUser = [InfoUser].IDUser 
LEFT OUTER JOIN [TypeUser] ON [USER].IDTypeUser = [TypeUser].IDTypeUser

--EXECUTE SP_CreateUser '1234', 1, 'Miguel', 'Carcamo', 'n/a', 'n/a', 'Honduras', 'ESP'
--EXECUTE SP_UpdateUser 3,'',1,0,'','','carcamomiguelt@gmail.com','95332041','',''

SELECT [User].IDUser, [User].[User], [User].[Password], [User].[Status], [User].IDTypeUser, 
    [InfoUser].IDInfoUser, [InfoUser].IDUser, [InfoUser].UserName, [InfoUser].UserLastName, [InfoUser].UserMail, [InfoUser].UserPhone, [InfoUser].UserCountry, [InfoUser].UserLenguage, 
    [TypeUser].IDTypeUser, [TypeUser].TypeUser 
FROM [User] 
LEFT OUTER JOIN [InfoUser] ON [User].IDUser = [InfoUser].IDUser 
LEFT OUTER JOIN [TypeUser] ON [USER].IDTypeUser = [TypeUser].IDTypeUser
WHERE [User] = 'Miguel.Carcamo' AND [Password] = '4321' and [Status] = 1


SELECT IDSetupSystems, SetupSystems, Men, Womman, Lenguage FROM [SetupSystems]


--EXECUTE SP_SetupSystemsCreate


SELECT IDSetupBodyOrgans, IDSetupSystems, BodyOrgans, [Left], [RIGHT], Lenguage FROM [SetupBodyOrgans]

EXECUTE SP_SetupSystemsRead 0

EXECUTE SP_SetupBodyOrgansRead 0

EXECUTE [SP_SetupSymptomsRead] 0

EXECUTE SP_SetupFindin

--TABLAS DEL NUEVO MODULO PARA GESTIONAR EXAMENES
--drop table [TestPatient]
--drop table [TestFindings]
--drop table [TestSymptoms]
--drop table [TestBodyOrgans]
--drop table [TestSystems]
--drop table [Test]

CREATE TABLE [AnalysisPatient] (
	IDPatient int primary key,
	IDUser int,
	PatientName varchar(350),
	PatientLastName varchar(350),
	Lenguage varchar(50),
	BirthDate date,
	Gender varchar(1),
	CONSTRAINT fk_AnalysisPatient FOREIGN KEY (IDUser) REFERENCES [User] (IDUser)
)

CREATE TABLE [Analysis](
	IDAnalysis int primary key,
	IDPatient int,
	CreateDate date,
	FinishDate date,
	IDDoctor int,
	[Status] int, --1. New 2. In Process 3. Complete
	CONSTRAINT fk_Analysis FOREIGN KEY (IDPatient) REFERENCES [AnalysisPatient] (IDPatient)
)

CREATE TABLE [AnalysisSystems](
	IDAnalysisSystems int Primary Key,
	IDAnalysis INT,
	SetupSystems VARCHAR(50),
	[values] decimal(12,2),
	CONSTRAINT fk_AnalysisSystems FOREIGN KEY (IDAnalysis) REFERENCES [Analysis] (IDAnalysis)
)

CREATE TABLE [AnalysisBodyOrgans](
	IDAnalysisBodyOrgans INT PRIMARY KEY,
	IDAnalysisSystems int,
	BodyOrgans VARCHAR(50),
	Phase int, --1. Agudas 2.  3. Complete 4. 
	[values] decimal(12,2),
	CONSTRAINT fk_AnalysisBodyOrgans FOREIGN KEY (IDAnalysisSystems) REFERENCES [AnalysisSystems] (IDAnalysisSystems)
)

CREATE TABLE[AnalysisSymptoms](
	IDAnalysisSymptoms int primary key,
	IDAnalysisBodyOrgans int,
	Symptoms varchar(350),
	CONSTRAINT fk_AnalysisSymptoms FOREIGN KEY (IDAnalysisBodyOrgans) REFERENCES [AnalysisBodyOrgans] (IDAnalysisBodyOrgans)
)

CREATE TABLE[AnalysisFindings](
	IDAnalysisFindings int primary key,
	IDAnalysisBodyOrgans int,
	Foods varchar(350),
	NotFoods varchar(350),
	Findings varchar(350),
	CONSTRAINT fk_AnalysisFindings FOREIGN KEY (IDAnalysisBodyOrgans) REFERENCES [AnalysisBodyOrgans] (IDAnalysisBodyOrgans)
)