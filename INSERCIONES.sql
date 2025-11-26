USE DbGestionGem;
GO

-- Insertar datos en events.tblCountries
INSERT INTO events.tblCountries (countryName, countryCode, nationality) VALUES
('Afganistán', 'AF', 'Afgano(a)'),
('Islas Gland', 'AX', 'Alandés(a)'),
('Albania', 'AL', 'Albanés(a)'),
('Alemania', 'DE', 'Alemán(a)'),
('Andorra', 'AD', 'Andorrano(a)'),
('Angola', 'AO', 'Angoleño(a)'),
('Anguilla', 'AI', 'Anguillano(a)'),
('Antártida', 'AQ', 'Antártico(a)'),
('Antigua y Barbuda', 'AG', 'Antiguano(a) y Barbudense'),
('Antillas Holandesas', 'AN', 'Neerlandés(a) de las Antillas'),
('Arabia Saudí', 'SA', 'Saudí(a)'),
('Argelia', 'DZ', 'Argelino(a)'),
('Argentina', 'AR', 'Argentino(a)'),
('Armenia', 'AM', 'Armenio(a)'),
('Aruba', 'AW', 'Arubeño(a)'),
('Australia', 'AU', 'Australiano(a)'),
('Austria', 'AT', 'Austriaco(a)'),
('Azerbaiyán', 'AZ', 'Azerbaiyano(a)'),
('Bahamas', 'BS', 'Bahamés(a)'),
('Bahréin', 'BH', 'Bahreiní(a)'),
('Bangladesh', 'BD', 'Bangladesí(a)'),
('Barbados', 'BB', 'Barbadense(a)'),
('Bielorrusia', 'BY', 'Bielorruso(a)'),
('Bélgica', 'BE', 'Belga(a)'),
('Belice', 'BZ', 'Beliceño(a)'),
('Benin', 'BJ', 'Beninés(a)'),
('Bermudas', 'BM', 'Bermudeño(a)'),
('Bhután', 'BT', 'Butanés(a)'),
('Bolivia', 'BO', 'Boliviano(a)'),
('Bosnia y Herzegovina', 'BA', 'Bosnio(a)'),
('Botsuana', 'BW', 'Botsuano(a)'),
('Isla Bouvet', 'BV', 'Bouvetiano(a)'),
('Brasil', 'BR', 'Brasileño(a)'),
('Brunéi', 'BN', 'Bruneano(a)'),
('Bulgaria', 'BG', 'Búlgaro(a)'),
('Burkina Faso', 'BF', 'Burkinés(a)'),
('Burundi', 'BI', 'Burundés(a)'),
('Cabo Verde', 'CV', 'Caboverdiano(a)'),
('Islas Caimán', 'KY', 'Caimanés(a)'),
('Camboya', 'KH', 'Camboyano(a)'),
('Camerún', 'CM', 'Camerunés(a)'),
('Canadá', 'CA', 'Canadiense(a)'),
('República Centroafricana', 'CF', 'Centroafricano(a)'),
('Chad', 'TD', 'Chadiano(a)'),
('República Checa', 'CZ', 'Checo(a)'),
('Chile', 'CL', 'Chileno(a)'),
('China', 'CN', 'Chino(a)'),
('Chipre', 'CY', 'Chipriota(a)'),
('Isla de Navidad', 'CX', 'Navideño(a)'),
('Ciudad del Vaticano', 'VA', 'Vaticano(a)'),
('Islas Cocos', 'CC', 'Cocoense(a)'),
('Colombia', 'CO', 'Colombiano(a)'),
('Comoras', 'KM', 'Comorense(a)'),
('República Democrática del Congo', 'CD', 'Congoleño(a) (R.D.C.)'),
('Congo', 'CG', 'Congoleño(a)'),
('Islas Cook', 'CK', 'Cookiano(a)'),
('Corea del Norte', 'KP', 'Norcoreano(a)'),
('Corea del Sur', 'KR', 'Surcoreano(a)'),
('Costa de Marfil', 'CI', 'Marfileño(a)'),
('Costa Rica', 'CR', 'Costarricense(a)'),
('Croacia', 'HR', 'Croata(a)'),
('Cuba', 'CU', 'Cubano(a)'),
('Dinamarca', 'DK', 'Danés(a)'),
('Dominica', 'DM', 'Dominiqués(a)'),
('República Dominicana', 'DO', 'Dominicano(a)'),
('Ecuador', 'EC', 'Ecuatoriano(a)'),
('Egipto', 'EG', 'Egipcio(a)'),
('El Salvador', 'SV', 'Salvadoreño(a)'),
('Emiratos Árabes Unidos', 'AE', 'Emiratí(a)'),
('Eritrea', 'ER', 'Eritreo(a)'),
('Eslovaquia', 'SK', 'Eslovaco(a)'),
('Eslovenia', 'SI', 'Esloveno(a)'),
('España', 'ES', 'Español(a)'),
('Islas ultramarinas de Estados Unidos', 'UM', 'Estadounidense(a) (Territorio)'),
('Estados Unidos', 'US', 'Estadounidense(a)'),
('Estonia', 'EE', 'Estonio(a)'),
('Etiopía', 'ET', 'Etíope(a)'),
('Islas Feroe', 'FO', 'Feroés(a)'),
('Filipinas', 'PH', 'Filipino(a)'),
('Finlandia', 'FI', 'Finlandés(a)'),
('Fiyi', 'FJ', 'Fiyiano(a)'),
('Francia', 'FR', 'Francés(a)'),
('Gabón', 'GA', 'Gabonés(a)'),
('Gambia', 'GM', 'Gambiano(a)'),
('Georgia', 'GE', 'Georgiano(a)'),
('Islas Georgias del Sur y Sandwich del Sur', 'GS', 'Georgiano(a) del Sur'),
('Ghana', 'GH', 'Ghanés(a)'),
('Gibraltar', 'GI', 'Gibraltareño(a)'),
('Granada', 'GD', 'Granadino(a)'),
('Grecia', 'GR', 'Griego(a)'),
('Groenlandia', 'GL', 'Groenlandés(a)'),
('Guadalupe', 'GP', 'Guadalupense(a)'),
('Guam', 'GU', 'Guameño(a)'),
('Guatemala', 'GT', 'Guatemalteco(a)'),
('Guayana Francesa', 'GF', 'Franceso(a) de Guayana'),
('Guinea', 'GN', 'Guineano(a)'),
('Guinea Ecuatorial', 'GQ', 'Ecuatoguineano(a)'),
('Guinea-Bissau', 'GW', 'Bissauguineano(a)'),
('Guyana', 'GY', 'Guyanés(a)'),
('Haití', 'HT', 'Haitiano(a)'),
('Islas Heard y McDonald', 'HM', 'Heardiano(a) y McDonaldiano(a)'),
('Honduras', 'HN', 'Hondureño(a)'),
('Hong Kong', 'HK', 'Hongkonés(a)'),
('Hungría', 'HU', 'Húngaro(a)'),
('India', 'IN', 'Indio(a)'),
('Indonesia', 'ID', 'Indonesio(a)'),
('Irán', 'IR', 'Iraní(a)'),
('Iraq', 'IQ', 'Iraquí(a)'),
('Irlanda', 'IE', 'Irlandés(a)'),
('Islandia', 'IS', 'Islandés(a)'),
('Israel', 'IL', 'Israelí(a)'),
('Italia', 'IT', 'Italiano(a)'),
('Jamaica', 'JM', 'Jamaicano(a)'),
('Japón', 'JP', 'Japonés(a)'),
('Jordania', 'JO', 'Jordano(a)'),
('Kazajstán', 'KZ', 'Kazajo(a)'),
('Kenia', 'KE', 'Keniata(a)'),
('Kirguistán', 'KG', 'Kirguís(a)'),
('Kiribati', 'KI', 'Kiribatiano(a)'),
('Kuwait', 'KW', 'Kuwaití(a)'),
('Laos', 'LA', 'Laosiano(a)'),
('Lesotho', 'LS', 'Lesotense(a)'),
('Letonia', 'LV', 'Letón(a)'),
('Líbano', 'LB', 'Libanés(a)'),
('Liberia', 'LR', 'Liberiano(a)'),
('Libia', 'LY', 'Libio(a)'),
('Liechtenstein', 'LI', 'Liechtensteiniano(a)'),
('Lituania', 'LT', 'Lituano(a)'),
('Luxemburgo', 'LU', 'Luxemburgués(a)'),
('Macao', 'MO', 'Macaense(a)'),
('ARY Macedonia', 'MK', 'Macedonio(a)'),
('Madagascar', 'MG', 'Malgache(a)'),
('Malasia', 'MY', 'Malasio(a)'),
('Malawi', 'MW', 'Malawiano(a)'),
('Maldivas', 'MV', 'Maldivo(a)'),
('Malí', 'ML', 'Maliano(a)'),
('Malta', 'MT', 'Maltes(a)'),
('Islas Malvinas', 'FK', 'Falklandiano(a)'),
('Islas Marianas del Norte', 'MP', 'Marianense(a)'),
('Marruecos', 'MA', 'Marroquí(a)'),
('Islas Marshall', 'MH', 'Marshalliano(a)'),
('Martinica', 'MQ', 'Martiniqueño(a)'),
('Mauricio', 'MU', 'Mauriciano(a)'),
('Mauritania', 'MR', 'Mauritano(a)'),
('Mayotte', 'YT', 'Mayotense(a)'),
('México', 'MX', 'Mexicano(a)'),
('Micronesia', 'FM', 'Micronesio(a)'),
('Moldavia', 'MD', 'Moldavo(a)'),
('Mónaco', 'MC', 'Monegasco(a)'),
('Mongolia', 'MN', 'Mongol(a)'),
('Montserrat', 'MS', 'Montserratiano(a)'),
('Mozambique', 'MZ', 'Mozambiqueño(a)'),
('Myanmar', 'MM', 'Myanmarense(a)'),
('Namibia', 'NA', 'Namibio(a)'),
('Nauru', 'NR', 'Nauruano(a)'),
('Nepal', 'NP', 'Nepalí(a)'),
('Nicaragua', 'NI', 'Nicaragüense(a)'),
('Níger', 'NE', 'Nigeriano(a)'),
('Nigeria', 'NG', 'Nigeriano(a)'),
('Niue', 'NU', 'Niueano(a)'),
('Isla Norfolk', 'NF', 'Norfolkiano(a)'),
('Noruega', 'NO', 'Noruego(a)'),
('Nueva Caledonia', 'NC', 'Neocaledonio(a)'),
('Nueva Zelanda', 'NZ', 'Neozelandés(a)'),
('Omán', 'OM', 'Omaní(a)'),
('Países Bajos', 'NL', 'Neerlandés(a)'),
('Pakistán', 'PK', 'Pakistaní(a)'),
('Palau', 'PW', 'Palauniano(a)'),
('Palestina', 'PS', 'Palestino(a)'),
('Panamá', 'PA', 'Panameño(a)'),
('Papúa Nueva Guinea', 'PG', 'Papúas(o)a Nueva Guinea'),
('Paraguay', 'PY', 'Paraguayo(a)'),
('Perú', 'PE', 'Peruano(a)'),
('Islas Pitcairn', 'PN', 'Pitcairniano(a)'),
('Polinesia Francesa', 'PF', 'Polinesio(a)'),
('Polonia', 'PL', 'Polaco(a)'),
('Portugal', 'PT', 'Portugués(a)'),
('Puerto Rico', 'PR', 'Puertorriqueño(a)'),
('Qatar', 'QA', 'Qatarí(a)'),
('Reino Unido', 'GB', 'Británico(a)'),
('Reunión', 'RE', 'Reunionense(a)'),
('Ruanda', 'RW', 'Ruandés(a)'),
('Rumania', 'RO', 'Rumano(a)'),
('Rusia', 'RU', 'Ruso(a)'),
('Sahara Occidental', 'EH', 'Saharaui(a)'),
('Islas Salomón', 'SB', 'Salomonense(a)'),
('Samoa', 'WS', 'Samoano(a)'),
('Samoa Americana', 'AS', 'Samoano(a)americano(a)'),
('San Cristóbal y Nevis', 'KN', 'Sancristobalense(a)'),
('San Marino', 'SM', 'Sammarino(a)'),
('San Pedro y Miquelón', 'PM', 'Sanpedrense(a)'),
('San Vicente y las Granadinas', 'VC', 'Sanvicentino(a)'),
('Santa Helena', 'SH', 'Sanhelense(a)'),
('Santa Lucía', 'LC', 'Luciano(a)'),
('Santo Tomé y Príncipe', 'ST', 'Santomense(a)'),
('Senegal', 'SN', 'Senegalés(a)'),
('Serbia y Montenegro', 'CS', 'Serbio(a)'),
('Seychelles', 'SC', 'Seychellense(a)'),
('Sierra Leona', 'SL', 'Sierra Leonesa(a)'),
('Singapur', 'SG', 'Singapurense(a)'),
('Siria', 'SY', 'Sirio(a)'),
('Somalia', 'SO', 'Somalí(a)'),
('Sri Lanka', 'LK', 'Cingalés(a)'),
('Suazilandia', 'SZ', 'Suazi(a)'),
('Sudáfrica', 'ZA', 'Sudafricano(a)'),
('Sudán', 'SD', 'Sudanés(a)'),
('Suecia', 'SE', 'Sueco(a)'),
('Suiza', 'CH', 'Suizo(a)'),
('Surinam', 'SR', 'Surinamés(a)'),
('Svalbard y Jan Mayen', 'SJ', 'Svalbardense(a)'),
('Tailandia', 'TH', 'Tailandés(a)'),
('Taiwán', 'TW', 'Taiwanés(a)'),
('Tanzania', 'TZ', 'Tanzano(a)'),
('Tayikistán', 'TJ', 'Tayiko(a)'),
('Territorio Británico del Océano Índico', 'IO', 'Británico(a)delOcéanoÍndico'),
('Territorios Australes Franceses', 'TF', 'Francés(a)Austral'),
('Timor Oriental', 'TL', 'Timorense(a)'),
('Togo', 'TG', 'Togolés(a)'),
('Tokelau', 'TK', 'Tokelauano(a)'),
('Tonga', 'TO', 'Tongano(a)'),
('Trinidad y Tobago', 'TT', 'Trinitense(a)'),
('Túnez', 'TN', 'Tunisiano(a)'),
('Islas Turcas y Caicos', 'TC', 'Turco(a)deTurcasyCaicos'),
('Turkmenistán', 'TM', 'Turkmeno(a)'),
('Turquía', 'TR', 'Turco(a)'),
('Tuvalu', 'TV', 'Tuvaluano(a)'),
('Ucrania', 'UA', 'Ucraniano(a)'),
('Uganda', 'UG', 'Ugandés(a)'),
('Uruguay', 'UY', 'Uruguayo(a)'),
('Uzbekistán', 'UZ', 'Uzbeco(a)'),
('Vanuatu', 'VU', 'Vanuatuano(a)'),
('Venezuela', 'VE', 'Venezolano(a)'),
('Vietnam', 'VN', 'Vietnamita'),
('Islas Vírgenes Británicas', 'VG', 'Británico(a)Vírgen'),
('Islas Vírgenes de los Estados Unidos', 'VI', 'Estadounidense(a)Vírgen'),
('Wallis y Futuna', 'WF', 'Wallisense(a)'),
('Yemen', 'YE', 'Yemení(a)'),
('Yibuti', 'DJ', 'Yibutiano(a)'),
('Zambia', 'ZM', 'Zambiano(a)'),
('Zimbabue', 'ZW', 'Zimbabuense(a)');
GO

-- Insertar datos en events.tblEventTypes
INSERT INTO events.tblEventTypes(eventTypeName)
VALUES ('Deportivo'), ('Artistico'), ('Voluntariado'),('Otro ');
GO

INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES
('Consejo Superior Universitario Centroamericano','CSUCA',
    (SELECT idCountry FROM events.tblCountries WHERE countryName = 'Honduras')),
('Universidad Nacional Autónoma de Honduras', 'UNAH', 
    (SELECT idCountry FROM events.tblCountries WHERE countryName = 'Honduras'));

-- Belice
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES ('Universidad de Belice', 'UB',
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Belice'));

-- Guatemala
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES ('Universidad de San Carlos', 'USAC', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Guatemala'));

-- El Salvador
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES ('Universidad de El Salvador', 'UES', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'El Salvador'));

-- Nicaragua
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES 
('Universidad Nacional Autónoma de Nicaragua – Managua', 'UNAN – Managua', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua')),
('Universidad Nacional Autónoma de Nicaragua – León', 'UNAN - León', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua')),
('Universidad Nacional de Ingeniería', 'UNI', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua')),
('Universidad Nacional Agraria', 'UNA-NI', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua')),
('Bluefields Indian & Caribbean University', 'BICU', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua')),
('Universidad de las Regiones Autónomas de la Costa Caribe Nicaragüense', 'URACCAN', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Nicaragua'));

-- Costa Rica
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES 
('Universidad de Costa Rica', 'UCR', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Costa Rica')),
('Universidad Nacional de Costa Rica', 'UNA-CR', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Costa Rica')),
('Instituto Tecnológico de Costa Rica', 'TEC', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Costa Rica')),
('Universidad Técnica Nacional', 'UTN', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Costa Rica')),
('Universidad Estatal a Distancia', 'UNED', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Costa Rica'));

-- Panamá
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES 
('Universida de Panamá', 'UP', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Panamá')),
('Universidad Autónoma de Chiriquí', 'UNACHI', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Panamá')),
('Universidad Marítima Internacional de Panamá', 'UMIP', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Panamá')),
('Universidad Especializada de las Américas', 'UDELAS', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Panamá')),
('Universidad Tecnológica de Panamá', 'UTP', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Panamá'));

-- República Dominicana
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES ('Universidad Autónoma de Santo Domingo', 'UASD', 
    (SELECT idCountry FROM events.tblCountries WHERE countryName = 'República Dominicana'));

-- Cuba
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES 
('Universidad de la Habana', 'UH', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Cuba')),
('Universidad de Ciego de Ávila Maximo Gómez Baez', 'UNICA', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Cuba')),
('Universidad de Ciencias de la Cultura Física y el Deporte Manuel Fajardo', 'UCCFD', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Cuba'));

-- Honduras
INSERT INTO events.tblUniversities (universityName, acronym, idCountry)
VALUES 
('Universidad Pedagógica Nacional Francisco Morazán', 'UPNFM', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Honduras')),
('Universidad Nacional de Agricultura', 'UNAG', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Honduras')),
('Universidad Nacional de Ciencias Forestales', 'UNACIFOR', 
(SELECT idCountry FROM events.tblCountries WHERE countryName = 'Honduras'));
GO

-- Insertar datos en events.tblEvents
INSERT INTO events.tblEvents (eventName, startDate, endDate, idEventType) VALUES
('Juegos Universitarios 2024',  '20250728 00:01:00.000', '20250801 23:59:00.000', 1),
('Congreso Científico Internacional',  '20250728 00:01:00.000', '20260601 23:59:00.000', 3),
('Festival Interuniversitario Centroamericano de la Cultura y Arte (FICCUA),', '20250728 00:01:00.000', '20260801 23:59:00.000', 2);

-- Insertar datos en events.tblRoles
INSERT INTO events.tblRoles (roleName, idEventType) VALUES
('Deportista', 1),
('Artista', 2);
GO

-- Insertar datos en events.tblDelegationType
INSERT INTO events.tblDelegationType (delegationName, idEvent, hasModalities, hasCategories, hasTests) VALUES
('Fútbol',1,0, 1, 1),
('Atletismo',1, 0, 0, 1), 
('Artes Visuales',2, 1, 1, 0),
('Cine',2, 1, 1, 0),
('Artes Escénicas',2, 1, 1, 0 ),
('Literatura',2, 1, 0, 0),
('Música',2, 1, 1, 0),
('Floreo',2, 0, 0, 0);
GO

-- Insertar datos en events.tblConfigurationValueTypes
INSERT INTO events.tblConfigurationValueTypes (configValueTypeName) VALUES
('Booleano'),
('Entero'),
('Texto');

-- Insertar datos en events.tblConfigurationParameters
INSERT INTO events.tblConfigurationParameters (description) VALUES
('Tiempo máximo de inscripción'),
('Permitir modificaciones'),
('Idioma predeterminado');

INSERT INTO users.tblGenders (genderName)
VALUES ('Femenino'), ('Masculino');
GO

INSERT INTO users.tblPersons (identificationDocument, universityCardNumber, firstName, secondName, lastName, secondLastName, birthDate, idUniversity, idGender, idCountry) VALUES
('MX123456', 'UNAM2024001', 'Juan', 'Carlos', 'Gómez', 'Pérez', '1998-05-15T00:00:00', 1, 2, 1),
('US789012', 'UC2024001', 'Emily', 'Anne', 'Johnson', 'Smith', '1999-08-20T00:00:00', 2, 1, 1),
('ES345678', 'UCM2024001', 'Carlos', 'Jose', 'Rodríguez', 'García', '1997-12-10T00:00:00', 3, 2, 1);
GO

INSERT INTO events.tblUniversityStaffTypes(universityStaffTypeName)
VALUES ('Autoridad'),
('Medico'),
('Conferencista'),
('Periodista');
GO

INSERT INTO events.tblCommissions(commissionName) 
VALUES ('Técnica Deportiva'),('Arte'),('Instalaciones'),('Alimentación'),
('Logística'),('Voluntariado'),('Protocolo'),('Tecnológica /Acreditación'),
('Hospedaje'),('Seguridad'),('Transporte'),('Salud'),
('Administrativa'),('Comunicación y Prensa'),('Mercadeo'),('Académica'),
('Comité Coordinador');

GO
-- Insertar datos en events.tblUniversityStaffs
INSERT INTO events.tblUniversityStaffs (idUniversity, idUniversityStaffType, idPerson, idEvent, idCommission) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 1, 2), 
(3, 2, 1, 3, 3);
 
-- Insertar datos en sports.tblSportTypes
INSERT INTO sports.tblSportTypes (sportTypeName) VALUES
('Deporte de Equipo'),
('Deporte Individual');

-- Insertar datos en sports.tblSports
INSERT INTO sports.tblSports (idSport ,minAthletesCapacity, maxAthletesCapacity, minModalitiesCapacity, idSportType) VALUES
(1, 11, 18, 1, 2),
(2, 1, 3, 0, 1);
 
-- Insertar datos en sports.tblSportModalities
INSERT INTO sports.tblSportModalities (idSport, modalityName, hasCategories, maxCategoryCapacityPerAthlete, maxCapacity) VALUES
(1, 'Fútbol 11', 0, 0, 18),
(2, 'Jabalina', 1, 2, 4);

-- Insertar datos en sports.tblSportDelegations
--INSERT INTO sports.tblSportDelegations (idSportDelegation, idGender) VALUES
--(1, 1),
--(2, 2); 

-- Insertar datos en sports.tblSportCategories
INSERT INTO sports.tblSportCategories (idSportModality, categoryName, idGender, isForBothGenders, maxCapacity) VALUES
(2, '100m Libre', 1, 0, 8),
(2, '100m Libre', 2, 0, 8),
(2, '200m Combinado', NULL, 1, 6);

-- Insertar datos en sports.tblTestTypes
INSERT INTO sports.tblTestTypes (idTestName, maxCategoryCapacityPerAthlete) VALUES
('Velocidad', 2),
('Resistencia', 1),
('Técnica', 3);

-- Insertar datos en sports.tblSportTests
INSERT INTO sports.tblSportTests (idSport, maxCapacity, testName, idTestType, idGender, isForBothGenders) VALUES
(2, 10, '100m Planos', 1, 1, 0),
(2, 10, '100m Planos', 1, 2, 0),
(2, 8, 'Maratón', 2, NULL, 1);

-- Insertar datos en sports.tblAthleteSportModalities
--INSERT INTO sports.tblAthleteSportModalities (idSportDelegation, idSportModality) VALUES
--(1, 1),
--(2, 2);

-- Insertar datos en sports.tblAthleteSportCategories
--INSERT INTO sports.tblAthleteSportCategories (idSportDelegation, idSportCategory) VALUES
--(2, 1),
--(2, 3);

-- Insertar datos en sports.tblAthleteSportTests
--INSERT INTO sports.tblAthleteSportTests (idSportDelegation, idSportTest) VALUES
--(2, 1),
--(2, 3);

-- Insertar datos en arts.tblArtTypes
INSERT INTO arts.tblArtTypes (artTypeName) VALUES
('Artes Escénicas'),
('Artes Visuales'),
('Artes Literarias');

-- Insertar datos en arts.tblArts
INSERT INTO arts.tblArts (idArt,idArtType) VALUES
(3,2),
(4,2),
(5,1),
(6,3),
(7,2),
(8,3); 
 
-- Insertar datos en arts.tblArtModalities
INSERT INTO arts.tblArtModalities (idArt, modalityName, hasCategories) VALUES
(3, 'Fotografía', 1),
(3, 'Dibujo', 1),
(3, 'Pintura', 1),
(4, 'Cortometraje', 1),
(4, 'Largometraje', 1),
(5, 'Teatro', 1),
(5, 'Danza', 1),
(6, 'Poesía Inédita', 0) ,
(6, 'Poesía Escénica', 0),
(7, 'Solista', 1),
(7, 'Coros', 1),
(7, 'Grupo de Cámara', 1),
(7, 'Orquesta', 1) ,
(7, 'Ensambles Musicales', 1);

-- Insertar datos en arts.tblArtCategories
INSERT INTO arts.tblArtCategories (idArt, categoryName) VALUES
(3, 'Piezas Bidimensionales'), 
(3, 'Piezas Tridimensionales'),
(3, 'Instalación Artística'),
(4, 'Drama'), 
(4, 'Ficción'),
(4, 'Comedia'),
(4, 'Animación'),
(5, 'Teatro de Calle'),
(5, 'Teatro de Sala'),
(5, 'Cuenta Cuento'), 
(5, 'Académica'),
(5, 'Arreglo Musical'),
(5, 'Folclórica'),
(5, 'Étnica'), 
(5, 'Contemporánea'),
(5, 'Ballet'),
(5, 'Urbano'),
(5, 'Latino'),
(7, 'Autoría Propia'),
(7, 'Música Tradicional'), 
(7, 'Música Popular'),
(7, 'Académica'),
(7, 'Arreglo Musical');

INSERT INTO arts.tblArtCategoriesModalities(idArtModality,idArtCategory) VALUES
(1,1), 
(1,2),
(1,3),
(2,1), 
(2,2),
(2,3),
(3,1), 
(3,2),
(3,3),
(4,4), 
(4,5),
(4,6),
(4,7),
(5,4), 
(5,5),
(5,6),
(5,7),
(6,8), 
(6,9),
(6,10),
(6,11),
(6,12),
(7,13),
(7,14),
(7,15),
(7,16),
(7,17),
(7,18),
(10,19),
(10,20),
(10,21),
(10,22),
(10,23),
(11,19),
(11,20),
(11,21),
(11,22),
(11,23),
(12,19),
(12,20),
(12,21),
(12,22),
(12,23),
(13,19),
(13,20),
(13,21),
(13,22),
(13,23),
(14,19),
(14,20),
(14,21),
(14,22),
(14,23); 

-- Insertar datos en arts.tblArtDelegations
--INSERT INTO arts.tblArtDelegations (idProposal) VALUES
--(1),
--(2);

-- Insertar datos en users.tblDelegationPersons
--INSERT INTO users.tblDelegationPersons (idDelegation, idPerson, idRole) VALUES
--(1, 1, 1),
--(2, 2, 2);

-- Insertar datos en users.tblUsers
INSERT INTO users.tblUsers (idUser, username, email, password, isEnabled) VALUES
(1,'juan.gomez', 'prueba1@prueba.com', '1234', 1),
(2,'emily.johnson', 'prueba2@prueba.com', '1234', 1),
(3,'carlos.rodriguez', 'prueba3@prueba.com', '1234', 1);

-- Insertar datos en users.tblUserEvents
/*
INSERT INTO users.tblUserEvents (idUser, idEvent, isEnbled) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1);
*/

-- Insertar datos en users.tblUserRoles
INSERT INTO users.tblUserRoles (roleName, description, show) VALUES
('Administrador', 'Acceso completo al sistema', 1),
('Coordinador', 'Gestiona delegaciones y participantes', 1),
('Participante', 'Acceso limitado a funcionalidades', 1);

-- Insertar datos en users.tblUserRoleRelations
INSERT INTO users.tblUserRoleRelations (idUser, idUserRole, isActive) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);