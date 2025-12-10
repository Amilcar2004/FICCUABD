 -- SCRIPT INICIAL DE BASE DE DATOS GEM

USE MASTER;
IF EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'usrprueba')
BEGIN
-- variable para almacenar los comandos KILL
DECLARE @sql NVARCHAR(MAX) = N'';


-- KILL para cada sesi�n del login
SELECT @sql = @sql + N'KILL ' + CAST(session_id AS NVARCHAR(5)) + N';'
FROM sys.dm_exec_sessions
WHERE login_name = 'usrprueba';

PRINT @sql;

EXEC sp_executesql @sql;

DROP LOGIN [usrprueba];


SET @sql = NULL;
END;

GO	

-- Usuario  de prueba 

IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'usrprueba')
BEGIN;
	CREATE LOGIN [usrprueba] WITH PASSWORD = 'usrprueba';
	EXEC sp_addsrvrolemember @loginame = N'usrprueba', @rolename = N'sysadmin';
END;

-- BASE 
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DbGestionGEM')
BEGIN
	ALTER DATABASE DbGestionGem SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE IF EXISTS DbGestionGem;
END;

CREATE DATABASE DbGestionGem;
GO

USE DbGestionGem;
GO

CREATE SCHEMA users;
GO
CREATE SCHEMA asset;
GO
CREATE SCHEMA config;
GO
CREATE SCHEMA events;
GO

CREATE SCHEMA sports;
GO

CREATE SCHEMA arts;
GO

-- CREACION TABLAS SCHEMA ASSETS
CREATE TABLE asset.tblLoginAttempts(
    idLoginAttempt INT IDENTITY PRIMARY KEY,
    email NVARCHAR(100) NOT NULL,
    ipClient NVARCHAR(100),
    userAgent NVARCHAR(200),
    isSuccessful BIT NOT NULL,
    reason NVARCHAR(100) NOT NULL,
    attemptDate DATETIME NOT NULL  DEFAULT SYSDATETIME()
);

-- CREACION TABLAS SCHEMA EVENTS
	CREATE TABLE events.tblEvents (
		idEvent INTEGER IDENTITY PRIMARY KEY,
		eventName NVARCHAR(200) NOT NULL,
		startDate DATETIME NOT NULL,
		endDate DATETIME NOT NULL,
		idEventType INTEGER NOT NULL
	);
	GO

	CREATE TABLE events.tblEventTypes(
		idEventType INTEGER IDENTITY PRIMARY KEY,
		eventTypeName NVARCHAR(150) NOT NULL
	);
	GO

	CREATE TABLE events.tblUniversities(
		idUniversity INTEGER IDENTITY PRIMARY KEY,
		universityName NVARCHAR(150) NOT NULL,
		acronym NVARCHAR(20) NOT NULL,
		idCountry INTEGER NOT NULL
	);
	GO
	CREATE TABLE events.tblDelegations(
		delegationName NVARCHAR(150) NOT NULL,
		idDelegation INTEGER IDENTITY PRIMARY KEY,
		idUniversity INTEGER NOT NULL, 
		idDelegationType INTEGER NOT NULL
	);
	GO 
		CREATE TABLE events.tblDelegationType(
		idDelegationType INTEGER IDENTITY PRIMARY KEY,
		delegationName NVARCHAR(100) NOT NULL,
		idEvent INTEGER NOT NULL, 
		hasModalities BIT NOT NULL,
		hasCategories BIT NOT NULL,
		hasTests BIT NOT NULL
	);
	GO  
	CREATE TABLE events.tblCountries(
		idCountry INTEGER IDENTITY PRIMARY KEY,
		countryName NVARCHAR(100) NOT NULL,
		countryCode NVARCHAR(20) NOT NULL,
		nationality nVARCHAR(100) NOT NULL
	);
	GO
	CREATE TABLE events.tblEventConfigurations(
		booleanValue BIT,
		integerValue INTEGER,
		stringValue NVARCHAR(50),
		show BIT NOT NULL DEFAULT 1,
		idEvent INTEGER NOT NULL,
		idConfigValueType INTEGER NOT NULL,
		idConfigParam INTEGER NOT NULL
	);
	GO
	CREATE TABLE events.tblConfigurationValueTypes(
		idConfigValueType INTEGER IDENTITY PRIMARY KEY,
		configValueTypeName NVARCHAR(50) NOT NULL,
	);
	GO
	CREATE TABLE events.tblConfigurationParameters(
		idConfigParam INTEGER IDENTITY PRIMARY KEY,
		description NVARCHAR(100) NOT NULL,
	);

	CREATE TABLE events.tblSpeakers(
		idSpeaker  INTEGER IDENTITY  PRIMARY KEY,
		institutionalEmail NVARCHAR(50) NOT NULL,
		personalEmail NVARCHAR(50) NOT NULL,
		academicTitle NVARCHAR(100) NOT NULL,
		jobTitle NVARCHAR(100) NOT NULL,
		phoneNumber NVARCHAR(20) NOT NULL,
		biography NVARCHAR(200) NOT NULL,
		idUniversityStaff INTEGER NOT NULL,
		idSpeakerCategory INTEGER NOT NULL

	);
	GO
	CREATE TABLE events.tblSpeakerCategories(
		idSpeakerCategory INTEGER IDENTITY PRIMARY KEY,
		categoryName NVARCHAR(30) NOT NULL
	);
	GO


	CREATE TABLE events.tblConferences(
		idConference INTEGER IDENTITY PRIMARY KEY,
		conferenceTitle NVARCHAR(250) NOT NULL,
		conferenceRequirements NVARCHAR(250),
		idSpeaker INTEGER NOT NULL,
		idConferenceTheme INTEGER NOT NULL,
		idConferenceType INTEGER NOT NULL
	);
	GO

	CREATE TABLE events.tblConferenceThemes(
		idConferenceTheme INTEGER IDENTITY PRIMARY KEY,
		conferenceThemeName NVARCHAR(50) NOT NULL,
		themeDescription NVARCHAR(200) NOT NULL

	);
	GO

	CREATE TABLE events.tblConferenceTypes(
		idConferenceType INTEGER IDENTITY PRIMARY KEY,
		conferenceTypeName NVARCHAR(50) NOT NULL,
		typeDescription NVARCHAR(200) NOT NULL
	);
	GO 

	CREATE TABLE events.tblUniversityStaffs(
		idUniversityStaff INTEGER IDENTITY PRIMARY KEY,
		idUniversity INTEGER NOT NULL,
		idUniversityStaffType INTEGER NOT NULL,
		idPerson INTEGER NOT NULL,
		idEvent INTEGER NOT NULL,
		idCommission INTEGER NOT NULL
	);
	GO

	CREATE TABLE events.tblCommissions(
		idCommission INTEGER IDENTITY PRIMARY KEY,
		commissionName NVARCHAR(100) NOT NULL
	);
	GO 
	CREATE TABLE events.tblUniversityStaffTypes(
		idUniversityStaffType INTEGER IDENTITY PRIMARY KEY,
		universityStaffTypeName NVARCHAR(100) NOT NULL
	);
	GO
	CREATE TABLE events.tblAuthorityPositions(
		idAuthorityPosition INTEGER IDENTITY PRIMARY KEY,
		idPosition INTEGER NOT NULL,
		idUniversityStaff INTEGER NOT NULL,
		positionOther NVARCHAR(150)
	);
	GO
	
	CREATE TABLE events.tblPositions(
		idPosition INTEGER IDENTITY PRIMARY KEY,
		positionName NVARCHAR(100) NOT NULL
	); 

	CREATE TABLE events.tblDoctorSpecialties(
		idDoctorSpecialty INTEGER IDENTITY PRIMARY KEY,
		idUniversityStaff INTEGER NOT NULL,
		idSpecialty INTEGER NOT NULL,
		specialtyOther NVARCHAR(150)

	);

	CREATE TABLE events.tblSpecialties(
		idSpecialty INTEGER IDENTITY PRIMARY KEY,
		specialtyName NVARCHAR(100) NOT NULL 
	);
	
	CREATE TABLE events.tblRoles(
		idRole INTEGER IDENTITY PRIMARY KEY,
		roleName NVARCHAR(100) NOT NULL,
		idEventType INTEGER NOT NULL
	);
	CREATE TABLE events.tblCareers(
		idCareer INTEGER IDENTITY PRIMARY KEY,
		careerName NVARCHAR(100) NOT NULL
	);



-- CREACION TABLAS SCHEMA SPORTS
	CREATE TABLE sports.tblSports (
		idSport INT PRIMARY KEY,
		minAthletesCapacity INTEGER NOT NULL DEFAULT 0,
		maxAthletesCapacity INTEGER NOT NULL DEFAULT 0,
		minModalitiesCapacity INTEGER NOT NULL,
		idSportType INTEGER NOT NULL
	);
	GO
	CREATE TABLE sports.tblSportTypes (
		idSportType INT IDENTITY PRIMARY KEY,
		sportTypeName NVARCHAR(150) NOT NULL
	);
	GO 

	CREATE TABLE sports.tblSportModalities(
		idSportModality INTEGER IDENTITY PRIMARY KEY,
		idSport INTEGER NOT NULL,
		modalityName NVARCHAR(150) NOT NULL,
		hasCategories BIT NOT NULL DEFAULT 0,
		maxCategoryCapacityPerAthlete INTEGER NOT NULL,
		maxCapacity INTEGER NOT NULL
	);
	GO
	

	CREATE TABLE sports.tblSportDelegations (
		idSportDelegation INTEGER PRIMARY KEY,
		idGender TINYINT NOT NULL
	);
	GO  

	CREATE TABLE sports.tblSportCategories(
		idSportCategory INTEGER IDENTITY PRIMARY KEY,
		idSportModality INTEGER NOT NULL,
		categoryName NVARCHAR(150) NOT NULL,
		idGender TINYINT,
		isForBothGenders BIT NOT NULL,
		maxCapacity INTEGER NOT NULL,
	);
	GO

	CREATE TABLE sports.tblSportTests(
		idSportTest INTEGER IDENTITY PRIMARY KEY,
		idSport INT NOT NULL,
		maxCapacity INTEGER NOT NULL,
		testName NVARCHAR(150) NOT NULL,
		idTestType INTEGER NOT NULL,
		idGender TINYINT,
		isForBothGenders BIT NOT NULL,

	);
	GO
	CREATE TABLE sports.tblTestTypes(
		idTestType INTEGER IDENTITY PRIMARY KEY,
		idTestName NVARCHAR(150) NOT NULL,
		maxCategoryCapacityPerAthlete INTEGER NOT NULL,
	);
	GO

	CREATE TABLE sports.tblAthleteSportModalities(
		idAthleteSportModality INTEGER IDENTITY PRIMARY KEY,
		idSportDelegation INTEGER NOT NULL,
		idSportModality INTEGER NOT NULL,
	);
	GO

	CREATE TABLE sports.tblAthleteSportCategories(
		idAthleteSportCategory INTEGER IDENTITY PRIMARY KEY,
		idSportDelegation INTEGER NOT NULL,
		idSportCategory INTEGER NOT NULL,
	);
	GO

	CREATE TABLE sports.tblAthleteSportTests(
		idAthleteSportTest INTEGER IDENTITY PRIMARY KEY,
		idSportDelegation INTEGER NOT NULL,
		idSportTest INTEGER NOT NULL,
	);
	GO

-- CREACION TABLAS SCHEMMA ARTS
	CREATE TABLE arts.tblArtDelegations(
		idArtDelegation INTEGER PRIMARY KEY,
		idProposal INTEGER  NULL,
		idArtModality INTEGER  NULL,
		idArtCategory INTEGER  NULL
	);
	GO
	CREATE TABLE arts.tblProposals(
		idProposal INTEGER IDENTITY PRIMARY KEY,
		proposalName NVARCHAR(150) NOT NULL,
		authorName NVARCHAR(100) NOT NULL,
		synopsis NVARCHAR(150) NOT NULL,
		duration FLOAT NULL, 
		technicalRyder NVARCHAR(500) NOT NULL,
		performancesAmount INTEGER NULL,
	);
	GO
	CREATE TABLE arts.tblArts(
		idArt INTEGER PRIMARY KEY,
		idArtType INTEGER NOT NULL
	);
	GO
	CREATE TABLE arts.tblArtTypes(
		idArtType INTEGER IDENTITY PRIMARY KEY,
		artTypeName NVARCHAR(150) NOT NULL
	);  
	GO
	CREATE TABLE arts.tblArtModalities(
		idArtModality INTEGER IDENTITY PRIMARY KEY,
		idArt INTEGER NOT NULL,
		modalityName NVARCHAR(150) NOT NULL,
		hasCategories BIT NOT NULL DEFAULT 0
	);
	GO
	CREATE TABLE arts.tblArtCategories(
		idArtCategory INTEGER IDENTITY PRIMARY KEY,
		idArt INTEGER NOT NULL,
		categoryName NVARCHAR(150) NOT NULL
	);
	GO
	CREATE TABLE arts.tblArtCategoriesModalities(
		idArtCategoryModality INTEGER IDENTITY PRIMARY KEY,
		idArtCategory INTEGER NOT NULL,
		idArtModality INTEGER NOT NULL 
	);
	GO




-- CREACION TABLAS SCHEMA USERS
	CREATE TABLE users.tblGenders(
		idGender TINYINT IDENTITY PRIMARY KEY,
		genderName NVARCHAR(20) NOT NULL
	);
	GO

	CREATE TABLE users.tblPersons (
		idPerson INTEGER IDENTITY PRIMARY KEY,
		identificationDocument NVARCHAR(50) NOT NULL,
		universityCardNumber NVARCHAR(50),
		firstName NVARCHAR(120) NOT NULL,
		secondName NVARCHAR(120),
		lastName NVARCHAR(120) NOT NULL,
		secondLastName NVARCHAR(120),
		birthDate DATETIME,
		registerDate DATETIME NOT NULL DEFAULT SYSDATETIME(),
		idUniversity INTEGER NOT NULL,
		idGender TINYINT NOT NULL,
		idCountry INTEGER NOT NULL,
		idCareer INTEGER NOT NULL
	);
	GO

	CREATE TABLE users.tblDelegationPersons(
		idDelegationPerson INTEGER IDENTITY PRIMARY KEY,
		idDelegation INTEGER NOT NULL,
		idPerson INTEGER NOT NULL,
		idRole INTEGER NOT NULL
	);
	GO

	CREATE TABLE users.tblUsers (
		idUser INTEGER PRIMARY KEY,
		username NVARCHAR(200) NOT NULL,
		email NVARCHAR(50),
		password NVARCHAR(200) NOT NULL,
		isEnabled BIT NOT NULL DEFAULT 1
	);
	GO

	/*
	CREATE TABLE users.tblUserEvents(
		idUserEvents INTEGER IDENTITY PRIMARY KEY,
		idUser INTEGER NOT NULL,
		idEvent INTEGER NOT NULL,
		isEnbled BIT NOT NULL DEFAULT 1,
	);
	GO
	*/

	-- PREGUNTAR INVESTIGAR COMO SE VA A MANEJAR
	CREATE TABLE users.tblUserRoles (
		idUserRole INTEGER IDENTITY PRIMARY KEY,
		roleName NVARCHAR(50) NOT NULL,
		description NVARCHAR(MAX) NOT NULL,
		show BIT NOT NULL DEFAULT 1
	);
	GO

	CREATE TABLE users.tblUserRoleRelations (
		idUserRoleRelation INTEGER IDENTITY PRIMARY KEY,
		idUser INTEGER NOT NULL,
		idUserRole INTEGER NOT NULL,
		isActive BIT NOT NULL DEFAULT 1
	);
	GO

	/*
	CREATE TABLE users.tblRoleActions (
		idAction INTEGER IDENTITY PRIMARY KEY,
		actionName NVARCHAR(150) NOT NULL,
		actionDescription NVARCHAR(MAX) NOT NULL,
		show BIT NOT NULL DEFAULT 1
	);
	GO

	CREATE TABLE users.tblRoleActionRelations (
		idUserRoleAction INTEGER IDENTITY PRIMARY KEY,
		idUser INTEGER NOT NULL,
		idAction INTEGER NOT NULL,
		isActive BIT NOT NULL DEFAULT 1
	);
	GO
	*/

-- CONSTRAINT (UNIQUE) SCHEMA EVENTS
	ALTER TABLE events.tblEventTypes
	ADD CONSTRAINT ukEventTypeName UNIQUE (eventTypeName);
	GO

	ALTER TABLE events.tblConfigurationValueTypes
	ADD CONSTRAINT ukConfigValueTypeName UNIQUE (configValueTypeName);
	GO

	ALTER TABLE events.tblConfigurationParameters
	ADD CONSTRAINT ukDescription UNIQUE(description);
	GO

	ALTER TABLE events.tblUniversityStaffTypes
	ADD CONSTRAINT ukUniversityStaffType UNIQUE (idUniversityStaffType);
	GO

	ALTER TABLE events.tblPositions
	ADD CONSTRAINT ukPositionName UNIQUE (positionName);
	GO

	ALTER TABLE events.tblAuthorityPositions 
	ADD CONSTRAINT ukUniversityStaff_Position UNIQUE (idUniversityStaff, idPosition),
	CONSTRAINT ukUniversityStaff_Position_PositionOther UNIQUE (idUniversityStaff, idPosition, positionOther);
	GO

	ALTER TABLE events.tblDoctorSpecialties
	ADD CONSTRAINT ukDoctorSpecialties_Specialty UNIQUE (idDoctorSpecialty, idSpecialty),
	CONSTRAINT ukDoctorSpecialties_Specialty_PositionOther UNIQUE (idDoctorSpecialty, idSpecialty, specialtyOther);
	GO

	ALTER TABLE events.tblSpecialties
	ADD CONSTRAINT ukSpecialtyName UNIQUE (specialtyName);
	GO

	ALTER TABLE events.tblCommissions
	ADD CONSTRAINT ukCommissionName UNIQUE (commissionName);
	GO

	ALTER TABLE events.tblRoles
	ADD CONSTRAINT ukRoleName UNIQUE (roleName);
	GO


-- CONSTRAINT (UNIQUE) SCHEMA  USUARIOS 
	ALTER TABLE users.tblUsers
	ADD CONSTRAINT ukusername UNIQUE (username);
	GO 

	ALTER TABLE users.tblUserRoles
	ADD CONSTRAINT ukroleName UNIQUE (roleName);
	GO

	/*
	ALTER TABLE users.tblRoleActions
	ADD CONSTRAINT ukactionName UNIQUE (actionName);
	GO
	*/

-- CONSTRAINT (UNIQUE) SCHEMA SPOTRTS
	ALTER TABLE sports.tblSportDelegations
	ADD CONSTRAINT ukDelegation_Gender_Sport UNIQUE (idGender);
	GO

	/*
	ALTER TABLE sports.tblSports
	ADD CONSTRAINT uksportName UNIQUE (sportName);
	GO
	*/
	 
	ALTER TABLE sports.tblSportModalities
	ADD CONSTRAINT ukmodalityName UNIQUE (idSport, modalityname);
	GO

	ALTER TABLE sports.tblSportCategories 
	ADD CONSTRAINT	ukSportModality_Category_Gender UNIQUE (idSportModality, categoryName , idGender);
	GO

	ALTER TABLE sports.tblSportTests
	ADD CONSTRAINT ukSport_Test_TestType_Gender UNIQUE (idSport ,testName ,idTestType ,idGender );
	GO

	ALTER TABLE sports.tblAthleteSportModalities 
	ADD CONSTRAINT ukDelegationType_SportModality UNIQUE (idSportDelegation, idSportModality);
	GO

	ALTER TABLE sports.tblAthleteSportCategories
	ADD CONSTRAINT ukDelegationType_SportCategory UNIQUE (idSportDelegation, idSportCategory);

	ALTER TABLE sports.tblAthleteSportTests 
	ADD CONSTRAINT ukDelegationType_SportTest UNIQUE (idSportDelegation, idSportTest);
	GO


	CREATE UNIQUE INDEX idxPersons_universityCardNumber
	ON users.tblPersons(universityCardNumber)
	WHERE universityCardNumber IS NOT NULL
	GO

	CREATE UNIQUE INDEX idxUsers_email
	ON users.tblUsers(email)
	WHERE email IS NOT NULL
	GO

	-- Creacion de Indices de busquedas de inicio de Sesion 
	CREATE INDEX IX_tblLoginAttempts_email_date 
	ON asset.tblLoginAttempts(email, attemptDate);
	
	CREATE INDEX IX_tblLoginAttempts_date 
	ON asset.tblLoginAttempts(attemptDate);

	ALTER TABLE users.tblDelegationPersons
	ADD CONSTRAINT ukDelegationPersons UNIQUE (idDelegationPerson, idDelegation, idPerson, idRole);
	GO
	ALTER TABLE users.tblPersons
	ADD CONSTRAINT ukidentificationDocument UNIQUE (identificationDocument);
	GO

-- CONSTRAINT (CHECK) SCHEMA USERS
	ALTER TABLE users.tblPersons 
	ADD CONSTRAINT ChkIdentificationDocument
	CHECK (identificationDocument NOT LIKE '%[^a-zA-Z0-9]%');


-- CONSTRAINT (FOREIGN KEY) SCHEMA EVENTS
	ALTER TABLE events.tblUniversities
	ADD CONSTRAINT fkUniversities_Countries FOREIGN KEY (idCountry) REFERENCES events.tblCountries(idCountry);
	GO

	ALTER TABLE events.tblEvents
	ADD CONSTRAINT fkEvents_EventTypes FOREIGN KEY (idEventType) REFERENCES events.tblEventTypes(idEventType);
	GO

	ALTER TABLE events.tblEventConfigurations
	ADD CONSTRAINT fkEventsConfigurations_ConfigurationValueTypes FOREIGN KEY (idConfigValueType) REFERENCES events.tblConfigurationValueTypes(idConfigValueType),
		CONSTRAINT fkEventsConfigurations_idConfigurationParameters FOREIGN KEY (idConfigParam) REFERENCES events.tblConfigurationParameters (idConfigParam);
	GO

	ALTER TABLE events.tblDelegations
	ADD CONSTRAINT fkDelegations_Universities FOREIGN KEY (idUniversity) REFERENCES events.tblUniversities(idUniversity),
	CONSTRAINT fkDelegations_DelegationType FOREIGN KEY (idDelegationType) REFERENCES events.tblDelegationType(idDelegationType);
	GO

	ALTER TABLE events.tblDelegationType
	ADD CONSTRAINT fkDelegationsType_Events FOREIGN KEY (idEvent) REFERENCES events.tblEvents(idEvent);
	GO

	ALTER TABLE events.tblUniversityStaffs
	ADD CONSTRAINT fkDelegationPersons_PersonsUniversityStaff_University FOREIGN KEY (idUniversity) REFERENCES events.tblUniversities(idUniversity),
	CONSTRAINT  fkUniversityStaff_UniversityStaffType FOREIGN KEY (idUniversityStaffType) REFERENCES events.tblUniversityStaffTypes(idUniversityStaffType),
	CONSTRAINT	fkUniversityStaff_Person FOREIGN KEY (idPerson) REFERENCES users.tblPersons(idPerson),
	CONSTRAINT	fkUniversityStaff_Event FOREIGN KEY (idEvent) REFERENCES events.tblevents(idEvent),
	CONSTRAINT	fkUniversityStaff_Commission FOREIGN KEY (idCommission) REFERENCES events.tblCommissions(idCommission);
	GO
	
	ALTER TABLE events.tblSpeakers
	ADD CONSTRAINT fkSpeakers_UniversityStaff FOREIGN KEY (idUniversityStaff) REFERENCES events.tblUniversityStaffs(idUniversityStaff),
	CONSTRAINT fkSpeakers_SpeakerCategory FOREIGN KEY (idSpeakerCategory) REFERENCES events.tblSpeakerCategories(idSpeakerCategory);
	GO

	ALTER TABLE events.tblAuthorityPositions
	ADD CONSTRAINT fkAuthorityPosition_UniversityStaff FOREIGN KEY (idUniversityStaff) REFERENCES events.tblUniversityStaffs(idUniversityStaff),
	CONSTRAINT fkAuthorityPosition_Position FOREIGN KEY (idPosition) REFERENCES events.tblPositions(idPosition);
	GO

	ALTER TABLE events.tblDoctorSpecialties
	ADD CONSTRAINT fkDoctorSpecialties_UniversityStaff FOREIGN KEY (idUniversityStaff)  REFERENCES events.tblUniversityStaffs (idUniversityStaff),
	CONSTRAINT fkDoctorSpecialties_Specialty FOREIGN KEy (idSpecialty) REFERENCES events.tblSpecialties (idSpecialty);
	GO

	ALTER TABLE events.tblConferences 
	ADD CONSTRAINT fkConferences_Speakers FOREIGN KEY (idSpeaker) REFERENCES events.tblSpeakers(idSpeaker),
	CONSTRAINT fkConferences_ConferenceThemes FOREIGN KEY(idConferenceTheme) REFERENCES events.tblConferenceThemes(idConferenceTheme),
	CONSTRAINT fkConferences_ConferenceTypes FOREIGN KEY(idConferenceType) REFERENCES events.tblConferenceTypes(idConferenceType);
	GO

	ALTER TABLE events.tblRoles
	ADD CONSTRAINT fkRoles_EventTypes FOREIGN KEY (idEventType) REFERENCES events.tblEventTypes(idEventType);
	GO

	
-- CONSTRAINT (FOREIGN KEY) SCHEMA SPORTS
	ALTER TABLE sports.tblSports
	ADD CONSTRAINT fkSports_DelegationTypes FOREIGN KEY (idSport) REFERENCES events.tblDelegationType(idDelegationType),
	CONSTRAINT fkSports_SportTypes FOREIGN KEY (idSportType) REFERENCES sports.tblSportTypes(idSportType);
	GO

	ALTER TABLE sports.tblSportModalities
	ADD CONSTRAINT fkSportModalities_Sports FOREIGN KEY (idSport) REFERENCES sports.tblSports(idSport);
	GO

	ALTER TABLE sports.tblSportCategories 
	ADD CONSTRAINT fkSportCategories_SportModalities FOREIGN KEY (idSportModality) REFERENCES sports.tblSportModalities(idSportModality),
	CONSTRAINT fkSportCategories_Genders FOREIGN KEY (idGender) REFERENCES users.tblGenders(idGender);
	GO

	ALTER TABLE sports.tblSportDelegations
	ADD CONSTRAINT fkSportDelegations_Delegation FOREIGN KEY (idSportDelegation) REFERENCES events.tblDelegations(idDelegation),
    CONSTRAINT fkSportDelegations_Genders FOREIGN KEY (idGender) REFERENCES users.tblGenders(idGender);
	GO

	ALTER TABLE sports.tblSportTests
	ADD CONSTRAINT fkSportTest_Sports FOREIGN KEY (idSport) REFERENCES sports.tblSports(idSport),
	CONSTRAINT fkSportTest_TestType FOREIGN KEY (idTestType) REFERENCES sports.tblTestTypes(idTestType),
    CONSTRAINT fkSportTest_Genders FOREIGN KEY (idGender) REFERENCES users.tblGenders(idGender);
	GO

	ALTER TABLE sports.tblAthleteSportModalities
	ADD CONSTRAINT fkAthleteSportModalities_SportDelegation FOREIGN KEY (idSportDelegation) REFERENCES sports.tblSportDelegations(idSportDelegation),
	CONSTRAINT fkAthleteSportModalities_SportModalities FOREIGN KEY (idSportModality) REFERENCES sports.tblSportModalities(idSportModality);
	
	GO

	ALTER TABLE sports.tblAthleteSportCategories
	ADD CONSTRAINT fkAthleteSportCategories_SportDelegation FOREIGN KEY (idSportDelegation) REFERENCES sports.tblSportDelegations(idSportDelegation),
		CONSTRAINT fkAthleteSportCategories_SportCategory FOREIGN KEY (idSportCategory) REFERENCES sports.tblSportCategories (idSportCategory);
	GO
	ALTER TABLE sports.tblAthleteSportTests
	ADD CONSTRAINT fkAthleteSportTests_SportDelegation FOREIGN KEY (idSportDelegation) REFERENCES sports.tblSportDelegations(idSportDelegation),
	CONSTRAINT fkAthleteSportTests_SportTests FOREIGN KEY (idSportTest) REFERENCES sports.tblSportTests(idSportTest);
	GO 

-- CONSTRAINT (FOREIGN KEY) SCHEMA ARTS
	ALTER TABLE arts.tblArtDelegations
	ADD CONSTRAINT fkArtDelegations_Delegation FOREIGN KEY (idArtDelegation) REFERENCES  events.tblDelegations (idDelegation),
	CONSTRAINT fkArtDelegations_Proposals FOREIGN KEY (idProposal) REFERENCES  arts.tblProposals (idProposal),
	CONSTRAINT fkArtDelegations_ArtModality FOREIGN KEY (idArtModality) REFERENCES  arts.tblArtModalities (idArtModality),
	CONSTRAINT fkArtDelegations_ArtCategory FOREIGN KEY (idArtModality) REFERENCES  arts.tblArtModalities (idArtModality);
	GO

	ALTER TABLE arts.tblArts
	ADD CONSTRAINT fkArts_DelegationType  FOREIGN KEY (idArt ) REFERENCES events.tblDelegationType(idDelegationType),
	CONSTRAINT fkArts_ArtTypes FOREIGN KEY (idArtType) REFERENCES  arts.tblArtTypes(idArtType);
	GO 

	ALTER TABLE arts.tblArtModalities 
	ADD CONSTRAINT fkArtsModalities_Arts FOREIGN KEY (idArt) REFERENCES  arts.tblArts(idArt);
	GO

	ALTER TABLE arts.tblArtCategories
	ADD CONSTRAINT fkArtCategories_Arts FOREIGN KEY (idArt) REFERENCES  arts.tblArts(idArt );
	GO

	 ALTER TABLE arts.tblArtCategoriesModalities
	ADD CONSTRAINT fkArtCategoriesModalities_Modalities FOREIGN KEY (idArtModality) REFERENCES  arts.tblArtModalities(idArtModality),
	 CONSTRAINT fkArtCategoriesModalities_Categories FOREIGN KEY (idArtCategory) REFERENCES  arts.tblArtCategories (idArtCategory);
	GO


-- CONSTRAINT (FOREIGN KEY) SCHEMA USERS
	ALTER TABLE users.tblPersons
	ADD CONSTRAINT fkPersons_Universities FOREIGN KEY (idUniversity) REFERENCES events.tblUniversities(idUniversity),
		CONSTRAINT fkPersons_Genders FOREIGN KEY (idGender) REFERENCES users.tblGenders(idGender),
		CONSTRAINT fkPersons_Country FOREIGN KEY (idCountry) REFERENCES events.tblCountries(idCountry),
		CONSTRAINT fkPersons_Career FOREIGN KEY (idCareer) REFERENCES events.tblCareers(idCareer)
	GO

	ALTER TABLE users.tblUsers
	ADD CONSTRAINT fkUsers_Persons FOREIGN KEY (idUser) REFERENCES users.tblPersons(idPerson);
	GO

	/*
	ALTER TABLE users.tblUserEvents
	ADD CONSTRAINT fkUsers_Evets FOREIGN KEY (idEvent) REFERENCES events.tblEvents (idEvent);
	GO
	*/
	
	ALTER TABLE users.tblUserRoleRelations
	ADD CONSTRAINT fkUserRoleRelations_Users FOREIGN KEY (idUser) REFERENCES users.tblUsers(idUser),
		CONSTRAINT fkUserRoleRelations_Roles FOREIGN KEY (idUserRole) REFERENCES users.tblUserRoles(idUserRole);
	GO

	/*
	ALTER TABLE users.tblRoleActionRelations
	ADD CONSTRAINT fkRoleActionRelations_Roles FOREIGN KEY (idUserRole) REFERENCES users.tblUserRoles(idUserRole),
		CONSTRAINT fkRoleActionRelations_Actions FOREIGN KEY (idAction) REFERENCES users.tblRoleActions(idAction);
	GO
	*/

	ALTER TABLE users.tblDelegationPersons
	ADD CONSTRAINT fkDelegationPersons_Delegations FOREIGN KEY (idDelegation) REFERENCES events.tblDelegations(idDelegation),
		CONSTRAINT fkDelegationPersons_Persons FOREIGN KEY (idPerson) REFERENCES users.tblPersons(idPerson),
		CONSTRAINT fkDelegationPersons_Roles FOREIGN KEY (idRole) REFERENCES events.tblRoles(idRole);
	GO
