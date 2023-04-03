CREATE SEQUENCE seq_Role;
CREATE TABLE Employee (
  Id              SERIAL NOT NULL, 
  UserName        varchar(50) NOT NULL, 
  Password        varchar(50) NOT NULL, 
  FullName        varchar(100) NOT NULL, 
  Embg            varchar(50) NOT NULL, 
  LogInUserName   varchar(50) NOT NULL, 
  IsActive        bool, 
  RoleId          int4 NOT NULL, 
  Email           varchar(100), 
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
  Id             SERIAL NOT NULL, 
  DocumentTypeId int4 NOT NULL, 
  DocumentId     int4, 
  Ddvvalue       numeric(19, 0) NOT NULL, 
  TotalCost      numeric(19, 0) NOT NULL, 
  DateOfBill     timestamp NOT NULL, 
  VehicleId      int4 NOT NULL, 
  EmployeeId     int4 NOT NULL, 
  IsChanged      bool, 
  Cash           numeric(19, 0), 
  MunicipalityId int4 NOT NULL, 
  SoPotvrda      bool, 
  PRIMARY KEY (Id));
CREATE TABLE Document (
  Id                SERIAL NOT NULL, 
  VehicleId         int4 NOT NULL, 
  DateOfApplication timestamp, 
  EmployeeId        int4 NOT NULL, 
  WithoutBill       bool, 
  DocumentTypeId    int4 NOT NULL, 
  BaranjeId         int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Vehicle (
  Id                     SERIAL NOT NULL, 
  Model                  varchar(50) NOT NULL, 
  ManufacturerYear       int4 NOT NULL, 
  EngineNumber           varchar(50) NOT NULL, 
  ChassisNumber          varchar(50) NOT NULL, 
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
  Snaga                  numeric(19, 0) NOT NULL, 
  Volumen                numeric(19, 0) NOT NULL, 
  Mokjnost               numeric(19, 0) NOT NULL, 
  FuelType               varchar(50), 
  VehicleBrand           varchar(50), 
  PRIMARY KEY (Id));
CREATE TABLE DocumentType (
  Id          SERIAL NOT NULL, 
  Code        varchar(50) NOT NULL, 
  Description varchar(255) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Client (
  Id     SERIAL NOT NULL, 
  IsLaw  bool NOT NULL, 
  TempId int4, 
  PRIMARY KEY (Id));
CREATE TABLE Municipality (
  Id               SERIAL NOT NULL, 
  Code             varchar(50) NOT NULL, 
  Name             varchar(50) NOT NULL, 
  IsPartFromSkopje bool, 
  PRIMARY KEY (Id));
CREATE TABLE Company (
  Id             SERIAL NOT NULL, 
  ClientId       int4 NOT NULL, 
  Name           varchar(50) NOT NULL, 
  PlaceId        int4 NOT NULL, 
  MunicipalityId int4 NOT NULL, 
  StateId        int4 NOT NULL, 
  Address        varchar(100) NOT NULL, 
  Embg           varchar(50), 
  TaxNumber      varchar(50), 
  Ovlasten       int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Person (
  Id                    SERIAL NOT NULL, 
  ClientId              int4 NOT NULL, 
  FirstName             varchar(50) NOT NULL, 
  LastName              varchar(50) NOT NULL, 
  DateOfBirth           timestamp NOT NULL, 
  PlaceOfBirthId        int4 NOT NULL, 
  MunicipalityId        int4 NOT NULL, 
  StateId               int4 NOT NULL, 
  Citizenship           varchar(50), 
  Occupation            varchar(50), 
  CurrentPlaceId        int4 NOT NULL, 
  CurrentMunicipalityId int4 NOT NULL, 
  CurrentStateId        int4 NOT NULL, 
  Address               varchar(50) NOT NULL, 
  Embg                  varchar(50) NOT NULL, 
  WorkPlace             varchar(50), 
  PRIMARY KEY (Id));
CREATE TABLE Place (
  Id             SERIAL NOT NULL, 
  Code           varchar(50) NOT NULL, 
  Name           varchar(50) NOT NULL, 
  StateId        int4 NOT NULL, 
  MunicipalityId int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE State (
  Id   SERIAL NOT NULL, 
  Code varchar(50) NOT NULL, 
  Name varchar(50) NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Cathegory (
  Id                             SERIAL NOT NULL, 
  Cathegory                      int4 NOT NULL, 
  HasMainTechnicalCharacteristic bool, 
  Description                    varchar(255) NOT NULL, 
  Code                           varchar(50) NOT NULL, 
  IsActive                       bool, 
  PRIMARY KEY (Id));
CREATE TABLE Baranje (
  Id          SERIAL NOT NULL, 
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
  Id          SERIAL NOT NULL, 
  TimeStamp   timestamp NOT NULL, 
  IsAvailable bool NOT NULL, 
  BaranjeId   int4 NOT NULL, 
  PersonId    int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Ownership (
  Id        SERIAL NOT NULL, 
  VehicleId int4 NOT NULL, 
  ClientId  int4 NOT NULL, 
  DateFrom  timestamp NOT NULL, 
  DateTo    timestamp NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Registration (
  Id                   SERIAL NOT NULL, 
  NumberOfRegistration int4 NOT NULL, 
  DateOfRegistration   timestamp NOT NULL, 
  RegistrationNumber   varchar(50) NOT NULL, 
  DocumentId           int4 NOT NULL, 
  OwnershipId          int4 NOT NULL, 
  DocumentTypeId       int4 NOT NULL, 
  PRIMARY KEY (Id));
CREATE TABLE Potvrdi (
  Id             SERIAL NOT NULL, 
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
