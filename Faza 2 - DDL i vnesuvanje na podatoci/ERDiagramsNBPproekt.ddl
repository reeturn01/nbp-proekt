ALTER TABLE VehicleModel DROP CONSTRAINT "Is Produced By";
ALTER TABLE Company DROP CONSTRAINT Represents;
ALTER TABLE Ownership DROP CONSTRAINT "Is Included In";
ALTER TABLE Vehicle DROP CONSTRAINT "Is Manufactured In";
ALTER TABLE VehicleModelWithFuelType DROP CONSTRAINT FKVehicleMod338638;
ALTER TABLE VehicleModelWithFuelType DROP CONSTRAINT FKVehicleMod782522;
ALTER TABLE Vehicle DROP CONSTRAINT FKVehicle352178;
ALTER TABLE Ownership DROP CONSTRAINT "Is Owner In";
ALTER TABLE Device DROP CONSTRAINT "Belongs To";
ALTER TABLE VehicleSubcategory DROP CONSTRAINT "Is Part Of";
ALTER TABLE Vehicle DROP CONSTRAINT Classifies;
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati528270;
ALTER TABLE Person DROP CONSTRAINT FKPerson637911;
ALTER TABLE Company DROP CONSTRAINT FKCompany618251;
ALTER TABLE Employee DROP CONSTRAINT "is a";
ALTER TABLE Vehicle DROP CONSTRAINT "Has Primary";
ALTER TABLE Person DROP CONSTRAINT Owns;
ALTER TABLE PopulatedArea DROP CONSTRAINT FKPopulatedA599940;
ALTER TABLE Address DROP CONSTRAINT FKAddress786571;
ALTER TABLE Address DROP CONSTRAINT FKAddress882137;
ALTER TABLE Party DROP CONSTRAINT "Lives/Is Registered At";
ALTER TABLE Person DROP CONSTRAINT FKPerson852544;
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati911583;
ALTER TABLE Request DROP CONSTRAINT FKRequest788237;
ALTER TABLE EmployeeRoleBranch DROP CONSTRAINT FKEmployeeRo11412;
ALTER TABLE EmployeeRoleBranch DROP CONSTRAINT Has;
ALTER TABLE Municipality DROP CONSTRAINT "Is Made Up Of";
ALTER TABLE EmployeeRoleBranch DROP CONSTRAINT FKEmployeeRo754410;
ALTER TABLE Vehicle DROP CONSTRAINT "Has Secondary";
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati854162;
ALTER TABLE TechnicalCheck DROP CONSTRAINT FKTechnicalC447546;
ALTER TABLE TechnicalCheck DROP CONSTRAINT "Is For";
ALTER TABLE TechnicalCheck_Device DROP CONSTRAINT FKTechnicalC517453;
ALTER TABLE TechnicalCheck_Device DROP CONSTRAINT FKTechnicalC610591;
ALTER TABLE ControlOfficer DROP CONSTRAINT FKControlOff993836;
ALTER TABLE ControlOfficer DROP CONSTRAINT FKControlOff565604;
ALTER TABLE Branch DROP CONSTRAINT FKBranch908924;
ALTER TABLE Registration DROP CONSTRAINT "Is Made For";
DROP VIEW IF EXISTS AnnualNumberOfRegistrationsPerType;
DROP VIEW IF EXISTS NumberOfActiveVehiclesPerBrand;
DROP VIEW IF EXISTS Employees_V;
DROP VIEW IF EXISTS NumberOfActiveVehicles;
DROP VIEW IF EXISTS NumberOfCarsOwnedByEachParty;
DROP VIEW IF EXISTS NumberOfEmployeesOfRoleTypeInEveryBranch_V;
DROP VIEW IF EXISTS NumberOfEmployeesWorkingInEveryBranch_V;
DROP VIEW IF EXISTS Companies_V;
DROP VIEW IF EXISTS People_V;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Employee CASCADE;
DROP TABLE IF EXISTS Company CASCADE;
DROP TABLE IF EXISTS Vehicle CASCADE;
DROP TABLE IF EXISTS VehicleBrand CASCADE;
DROP TABLE IF EXISTS VehicleModel CASCADE;
DROP TABLE IF EXISTS FuelType CASCADE;
DROP TABLE IF EXISTS Role CASCADE;
DROP TABLE IF EXISTS Branch CASCADE;
DROP TABLE IF EXISTS State CASCADE;
DROP TABLE IF EXISTS Ownership CASCADE;
DROP TABLE IF EXISTS VehicleModelWithFuelType CASCADE;
DROP TABLE IF EXISTS Party CASCADE;
DROP TABLE IF EXISTS VehicleCategory CASCADE;
DROP TABLE IF EXISTS TechnicalCheck CASCADE;
DROP TABLE IF EXISTS Color CASCADE;
DROP TABLE IF EXISTS Device CASCADE;
DROP TABLE IF EXISTS DeviceCategory CASCADE;
DROP TABLE IF EXISTS VehicleSubcategory CASCADE;
DROP TABLE IF EXISTS Registration CASCADE;
DROP TABLE IF EXISTS RegistrationType CASCADE;
DROP TABLE IF EXISTS Citizenship CASCADE;
DROP TABLE IF EXISTS Municipality CASCADE;
DROP TABLE IF EXISTS PopulatedArea CASCADE;
DROP TABLE IF EXISTS Address CASCADE;
DROP TABLE IF EXISTS Street CASCADE;
DROP TABLE IF EXISTS Request CASCADE;
DROP TABLE IF EXISTS EmployeeRoleBranch CASCADE;
DROP TABLE IF EXISTS TechnicalCheckType CASCADE;
DROP TABLE IF EXISTS TechnicalCheck_Device CASCADE;
DROP TABLE IF EXISTS ControlOfficer CASCADE;
CREATE TABLE Person (
  party_id       int4 NOT NULL, 
  lastName       varchar(50) NOT NULL, 
  birthDate      date NOT NULL, 
  bornIn         int4 NOT NULL, 
  citizenship_id int4 NOT NULL, 
  PRIMARY KEY (party_id));
CREATE TABLE Employee (
  person_id int4 NOT NULL, 
  username  varchar(20) NOT NULL UNIQUE, 
  password  varchar(20) NOT NULL, 
  PRIMARY KEY (person_id));
CREATE TABLE Company (
  party_id    int4 NOT NULL, 
  representor int4 NOT NULL, 
  PRIMARY KEY (party_id));
CREATE TABLE Vehicle (
  id                 SERIAL NOT NULL, 
  model_id           int4 NOT NULL, 
  stateManufactured  int4 NOT NULL, 
  primaryColor       int4 NOT NULL, 
  secondaryColor     int4, 
  vehicleSubcategory int4 NOT NULL, 
  manufactureDate    date NOT NULL, 
  chassisNumber      varchar(20) NOT NULL, 
  engineNumber       varchar(50) NOT NULL, 
  enginePower        int4 NOT NULL, 
  engineSize         int4 NOT NULL, 
  mass               int4 NOT NULL, 
  hasHook            bool NOT NULL, 
  frontTyreDimension varchar(15) NOT NULL, 
  rearTyreDimension  varchar(15) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT Vehicle_UNQ 
    UNIQUE (model_id, chassisNumber, engineNumber));
CREATE TABLE VehicleBrand (
  id   SERIAL NOT NULL, 
  name varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE VehicleModel (
  id              SERIAL NOT NULL, 
  vehicleBrand_id int4 NOT NULL, 
  name            varchar(50) NOT NULL, 
  wheelsNumber    int4 NOT NULL, 
  axelNumber      int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT VehicleModel_UNQ 
    UNIQUE (vehicleBrand_id, name));
CREATE TABLE FuelType (
  id   SERIAL NOT NULL, 
  code varchar(4) NOT NULL UNIQUE, 
  name varchar(20) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Role (
  id          SERIAL NOT NULL, 
  name        varchar(50) NOT NULL UNIQUE, 
  description varchar(100) DEFAULT '' NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Branch (
  id       SERIAL NOT NULL, 
  name     varchar(50) NOT NULL UNIQUE, 
  location int4 NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE State (
  id   SERIAL NOT NULL, 
  code int4 NOT NULL UNIQUE, 
  name int4 NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Ownership (
  id         SERIAL NOT NULL, 
  vehicle_id int4 NOT NULL, 
  owner      int4 NOT NULL, 
  dateFrom   date NOT NULL, 
  dateTo     date, 
  PRIMARY KEY (id), 
  CONSTRAINT Ownership_UNQ 
    UNIQUE (vehicle_id, owner, dateFrom));
CREATE TABLE VehicleModelWithFuelType (
  id          SERIAL NOT NULL, 
  model_ld    int4 NOT NULL, 
  fuelType_id int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT VehicleModelWithFuelType_UNQ 
    UNIQUE (model_ld, fuelType_id));
CREATE TABLE Party (
  id          SERIAL NOT NULL, 
  ssnOrTin    varchar(30) NOT NULL UNIQUE, 
  name        varchar(50) NOT NULL, 
  currAddress int4 NOT NULL, 
  isPerson    bool NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE VehicleCategory (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE TechnicalCheck (
  id                    SERIAL NOT NULL, 
  vehicle_id            int4 NOT NULL, 
  technicalCheckType_id int4 NOT NULL, 
  description           varchar(255) DEFAULT '' NOT NULL, 
  timestamp             timestamp NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT TechnicalCheck_UNQ 
    UNIQUE (vehicle_id, technicalCheckType_id, timestamp));
CREATE TABLE Color (
  id   SERIAL NOT NULL, 
  code varchar(4) NOT NULL UNIQUE, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE Device (
  id                SERIAL NOT NULL, 
  deviceCategory_id int4 NOT NULL, 
  name              varchar(100) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE DeviceCategory (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE VehicleSubcategory (
  id              SERIAL NOT NULL, 
  vehicleCategory int4 NOT NULL, 
  name            varchar(50) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT VehicelSubcategory_UNQ 
    UNIQUE (vehicleCategory, name));
CREATE TABLE Registration (
  id                  SERIAL NOT NULL, 
  timestamp           timestamp NOT NULL, 
  vehicle_id          int4 NOT NULL, 
  employeeWithRole_id int4 NOT NULL, 
  registrationType_id int4 NOT NULL, 
  technicalCheck_id   int4, 
  PRIMARY KEY (id), 
  CONSTRAINT Registration_UNQ 
    UNIQUE (timestamp, vehicle_id, employeeWithRole_id, registrationType_id));
CREATE TABLE RegistrationType (
  id   SERIAL NOT NULL, 
  name varchar(20) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE Citizenship (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE Municipality (
  id       SERIAL NOT NULL, 
  state_id int4 NOT NULL, 
  code     varchar(10) NOT NULL UNIQUE, 
  name     varchar(50) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE PopulatedArea (
  id              SERIAL NOT NULL, 
  id_municipality int4 NOT NULL, 
  name            varchar(50) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT PopulatedArea_UNQ 
    UNIQUE (id_municipality, name));
CREATE TABLE Address (
  id               SERIAL NOT NULL, 
  populatedArea_id int4 NOT NULL, 
  street_id        int4 NOT NULL, 
  number           varchar(50) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT Address_UNQ 
    UNIQUE (populatedArea_id, street_id, number));
CREATE TABLE Street (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE Request (
  id              SERIAL NOT NULL, 
  serialNum       int4 NOT NULL UNIQUE, 
  timestamp       timestamp NOT NULL, 
  registration_id int4 NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE EmployeeRoleBranch (
  id          SERIAL NOT NULL, 
  branch_id   int4 NOT NULL, 
  employee_id int4 NOT NULL, 
  role_id     int4 NOT NULL, 
  fromDate    date NOT NULL, 
  toDate      date, 
  PRIMARY KEY (id), 
  CONSTRAINT EmployeeRoleBranch_UNQ 
    UNIQUE (branch_id, employee_id, role_id, fromDate));
CREATE TABLE TechnicalCheckType (
  id   SERIAL NOT NULL, 
  name varchar(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE TechnicalCheck_Device (
  id                SERIAL NOT NULL, 
  device_id         int4 NOT NULL, 
  technicalCheck_id int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT TechnicalCheck_Device_UNQ 
    UNIQUE (device_id, technicalCheck_id));
CREATE TABLE ControlOfficer (
  id                    SERIAL NOT NULL, 
  EmployeeRoleBranch_id int4 NOT NULL, 
  technicalCheck_id     int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT ContolOffice_UNQ 
    UNIQUE (EmployeeRoleBranch_id, technicalCheck_id));
CREATE VIEW People_V AS
SELECT
	Party.ssnOrTin AS ssn,
	Party.name AS firstName,
	Person.lastName,
	Person.birthDate,
	Citizenship.name AS citizenship,
	Street.name AS livesInStreetName,
	Address.number AS livesInStreetNumber,
	PopulatedArea.name AS livesInPopulatedArea,
	Municipality.name AS livesInMunicipality,
	State.name AS livesInState,
	PopulatedArea2.name AS bornInPopulatedArea,
	Municipality2.name AS bornInMunicipality,
	State2.name AS bornInState
FROM
	Party INNER JOIN
	Person ON Party.id = Person.party_id INNER JOIN
	Address ON Party.currAddress = Address.id INNER JOIN
	Citizenship ON Person.citizenship_id = Citizenship.id INNER JOIN
	PopulatedArea AS PopulatedArea2 ON Person.bornIn = PopulatedArea2.id INNER JOIN
	Street ON Address.street_id = Street.id INNER JOIN
	PopulatedArea ON Address.populatedArea_id = PopulatedArea.id INNER JOIN
	Municipality AS Municipality2 ON PopulatedArea2.id_municipality = Municipality2.id INNER JOIN
	Municipality ON PopulatedArea.id_municipality = Municipality.id INNER JOIN
	State AS State2 ON Municipality2.state_id = State2.id INNER JOIN
	State ON Municipality.state_id = State.id;
CREATE VIEW Companies_V AS
SELECT
	Party.ssnOrTin AS tin,
	Party.name AS companyName,
	Party2.ssnOrTin AS representerSsn,
	Party2.name AS representerName,
	Person.lastName AS representerLastName,
	Street.name AS headquarterStreetName,
	Address.number AS headquarterStreetNumber,
	PopulatedArea.name AS headquarterPopulatedArea,
	Municipality.name AS headquarterMunicipality,
	State.name AS headquarterState
FROM
	Party INNER JOIN
	Company ON Party.id = Company.party_id INNER JOIN
	Address ON Party.currAddress = Address.id INNER JOIN
	Person ON Company.representor = Person.party_id INNER JOIN
	Street ON Address.street_id = Street.id INNER JOIN
	PopulatedArea ON Address.populatedArea_id = PopulatedArea.id INNER JOIN
	Party AS Party2 ON Person.party_id = Party2.id INNER JOIN
	Municipality ON PopulatedArea.id_municipality = Municipality.id INNER JOIN
	State ON Municipality.state_id = State.id;
CREATE VIEW NumberOfEmployeesWorkingInEveryBranch_V AS
SELECT
	Branch.name AS branchName,
	PopulatedArea.name AS populatedAreaName,
	Municipality.name AS municipalityName,
	State.name AS stateName,
	COUNT(EmployeeRoleBranch.id) AS numberOfEmployees
FROM
	EmployeeRoleBranch INNER JOIN
	Branch ON EmployeeRoleBranch.branch_id = Branch.id INNER JOIN
	PopulatedArea ON Branch.location = PopulatedArea.id INNER JOIN
	Municipality ON PopulatedArea.id_municipality = Municipality.id INNER JOIN
	State ON Municipality.state_id = State.id
WHERE
	(EmployeeRoleBranch.toDate is null)
GROUP BY
	Branch.name,
	PopulatedArea.name,
	Municipality.name,
	State.name;
CREATE VIEW NumberOfEmployeesOfRoleTypeInEveryBranch_V AS
SELECT
	Branch.name AS branchName,
	PopulatedArea.name AS branchPopulatedArea,
	Municipality.name AS branchMunicipality,
	State.name AS branchState,
	Role.name AS roleType,
	COUNT(EmployeeRoleBranch.id) AS numberOfEmployees
FROM
	Branch INNER JOIN
	EmployeeRoleBranch ON Branch.id = EmployeeRoleBranch.branch_id INNER JOIN
	PopulatedArea ON Branch.location = PopulatedArea.id INNER JOIN
	Role ON EmployeeRoleBranch.role_id = Role.id INNER JOIN
	Municipality ON PopulatedArea.id_municipality = Municipality.id INNER JOIN
	State ON Municipality.state_id = State.id
WHERE
	(EmployeeRoleBranch.toDate is null)
GROUP BY
	Branch.name,
	PopulatedArea.name,
	Municipality.name,
	State.name,
	Role.name;
CREATE VIEW NumberOfCarsOwnedByEachParty AS
SELECT
	Party.isPerson,
	Party.ssnOrTin,
	Party.name,
	COUNT(Ownership.vehicle_id) AS vehicle_id
FROM
	Party INNER JOIN
	Ownership ON Party.id = Ownership.owner
WHERE
	(Ownership.dateTo is null)
GROUP BY
	Party.isPerson,
	Party.ssnOrTin,
	Party.name;
CREATE VIEW NumberOfActiveVehicles AS
SELECT
	Registration.id,
	Registration.timestamp
FROM
	Registration
ORDER BY
	Registration.id DESC,
	Registration.timestamp ASC;
CREATE VIEW Employees_V AS
SELECT
	EmployeeRoleBranch.branch_id AS branchName,
	Role.name AS roleName,
	Party.ssnOrTin AS ssn,
	Party.name AS employeeName,
	Person.lastName AS employeeLastName
FROM
	Party INNER JOIN
	Person ON Party.id = Person.party_id INNER JOIN
	Employee ON Person.party_id = Employee.person_id INNER JOIN
	EmployeeRoleBranch ON Employee.person_id = EmployeeRoleBranch.employee_id INNER JOIN
	Role ON EmployeeRoleBranch.role_id = Role.id
WHERE
	(Party.isPerson is true)
ORDER BY
	EmployeeRoleBranch.branch_id ASC,
	Role.name ASC;
CREATE VIEW NumberOfActiveVehiclesPerBrand AS
SELECT
	VehicleBrand.name,
	COUNT(Vehicle.id) AS numberOfVehicles
FROM
	VehicleBrand INNER JOIN
	VehicleModel ON VehicleBrand.id = VehicleModel.vehicleBrand_id INNER JOIN
	VehicleModelWithFuelType ON VehicleModel.id = VehicleModelWithFuelType.model_ld INNER JOIN
	Vehicle ON VehicleModelWithFuelType.id = Vehicle.model_id INNER JOIN
	Ownership ON Vehicle.id = Ownership.vehicle_id
WHERE
	(Ownership.dateTo is null)
GROUP BY
	VehicleBrand.name;
CREATE VIEW AnnualNumberOfRegistrationsPerType AS
SELECT
	1 AS year,
	RegistrationType.name AS registrationType,
	COUNT(Registration.id) AS numberOfVehicles
FROM
	RegistrationType INNER JOIN
	Registration ON RegistrationType.id = Registration.registrationType_id
GROUP BY
	extract(year from Registration.timestamp),
	RegistrationType.name;
ALTER TABLE VehicleModel ADD CONSTRAINT "Is Produced By" FOREIGN KEY (vehicleBrand_id) REFERENCES VehicleBrand (id);
ALTER TABLE Company ADD CONSTRAINT Represents FOREIGN KEY (representor) REFERENCES Person (party_id);
ALTER TABLE Ownership ADD CONSTRAINT "Is Included In" FOREIGN KEY (vehicle_id) REFERENCES Vehicle (id);
ALTER TABLE Vehicle ADD CONSTRAINT "Is Manufactured In" FOREIGN KEY (stateManufactured) REFERENCES State (id);
ALTER TABLE VehicleModelWithFuelType ADD CONSTRAINT FKVehicleMod338638 FOREIGN KEY (model_ld) REFERENCES VehicleModel (id);
ALTER TABLE VehicleModelWithFuelType ADD CONSTRAINT FKVehicleMod782522 FOREIGN KEY (fuelType_id) REFERENCES FuelType (id);
ALTER TABLE Vehicle ADD CONSTRAINT FKVehicle352178 FOREIGN KEY (model_id) REFERENCES VehicleModelWithFuelType (id);
ALTER TABLE Ownership ADD CONSTRAINT "Is Owner In" FOREIGN KEY (owner) REFERENCES Party (id);
ALTER TABLE Device ADD CONSTRAINT "Belongs To" FOREIGN KEY (deviceCategory_id) REFERENCES DeviceCategory (id);
ALTER TABLE VehicleSubcategory ADD CONSTRAINT "Is Part Of" FOREIGN KEY (vehicleCategory) REFERENCES VehicleCategory (id);
ALTER TABLE Vehicle ADD CONSTRAINT Classifies FOREIGN KEY (vehicleSubcategory) REFERENCES VehicleSubcategory (id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati528270 FOREIGN KEY (registrationType_id) REFERENCES RegistrationType (id);
ALTER TABLE Person ADD CONSTRAINT FKPerson637911 FOREIGN KEY (party_id) REFERENCES Party (id);
ALTER TABLE Company ADD CONSTRAINT FKCompany618251 FOREIGN KEY (party_id) REFERENCES Party (id);
ALTER TABLE Employee ADD CONSTRAINT "is a" FOREIGN KEY (person_id) REFERENCES Person (party_id);
ALTER TABLE Vehicle ADD CONSTRAINT "Has Primary" FOREIGN KEY (primaryColor) REFERENCES Color (id);
ALTER TABLE Person ADD CONSTRAINT Owns FOREIGN KEY (citizenship_id) REFERENCES Citizenship (id);
ALTER TABLE PopulatedArea ADD CONSTRAINT FKPopulatedA599940 FOREIGN KEY (id_municipality) REFERENCES Municipality (id);
ALTER TABLE Address ADD CONSTRAINT FKAddress786571 FOREIGN KEY (populatedArea_id) REFERENCES PopulatedArea (id);
ALTER TABLE Address ADD CONSTRAINT FKAddress882137 FOREIGN KEY (street_id) REFERENCES Street (id);
ALTER TABLE Party ADD CONSTRAINT "Lives/Is Registered At" FOREIGN KEY (currAddress) REFERENCES Address (id);
ALTER TABLE Person ADD CONSTRAINT FKPerson852544 FOREIGN KEY (bornIn) REFERENCES PopulatedArea (id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati911583 FOREIGN KEY (vehicle_id) REFERENCES Vehicle (id);
ALTER TABLE Request ADD CONSTRAINT FKRequest788237 FOREIGN KEY (registration_id) REFERENCES Registration (id);
ALTER TABLE EmployeeRoleBranch ADD CONSTRAINT FKEmployeeRo11412 FOREIGN KEY (role_id) REFERENCES Role (id);
ALTER TABLE EmployeeRoleBranch ADD CONSTRAINT Has FOREIGN KEY (employee_id) REFERENCES Employee (person_id);
ALTER TABLE Municipality ADD CONSTRAINT "Is Made Up Of" FOREIGN KEY (state_id) REFERENCES State (id);
ALTER TABLE EmployeeRoleBranch ADD CONSTRAINT FKEmployeeRo754410 FOREIGN KEY (branch_id) REFERENCES Branch (id);
ALTER TABLE Vehicle ADD CONSTRAINT "Has Secondary" FOREIGN KEY (secondaryColor) REFERENCES Color (id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati854162 FOREIGN KEY (employeeWithRole_id) REFERENCES EmployeeRoleBranch (id);
ALTER TABLE TechnicalCheck ADD CONSTRAINT FKTechnicalC447546 FOREIGN KEY (technicalCheckType_id) REFERENCES TechnicalCheckType (id);
ALTER TABLE TechnicalCheck ADD CONSTRAINT "Is For" FOREIGN KEY (vehicle_id) REFERENCES Vehicle (id);
ALTER TABLE TechnicalCheck_Device ADD CONSTRAINT FKTechnicalC517453 FOREIGN KEY (technicalCheck_id) REFERENCES TechnicalCheck (id);
ALTER TABLE TechnicalCheck_Device ADD CONSTRAINT FKTechnicalC610591 FOREIGN KEY (device_id) REFERENCES Device (id);
ALTER TABLE ControlOfficer ADD CONSTRAINT FKControlOff993836 FOREIGN KEY (EmployeeRoleBranch_id) REFERENCES EmployeeRoleBranch (id);
ALTER TABLE ControlOfficer ADD CONSTRAINT FKControlOff565604 FOREIGN KEY (technicalCheck_id) REFERENCES TechnicalCheck (id);
ALTER TABLE Branch ADD CONSTRAINT FKBranch908924 FOREIGN KEY (location) REFERENCES PopulatedArea (id);
ALTER TABLE Registration ADD CONSTRAINT "Is Made For" FOREIGN KEY (technicalCheck_id) REFERENCES TechnicalCheck (id);
