ALTER TABLE Employee DROP CONSTRAINT FKEmployee880724;
ALTER TABLE Bill DROP CONSTRAINT FKBill283248;
ALTER TABLE Document DROP CONSTRAINT FKDocument12096;
ALTER TABLE Document DROP CONSTRAINT FKDocument46837;
ALTER TABLE Bill DROP CONSTRAINT FKBill230272;
ALTER TABLE Bill DROP CONSTRAINT FKBill389909;
ALTER TABLE Company DROP CONSTRAINT FKCompany679509;
ALTER TABLE Person DROP CONSTRAINT FKPerson678048;
ALTER TABLE Person DROP CONSTRAINT FKPerson659849;
ALTER TABLE Company DROP CONSTRAINT FKCompany348299;
ALTER TABLE Company DROP CONSTRAINT FKCompany203471;
ALTER TABLE Company DROP CONSTRAINT FKCompany112051;
ALTER TABLE Person DROP CONSTRAINT FKPerson685457;
ALTER TABLE Person DROP CONSTRAINT FKPerson131711;
ALTER TABLE Vehicle DROP CONSTRAINT FKVehicle717745;
ALTER TABLE Person DROP CONSTRAINT FKPerson761731;
ALTER TABLE Person DROP CONSTRAINT FKPerson776877;
ALTER TABLE Person DROP CONSTRAINT FKPerson328639;
ALTER TABLE Vehicle DROP CONSTRAINT FKVehicle403611;
ALTER TABLE Vehicle DROP CONSTRAINT FKVehicle422262;
ALTER TABLE Bill DROP CONSTRAINT FKBill629409;
ALTER TABLE Baranje DROP CONSTRAINT FKBaranje597863;
ALTER TABLE Baranje DROP CONSTRAINT FKBaranje218309;
ALTER TABLE Baranje DROP CONSTRAINT FKBaranje402752;
ALTER TABLE Ownership DROP CONSTRAINT FKOwnership880856;
ALTER TABLE Ownership DROP CONSTRAINT FKOwnership740204;
ALTER TABLE Document DROP CONSTRAINT FKDocument65072;
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati435007;
ALTER TABLE Place DROP CONSTRAINT FKPlace84876;
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati291442;
ALTER TABLE Registration DROP CONSTRAINT FKRegistrati903451;
ALTER TABLE Baranje DROP CONSTRAINT FKBaranje565591;
ALTER TABLE Termini DROP CONSTRAINT FKTermini164103;
ALTER TABLE Place DROP CONSTRAINT FKPlace264906;
ALTER TABLE Company DROP CONSTRAINT FKCompany677345;
ALTER TABLE Termini DROP CONSTRAINT FKTermini965390;
ALTER TABLE Potvrdi DROP CONSTRAINT FKPotvrdi532718;
ALTER TABLE Potvrdi DROP CONSTRAINT FKPotvrdi999609;
ALTER TABLE Document DROP CONSTRAINT FKDocument454615;
ALTER TABLE Potvrdi DROP CONSTRAINT FKPotvrdi54182;
DROP TABLE IF EXISTS Employee CASCADE;
DROP TABLE IF EXISTS Role CASCADE;
DROP TABLE IF EXISTS Bill CASCADE;
DROP TABLE IF EXISTS Document CASCADE;
DROP TABLE IF EXISTS Vehicle CASCADE;
DROP TABLE IF EXISTS DocumentType CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Municipality CASCADE;
DROP TABLE IF EXISTS Company CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Place CASCADE;
DROP TABLE IF EXISTS State CASCADE;
DROP TABLE IF EXISTS Cathegory CASCADE;
DROP TABLE IF EXISTS Baranje CASCADE;
DROP TABLE IF EXISTS Termini CASCADE;
DROP TABLE IF EXISTS Ownership CASCADE;
DROP TABLE IF EXISTS Registration CASCADE;
DROP TABLE IF EXISTS Potvrdi CASCADE;
CREATE TABLE Employee (
  Id              int4 NOT NULL, 
  IpAddress       varchar(50) NOT NULL, 
  Password        varchar(50) NOT NULL, 
  FullName        varchar(100) NOT NULL, 
  Embg            varchar(50) NOT NULL UNIQUE, 
  LogInUserName   varchar(50) NOT NULL UNIQUE, 
  IsActive        bool NOT NULL, 
  RoleId          int4 NOT NULL, 
  Email           varchar(100) NOT NULL UNIQUE, 
  PassChangedDate timestamp, 
  CONSTRAINT Id 
    PRIMARY KEY (Id));
CREATE TABLE Role (
  Id          int4 NOT NULL, 
  Description varchar(255) NOT NULL, 
  Name        varchar(255) NOT NULL, 
  isVisible   bool NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Bill (
  Id             int4 NOT NULL, 
  DocumentTypeId int4 NOT NULL, 
  DocumentId     int4, 
  Ddvvalue       float4 NOT NULL CHECK(Ddvvalue>0), 
  TotalCost      float4 NOT NULL CHECK(TotalCost>0), 
  DateOfBill     timestamp NOT NULL, 
  VehicleId      int4 NOT NULL, 
  EmployeeId     int4 NOT NULL, 
  IsChanged      bool, 
  Cash           float4, 
  MunicipalityId int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Document (
  Id                int4 NOT NULL, 
  VehicleId         int4 NOT NULL, 
  DateOfApplication timestamp NOT NULL, 
  EmployeeId        int4 NOT NULL, 
  WithoutBill       bool NOT NULL, 
  DocumentTypeId    int4 NOT NULL, 
  BaranjeId         int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Vehicle (
  Id                     int4 NOT NULL, 
  Model                  varchar(50) NOT NULL, 
  ManufacturerYear       int4 NOT NULL, 
  EngineNumber           varchar(50) NOT NULL, 
  ChassisNumber          varchar(50) NOT NULL UNIQUE, 
  BasicColourDescription varchar(50), 
  ManufactureStateId     int4 NOT NULL, 
  NumberOfWheels         int4, 
  FrontTyreDimensions    varchar(50), 
  RearTyreDimensions     varchar(50), 
  VehicleLicenceNumber   varchar(50), 
  RegistrationNumber     varchar(50) NOT NULL, 
  VehicleSubTypeId       int4 NOT NULL, 
  ExpirationDate         timestamp NOT NULL, 
  ParentId               int4 NOT NULL, 
  ChildId                int4 NOT NULL, 
  DateOfChange           timestamp, 
  Snaga                  float4 NOT NULL, 
  Volumen                float4 NOT NULL, 
  Mokjnost               float4 NOT NULL, 
  FuelType               varchar(50), 
  VehicleBrand           varchar(50), 
  PRIMARY KEY (Id));
CREATE TABLE DocumentType (
  Id          int4 NOT NULL, 
  Code        varchar(50) NOT NULL, 
  Description varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Client (
  Id     int4 NOT NULL, 
  IsLaw  bool NOT NULL, 
  TempId int4, 
  PRIMARY KEY (Id));
CREATE TABLE Municipality (
  Id   int4 NOT NULL, 
  Code varchar(50) NOT NULL, 
  Name varchar(50) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Company (
  Id             int4 NOT NULL, 
  ClientId       int4 NOT NULL, 
  Name           varchar(50) NOT NULL, 
  PlaceId        int4 NOT NULL, 
  MunicipalityId int4 NOT NULL, 
  StateId        int4 NOT NULL, 
  Address        varchar(100) NOT NULL, 
  Embg           varchar(50) NOT NULL UNIQUE, 
  TaxNumber      varchar(50) NOT NULL UNIQUE, 
  Ovlasten       int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Person (
  Id                    int4 NOT NULL, 
  ClientId              int4 NOT NULL, 
  FirstName             varchar(100) NOT NULL, 
  LastName              varchar(100) NOT NULL, 
  DateOfBirth           timestamp NOT NULL, 
  PlaceOfBirthId        int4 NOT NULL, 
  MunicipalityId        int4 NOT NULL, 
  StateId               int4 NOT NULL, 
  Citizenship           varchar(100), 
  Occupation            varchar(100), 
  CurrentPlaceId        int4 NOT NULL, 
  CurrentMunicipalityId int4 NOT NULL, 
  CurrentStateId        int4 NOT NULL, 
  Address               varchar(255) NOT NULL, 
  Embg                  varchar(50) NOT NULL UNIQUE, 
  WorkPlace             varchar(50), 
  PRIMARY KEY (Id));
CREATE TABLE Place (
  Id             int4 NOT NULL, 
  Code           varchar(50) NOT NULL, 
  Name           varchar(50) NOT NULL, 
  StateId        int4 NOT NULL, 
  MunicipalityId int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE State (
  Id   int4 NOT NULL, 
  Code varchar(100) NOT NULL, 
  Name varchar(100) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Cathegory (
  Id                             int4 NOT NULL, 
  Cathegory                      int4 NOT NULL, 
  HasMainTechnicalCharacteristic bool, 
  Description                    varchar(255) NOT NULL, 
  Code                           varchar(50) NOT NULL, 
  IsActive                       bool, 
  PRIMARY KEY (Id));
CREATE TABLE Baranje (
  Id          int4 NOT NULL, 
  Number      varchar(50), 
  ClientId    int4 NOT NULL, 
  VehicleId   int4 NOT NULL, 
  "Date"      timestamp, 
  CreatedBy   int4, 
  ApprovedBy  int4 NOT NULL, 
  IsPaid      bool, 
  OwnershipId int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Termini (
  Id          int4 NOT NULL, 
  TimeStamp   timestamp NOT NULL, 
  IsAvailable bool NOT NULL, 
  BaranjeId   int4 NOT NULL, 
  PersonId    int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Ownership (
  Id        int4 NOT NULL, 
  VehicleId int4 NOT NULL, 
  ClientId  int4 NOT NULL, 
  DateFrom  timestamp NOT NULL CHECK(DateFrom<DateTo), 
  DateTo    timestamp NOT NULL CHECK(DateTo>DateFrom), 
  PRIMARY KEY (Id));
CREATE TABLE Registration (
  Id                   int4 NOT NULL, 
  NumberOfRegistration int4 NOT NULL, 
  DateOfRegistration   timestamp NOT NULL, 
  RegistrationNumber   varchar(50) NOT NULL, 
  DocumentId           int4 NOT NULL, 
  OwnershipId          int4 NOT NULL, 
  DocumentTypeId       int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Potvrdi (
  Id             int4 NOT NULL, 
  BaranjeId      int4 NOT NULL, 
  OwnershipId    int4 NOT NULL, 
  DateIssued     timestamp, 
  PurposeOfIssue varchar(100), 
  IssuedBy       int4 NOT NULL, 
  PRIMARY KEY (Id));
ALTER TABLE Employee ADD CONSTRAINT FKEmployee880724 FOREIGN KEY (RoleId) REFERENCES Role (Id);
ALTER TABLE Bill ADD CONSTRAINT FKBill283248 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Document ADD CONSTRAINT FKDocument12096 FOREIGN KEY (EmployeeId) REFERENCES Employee (Id);
ALTER TABLE Document ADD CONSTRAINT FKDocument46837 FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Bill ADD CONSTRAINT FKBill230272 FOREIGN KEY (DocumentTypeId) REFERENCES DocumentType (Id);
ALTER TABLE Bill ADD CONSTRAINT FKBill389909 FOREIGN KEY (MunicipalityId) REFERENCES Municipality (Id);
ALTER TABLE Company ADD CONSTRAINT FKCompany679509 FOREIGN KEY (MunicipalityId) REFERENCES Municipality (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson678048 FOREIGN KEY (CurrentMunicipalityId) REFERENCES Municipality (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson659849 FOREIGN KEY (MunicipalityId) REFERENCES Municipality (Id);
ALTER TABLE Company ADD CONSTRAINT FKCompany348299 FOREIGN KEY (ClientId) REFERENCES Client (Id);
ALTER TABLE Company ADD CONSTRAINT FKCompany203471 FOREIGN KEY (PlaceId) REFERENCES Place (Id);
ALTER TABLE Company ADD CONSTRAINT FKCompany112051 FOREIGN KEY (StateId) REFERENCES State (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson685457 FOREIGN KEY (CurrentStateId) REFERENCES State (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson131711 FOREIGN KEY (StateId) REFERENCES State (Id);
ALTER TABLE Vehicle ADD CONSTRAINT FKVehicle717745 FOREIGN KEY (ManufactureStateId) REFERENCES State (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson761731 FOREIGN KEY (PlaceOfBirthId) REFERENCES Place (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson776877 FOREIGN KEY (CurrentPlaceId) REFERENCES Place (Id);
ALTER TABLE Person ADD CONSTRAINT FKPerson328639 FOREIGN KEY (ClientId) REFERENCES Client (Id);
ALTER TABLE Vehicle ADD CONSTRAINT FKVehicle403611 FOREIGN KEY (ChildId) REFERENCES Vehicle (Id);
ALTER TABLE Vehicle ADD CONSTRAINT FKVehicle422262 FOREIGN KEY (VehicleSubTypeId) REFERENCES Cathegory (Id);
ALTER TABLE Bill ADD CONSTRAINT FKBill629409 FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Baranje ADD CONSTRAINT FKBaranje597863 FOREIGN KEY (ApprovedBy) REFERENCES Employee (Id);
ALTER TABLE Baranje ADD CONSTRAINT FKBaranje218309 FOREIGN KEY (ClientId) REFERENCES Client (Id);
ALTER TABLE Baranje ADD CONSTRAINT FKBaranje402752 FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Ownership ADD CONSTRAINT FKOwnership880856 FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Ownership ADD CONSTRAINT FKOwnership740204 FOREIGN KEY (ClientId) REFERENCES Client (Id);
ALTER TABLE Document ADD CONSTRAINT FKDocument65072 FOREIGN KEY (DocumentTypeId) REFERENCES DocumentType (Id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati435007 FOREIGN KEY (OwnershipId) REFERENCES Ownership (Id);
ALTER TABLE Place ADD CONSTRAINT FKPlace84876 FOREIGN KEY (StateId) REFERENCES State (Id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati291442 FOREIGN KEY (DocumentTypeId) REFERENCES DocumentType (Id);
ALTER TABLE Registration ADD CONSTRAINT FKRegistrati903451 FOREIGN KEY (DocumentId) REFERENCES Document (Id);
ALTER TABLE Baranje ADD CONSTRAINT FKBaranje565591 FOREIGN KEY (OwnershipId) REFERENCES Ownership (Id);
ALTER TABLE Termini ADD CONSTRAINT FKTermini164103 FOREIGN KEY (BaranjeId) REFERENCES Baranje (Id);
ALTER TABLE Place ADD CONSTRAINT FKPlace264906 FOREIGN KEY (MunicipalityId) REFERENCES Municipality (Id);
ALTER TABLE Company ADD CONSTRAINT FKCompany677345 FOREIGN KEY (Ovlasten) REFERENCES Person (Id);
ALTER TABLE Termini ADD CONSTRAINT FKTermini965390 FOREIGN KEY (PersonId) REFERENCES Person (Id);
ALTER TABLE Potvrdi ADD CONSTRAINT FKPotvrdi532718 FOREIGN KEY (BaranjeId) REFERENCES Baranje (Id);
ALTER TABLE Potvrdi ADD CONSTRAINT FKPotvrdi999609 FOREIGN KEY (OwnershipId) REFERENCES Ownership (Id);
ALTER TABLE Document ADD CONSTRAINT FKDocument454615 FOREIGN KEY (BaranjeId) REFERENCES Baranje (Id);
ALTER TABLE Potvrdi ADD CONSTRAINT FKPotvrdi54182 FOREIGN KEY (IssuedBy) REFERENCES Employee (Id);
