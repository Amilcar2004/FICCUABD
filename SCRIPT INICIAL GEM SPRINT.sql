 -- SCRIPT INICIAL DE BASE DE DATOS GEM

USE MASTER;
/*IF EXISTS 
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
*/
CREATE DATABASE DbGestionGem;
ALTER DATABASE DbGestionGem COLLATE Latin1_General_100_CI_AS_SC_UTF8;
GO

USE DbGestionGem;
GO

CREATE SCHEMA ficcua2026;
GO

-- CREACION TABLAS
CREATE TABLE ficcua2026.tblLoginAttempts(
    idLoginAttempt INT IDENTITY PRIMARY KEY,
    email NVARCHAR(100) NOT NULL,
    ipClient NVARCHAR(100),
    userAgent NVARCHAR(200),
    isSuccessful BIT NOT NULL,
    reason NVARCHAR(100) NOT NULL,
    attemptDate DATETIME NOT NULL  DEFAULT SYSDATETIME()
);


	CREATE TABLE ficcua2026.tblUniversities(
		idUniversity INTEGER IDENTITY PRIMARY KEY,
		universityName NVARCHAR(150) NOT NULL,
		acronym NVARCHAR(20) NOT NULL,
		idCountry INTEGER NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblDelegations(
		delegationName NVARCHAR(150) NOT NULL,
		idDelegation INTEGER IDENTITY PRIMARY KEY,
		idUniversity INTEGER NOT NULL, 
		idDelegationType INTEGER NOT NULL,
		idCategory INTEGER NULL,
		idModality INTEGER NULL,
		idProposal INTEGER NULL
	);
	GO 
		CREATE TABLE ficcua2026.tblDelegationTypes(
		idDelegationType INTEGER IDENTITY PRIMARY KEY,
		delegationName NVARCHAR(100) NOT NULL
	);
	GO  
	CREATE TABLE ficcua2026.tblCountries(
		idCountry INTEGER IDENTITY PRIMARY KEY,
		countryName NVARCHAR(100) NOT NULL,
		countryCode NVARCHAR(20) NOT NULL,
		nationality nVARCHAR(100) NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblEventConfigurations(
		booleanValue BIT,
		integerValue INTEGER,
		stringValue NVARCHAR(50),
		show BIT NOT NULL DEFAULT 1,
		idConfigValueType INTEGER NOT NULL,
		idConfigParam INTEGER NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblConfigurationValueTypes(
		idConfigValueType INTEGER IDENTITY PRIMARY KEY,
		configValueTypeName NVARCHAR(50) NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblConfigurationParameters(
		idConfigParam INTEGER IDENTITY PRIMARY KEY,
		description NVARCHAR(100) NOT NULL
	);

	CREATE TABLE ficcua2026.tblSpeakers(
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
	CREATE TABLE ficcua2026.tblSpeakerCategories(
		idSpeakerCategory INTEGER IDENTITY PRIMARY KEY,
		categoryName NVARCHAR(30) NOT NULL
	);
	GO


	CREATE TABLE ficcua2026.tblConferences(
		idConference INTEGER IDENTITY PRIMARY KEY,
		conferenceTitle NVARCHAR(250) NOT NULL,
		conferenceRequirements NVARCHAR(250),
		idSpeaker INTEGER NOT NULL,
		idConferenceTheme INTEGER NOT NULL,
		idConferenceType INTEGER NOT NULL
	);
	GO

	CREATE TABLE ficcua2026.tblConferenceThemes(
		idConferenceTheme INTEGER IDENTITY PRIMARY KEY,
		conferenceThemeName NVARCHAR(50) NOT NULL,
		themeDescription NVARCHAR(200) NOT NULL

	);
	GO

	CREATE TABLE ficcua2026.tblConferenceTypes(
		idConferenceType INTEGER IDENTITY PRIMARY KEY,
		conferenceTypeName NVARCHAR(50) NOT NULL,
		typeDescription NVARCHAR(200) NOT NULL
	);
	GO 

	CREATE TABLE ficcua2026.tblUniversityStaffs(
		idUniversityStaff INTEGER IDENTITY PRIMARY KEY,
		idUniversity INTEGER NOT NULL,
		idPerson INTEGER NOT NULL,
		idCommission INTEGER NOT NULL,
		idRole INTEGER NOT NULL
	);
	GO

	CREATE TABLE ficcua2026.tblCommissions(
		idCommission INTEGER IDENTITY PRIMARY KEY,
		commissionName NVARCHAR(100) NOT NULL
	);
	GO

	

	CREATE TABLE ficcua2026.tblDoctorSpecialties(
		idDoctorSpecialty INTEGER IDENTITY PRIMARY KEY,
		idUniversityStaff INTEGER NOT NULL,
		idSpecialty INTEGER NOT NULL,
		specialtyOther NVARCHAR(150)

	);

	CREATE TABLE ficcua2026.tblSpecialties(
		idSpecialty INTEGER IDENTITY PRIMARY KEY,
		specialtyName NVARCHAR(100) NOT NULL 
	);
	
	CREATE TABLE ficcua2026.tblRoles(
		idRole INTEGER IDENTITY PRIMARY KEY,
		roleName NVARCHAR(100) NOT NULL,
		idRoleCategory INTEGER NOT NULL,
		idAccessLevel INTEGER NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblRolesCategories(
		idRoleCategory INTEGER IDENTITY PRIMARY KEY,
		roleCategoryName NVARCHAR(100) NOT NULL,
		roleCategoryDescription NVARCHAR(100) NOT NULL
	);
	GO
	-- tblPersonRoles eliminada: delegación y staff almacenan idRole directamente
	-- Modelo evento único: sin idEvent, el programa conoce su contexto

	CREATE TABLE ficcua2026.tblEventAccessLevel(
		idAccessLevel INTEGER IDENTITY PRIMARY KEY,
		accessLevelCode NVARCHAR(100) NOT NULL,
		accessLevelName NVARCHAR(100) NOT NULL,
		iconKey NVARCHAR(100) NULL,
		accessLevelDescription NVARCHAR(200) NOT NULL
	);
	GO
	
	CREATE TABLE ficcua2026.tblCareers(
		idCareer INTEGER IDENTITY PRIMARY KEY,
		careerName NVARCHAR(100) NOT NULL
	);



-- SCHEMA SPORTS: movido a script separado para eventos deportivos

-- CREACION TABLAS EVENT (modalities/categories) y ARTS
	CREATE TABLE ficcua2026.tblModalities(
		idModality INTEGER IDENTITY PRIMARY KEY,
		idDelegationType INTEGER NOT NULL,
		modalityName NVARCHAR(150) NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblCategories(
		idCategory INTEGER IDENTITY PRIMARY KEY,
		idModality INTEGER NOT NULL,
		categoryName NVARCHAR(150) NOT NULL
	);
	GO
	CREATE TABLE ficcua2026.tblProposals(
		idProposal INTEGER IDENTITY PRIMARY KEY,
		proposalName NVARCHAR(150) NOT NULL,
		authorName NVARCHAR(100) NOT NULL,
		synopsis NVARCHAR(150) NOT NULL,
		duration FLOAT NULL, 
		technicalRyder NVARCHAR(500) NOT NULL,
		performancesAmount INTEGER NULL
	);
	GO




-- CREACION TABLAS SCHEMA USERS
	CREATE TABLE ficcua2026.tblGenders(
		idGender TINYINT IDENTITY PRIMARY KEY,
		genderName NVARCHAR(20) NOT NULL
	);
	GO

	CREATE TABLE ficcua2026.tblPersons (
		idPerson INTEGER IDENTITY PRIMARY KEY,
		identificationDocument NVARCHAR(50) NOT NULL,
		universityCardNumber NVARCHAR(50),
		firstName NVARCHAR(120) NOT NULL,
		secondName NVARCHAR(120),
		lastName NVARCHAR(120) NOT NULL,
		secondLastName NVARCHAR(120),
		birthDate DATETIME NULL,
		registerDate DATETIME NOT NULL DEFAULT SYSDATETIME(),
		idUniversity INTEGER NOT NULL,
		idGender TINYINT NOT NULL,
		idCountry INTEGER NOT NULL,
		idCareer INTEGER NULL
	);
	GO

	CREATE TABLE ficcua2026.tblDelegationPersons(
		idDelegationPerson INTEGER IDENTITY PRIMARY KEY,
		idDelegation INTEGER NOT NULL,
		idPerson INTEGER NOT NULL,
		idRole INTEGER NOT NULL
	);
	GO

	-- Archivos S3: persona (1 fila = 1 archivo subido)
	CREATE TABLE ficcua2026.tblPersonFiles (
		idPersonFile INTEGER IDENTITY PRIMARY KEY,
		idPerson INTEGER NOT NULL,
		fileType NVARCHAR(50) NOT NULL,
		fileUrl NVARCHAR(500) NOT NULL,
		s3Key NVARCHAR(255) NOT NULL,
		uploadDate DATETIME NOT NULL DEFAULT SYSDATETIME()
	);
	GO

	-- Archivos S3: obras (1 fila = 1 archivo subido)
	CREATE TABLE ficcua2026.tblDelegationFiles (
		idDelegationFile INTEGER IDENTITY PRIMARY KEY,
		idDelegation INTEGER NOT NULL,
		fileType NVARCHAR(50) NOT NULL,
		fileUrl NVARCHAR(500) NOT NULL,
		s3Key NVARCHAR(255) NOT NULL,
		uploadDate DATETIME NOT NULL DEFAULT SYSDATETIME()
	);
	GO

	CREATE TABLE ficcua2026.tblUsers (
		idUser INTEGER PRIMARY KEY,
		username NVARCHAR(200) NOT NULL,
		email NVARCHAR(50),
		password NVARCHAR(200) NOT NULL,
		isEnabled BIT NOT NULL DEFAULT 1,
		refreshToken NVARCHAR(1000) NULL  -- session única por usuario: crea/actualiza en login, null en logout
	);
	GO


	CREATE TABLE ficcua2026.tblEventUser(
		idEventUser INTEGER IDENTITY PRIMARY KEY,
		idUser INTEGER NOT NULL,
		isEnabled BIT NOT NULL DEFAULT 1
	);
	GO


	CREATE TABLE ficcua2026.tblUserRoles (
		idUserRole INTEGER IDENTITY PRIMARY KEY,
		roleName NVARCHAR(50) NOT NULL,
		description NVARCHAR(MAX) NOT NULL,
		show BIT NOT NULL DEFAULT 1
	);
	GO

	CREATE TABLE ficcua2026.tblUserRoleRelations (
		idUserRoleRelation INTEGER IDENTITY PRIMARY KEY,
		idUser INTEGER NOT NULL,
		idUserRole INTEGER NOT NULL,
		isActive BIT NOT NULL DEFAULT 1
	);
	GO

	
	CREATE TABLE ficcua2026.tblRoleActions (
		idAction INTEGER IDENTITY PRIMARY KEY,
		actionName NVARCHAR(150) NOT NULL,
		actionDescription NVARCHAR(MAX) NOT NULL,
		show BIT NOT NULL DEFAULT 1
	);
	GO

	CREATE TABLE ficcua2026.tblRoleActionRelations (
		idUserRoleAction INTEGER IDENTITY PRIMARY KEY,
		idUserRole INTEGER NOT NULL,
		idAction INTEGER NOT NULL,
		isActive BIT NOT NULL DEFAULT 1
	);
	
	CREATE TABLE ficcua2026.tblEndpointActions (
    idEndpointAction INTEGER IDENTITY PRIMARY KEY,
    httpMethod NVARCHAR(10) NOT NULL,      -- GET, POST, PUT, DELETE
    pathPattern NVARCHAR(255) NOT NULL,    -- /users, /users/:id, /users/*
    idAction INTEGER NOT NULL,            
    isActive BIT NOT NULL DEFAULT 1
	);
	GO

-- CONSTRAINT (UNIQUE) SCHEMA EVENT
	ALTER TABLE ficcua2026.tblConfigurationValueTypes
	ADD CONSTRAINT ukConfigValueTypeName UNIQUE (configValueTypeName);
	GO

	ALTER TABLE ficcua2026.tblConfigurationParameters
	ADD CONSTRAINT ukDescription UNIQUE(description);
	GO

	CREATE UNIQUE INDEX ukRolesCategories_Catalog ON ficcua2026.tblRolesCategories(roleCategoryName);
	GO


	ALTER TABLE ficcua2026.tblDoctorSpecialties
	ADD CONSTRAINT ukDoctorSpecialties_Specialty UNIQUE (idDoctorSpecialty, idSpecialty),
	CONSTRAINT ukDoctorSpecialties_Specialty_PositionOther UNIQUE (idDoctorSpecialty, idSpecialty, specialtyOther);
	GO

	ALTER TABLE ficcua2026.tblSpecialties
	ADD CONSTRAINT ukSpecialtyName UNIQUE (specialtyName);
	GO

	ALTER TABLE ficcua2026.tblCommissions
	ADD CONSTRAINT ukCommissionName UNIQUE (commissionName);
	GO

	ALTER TABLE ficcua2026.tblRoles
	ADD CONSTRAINT ukRole_RoleName_EventType_Event UNIQUE (roleName, idRoleCategory, idAccessLevel);
	GO

	-- ukPerson_Role_Event eliminado (tblPersonRoles eliminada)

	ALTER TABLE ficcua2026.tblEventAccessLevel
	ADD CONSTRAINT ukEventAccessLevelName UNIQUE (accessLevelName);
	GO

	ALTER TABLE ficcua2026.tblEventUser
	ADD CONSTRAINT ukEventUser_User UNIQUE (idUser);
	GO



-- CONSTRAINT (UNIQUE) SCHEMA  USUARIOS 
	ALTER TABLE ficcua2026.tblUsers
	ADD CONSTRAINT ukusername UNIQUE (username);
	GO 

	ALTER TABLE ficcua2026.tblUserRoles
	ADD CONSTRAINT ukroleName UNIQUE (roleName);
	GO

	
	ALTER TABLE ficcua2026.tblRoleActions
	ADD CONSTRAINT ukactionName UNIQUE (actionName);
	GO
	

-- CONSTRAINT (UNIQUE) EVENT modalities/categories
	ALTER TABLE ficcua2026.tblModalities
	ADD CONSTRAINT ukModalities_DelegationType_Name UNIQUE (idDelegationType, modalityName);
	GO
	ALTER TABLE ficcua2026.tblCategories
	ADD CONSTRAINT ukCategories_Modality_Name UNIQUE (idModality, categoryName);
	GO


	CREATE UNIQUE INDEX idxPersons_universityCardNumber
	ON ficcua2026.tblPersons(universityCardNumber)
	WHERE universityCardNumber IS NOT NULL
	GO

	CREATE UNIQUE INDEX idxUsers_email
	ON ficcua2026.tblUsers(email)
	WHERE email IS NOT NULL
	GO
	CREATE UNIQUE INDEX idxPersons_identificationDocument
	ON ficcua2026.tblPersons(identificationDocument)
	WHERE identificationDocument IS NOT NULL
	GO

	-- Creacion de Indices de busquedas de inicio de Sesion 
	CREATE INDEX IX_tblLoginAttempts_email_date 
	ON ficcua2026.tblLoginAttempts(email, attemptDate);
	
	CREATE INDEX IX_tblLoginAttempts_date 
	ON ficcua2026.tblLoginAttempts(attemptDate);

	ALTER TABLE ficcua2026.tblUniversityStaffs
	ADD CONSTRAINT ukUniversityStaff_Person_University UNIQUE (idPerson, idUniversity);
	GO
-- CONSTRAINT (UNIQUE) SCHEMA USERS
	ALTER TABLE ficcua2026.tblDelegationPersons
	ADD CONSTRAINT ukDelegationPersons UNIQUE (idDelegation, idPerson);
	GO

	ALTER TABLE ficcua2026.tblPersons
	ADD CONSTRAINT ukidentificationDocument UNIQUE (identificationDocument);
	GO

	-- Necesario para FK fkUniversityStaff_Person_University: la tabla referenciada debe tener PK o UNIQUE en (idPerson, idUniversity)
	ALTER TABLE ficcua2026.tblPersons
	ADD CONSTRAINT ukPerson_University UNIQUE (idPerson, idUniversity);
	GO


-- CONSTRAINT (CHECK) SCHEMA USERS
	ALTER TABLE ficcua2026.tblPersons 
	ADD CONSTRAINT ChkIdentificationDocument
	CHECK (identificationDocument NOT LIKE '%[^a-zA-Z0-9]%');


-- CONSTRAINT (FOREIGN KEY) SCHEMA EVENTS
	ALTER TABLE ficcua2026.tblUniversities
	ADD CONSTRAINT fkUniversities_Countries FOREIGN KEY (idCountry) REFERENCES ficcua2026.tblCountries(idCountry);
	GO

	ALTER TABLE ficcua2026.tblEventConfigurations
	ADD CONSTRAINT fkEventsConfigurations_ConfigurationValueTypes FOREIGN KEY (idConfigValueType) REFERENCES ficcua2026.tblConfigurationValueTypes(idConfigValueType),
		CONSTRAINT fkEventsConfigurations_idConfigurationParameters FOREIGN KEY (idConfigParam) REFERENCES ficcua2026.tblConfigurationParameters (idConfigParam);
	GO

	ALTER TABLE ficcua2026.tblDelegations
	ADD CONSTRAINT fkDelegation_University FOREIGN KEY (idUniversity) REFERENCES ficcua2026.tblUniversities(idUniversity),
	CONSTRAINT fkDelegation_DelegationType FOREIGN KEY (idDelegationType) REFERENCES ficcua2026.tblDelegationTypes(idDelegationType);
	GO

	ALTER TABLE ficcua2026.tblUniversityStaffs
	ADD 
	CONSTRAINT	fkUniversityStaff_Person_University FOREIGN KEY (idPerson,idUniversity) REFERENCES ficcua2026.tblPersons(idPerson,idUniversity),
	CONSTRAINT	fkUniversityStaff_Commission FOREIGN KEY (idCommission) REFERENCES ficcua2026.tblCommissions(idCommission);
	GO
	
	ALTER TABLE ficcua2026.tblSpeakers
	ADD CONSTRAINT fkSpeakers_UniversityStaff FOREIGN KEY (idUniversityStaff) REFERENCES ficcua2026.tblUniversityStaffs(idUniversityStaff),
	CONSTRAINT fkSpeakers_SpeakerCategory FOREIGN KEY (idSpeakerCategory) REFERENCES ficcua2026.tblSpeakerCategories(idSpeakerCategory);
	GO


	ALTER TABLE ficcua2026.tblDoctorSpecialties
	ADD CONSTRAINT fkDoctorSpecialties_UniversityStaff FOREIGN KEY (idUniversityStaff)  REFERENCES ficcua2026.tblUniversityStaffs (idUniversityStaff),
	CONSTRAINT fkDoctorSpecialties_Specialty FOREIGN KEY (idSpecialty) REFERENCES ficcua2026.tblSpecialties (idSpecialty);
	GO

	ALTER TABLE ficcua2026.tblConferences 
	ADD CONSTRAINT fkConferences_Speakers FOREIGN KEY (idSpeaker) REFERENCES ficcua2026.tblSpeakers(idSpeaker),
	CONSTRAINT fkConferences_ConferenceThemes FOREIGN KEY(idConferenceTheme) REFERENCES ficcua2026.tblConferenceThemes(idConferenceTheme),
	CONSTRAINT fkConferences_ConferenceTypes FOREIGN KEY(idConferenceType) REFERENCES ficcua2026.tblConferenceTypes(idConferenceType);
	GO

	ALTER TABLE ficcua2026.tblRoles
	ADD 
		CONSTRAINT fkRoles_AccessLevel FOREIGN KEY (idAccessLevel) REFERENCES ficcua2026.tblEventAccessLevel(idAccessLevel),
		CONSTRAINT fkRoles_RoleCategory FOREIGN KEY (idRoleCategory) REFERENCES ficcua2026.tblRolesCategories(idRoleCategory);
	GO


	-- FK idRole en tblUniversityStaffs
	ALTER TABLE ficcua2026.tblUniversityStaffs
	ADD CONSTRAINT fkUniversityStaff_Role FOREIGN KEY (idRole) REFERENCES ficcua2026.tblRoles(idRole);
	GO


	
-- CONSTRAINT (FOREIGN KEY) EVENT modalities/categories
	ALTER TABLE ficcua2026.tblModalities
	ADD CONSTRAINT fkModalities_DelegationType FOREIGN KEY (idDelegationType) REFERENCES ficcua2026.tblDelegationTypes(idDelegationType);
	GO
	ALTER TABLE ficcua2026.tblCategories
	ADD CONSTRAINT fkCategories_Modality FOREIGN KEY (idModality) REFERENCES ficcua2026.tblModalities(idModality);
	GO

-- CONSTRAINT (FOREIGN KEY) ARTS - delegaciones con arte (idProposal, idModality, idCategory en ficcua2026.tblDelegations)
	ALTER TABLE ficcua2026.tblDelegations
	ADD
	CONSTRAINT fkDelegation_Proposal FOREIGN KEY (idProposal) REFERENCES ficcua2026.tblProposals(idProposal),
	CONSTRAINT fkDelegation_Modality FOREIGN KEY (idModality) REFERENCES ficcua2026.tblModalities(idModality),
	CONSTRAINT fkDelegation_Category FOREIGN KEY (idCategory) REFERENCES ficcua2026.tblCategories(idCategory);
	GO


-- CONSTRAINT (FOREIGN KEY) SCHEMA USERS
	ALTER TABLE ficcua2026.tblPersons
	ADD CONSTRAINT fkPersons_Universities FOREIGN KEY (idUniversity) REFERENCES ficcua2026.tblUniversities(idUniversity),
		CONSTRAINT fkPersons_Genders FOREIGN KEY (idGender) REFERENCES ficcua2026.tblGenders(idGender),
		CONSTRAINT fkPersons_Country FOREIGN KEY (idCountry) REFERENCES ficcua2026.tblCountries(idCountry),
		CONSTRAINT fkPersons_Career FOREIGN KEY (idCareer) REFERENCES ficcua2026.tblCareers(idCareer)
	GO

	ALTER TABLE ficcua2026.tblUsers
	ADD CONSTRAINT fkUsers_Persons FOREIGN KEY (idUser) REFERENCES ficcua2026.tblPersons(idPerson);
	GO

	ALTER TABLE ficcua2026.tblEventUser
	ADD CONSTRAINT fkEventUser_User FOREIGN KEY (idUser) REFERENCES ficcua2026.tblUsers(idUser);
	GO
	
	ALTER TABLE ficcua2026.tblUserRoleRelations
	ADD CONSTRAINT fkUserRoleRelations_Users FOREIGN KEY (idUser) REFERENCES ficcua2026.tblUsers(idUser),
		CONSTRAINT fkUserRoleRelations_Roles FOREIGN KEY (idUserRole) REFERENCES ficcua2026.tblUserRoles(idUserRole);
	GO

	
	ALTER TABLE ficcua2026.tblRoleActionRelations
	ADD CONSTRAINT fkRoleActionRelations_Roles FOREIGN KEY (idUserRole) REFERENCES ficcua2026.tblUserRoles(idUserRole),
		CONSTRAINT fkRoleActionRelations_Actions FOREIGN KEY (idAction) REFERENCES ficcua2026.tblRoleActions(idAction);
	GO
	
	ALTER TABLE ficcua2026.tblEndpointActions
	ADD CONSTRAINT fkEndpointActions_RoleActions FOREIGN KEY (idAction) REFERENCES ficcua2026.tblRoleActions(idAction);	
	GO

	ALTER TABLE ficcua2026.tblDelegationPersons
	ADD CONSTRAINT fkDelegationPersons_Delegations FOREIGN KEY (idDelegation) REFERENCES ficcua2026.tblDelegations(idDelegation),
		CONSTRAINT fkDelegationPersons_Persons FOREIGN KEY (idPerson) REFERENCES ficcua2026.tblPersons(idPerson),
		CONSTRAINT fkDelegationPersons_Role FOREIGN KEY (idRole) REFERENCES ficcua2026.tblRoles(idRole);
	GO

	ALTER TABLE ficcua2026.tblPersonFiles
	ADD CONSTRAINT fkPersonFiles_Person FOREIGN KEY (idPerson) REFERENCES ficcua2026.tblPersons(idPerson);
	GO

	ALTER TABLE ficcua2026.tblDelegationFiles
	ADD CONSTRAINT fkDelegationFiles_Delegation FOREIGN KEY (idDelegation) REFERENCES ficcua2026.tblDelegations(idDelegation);
	GO

	