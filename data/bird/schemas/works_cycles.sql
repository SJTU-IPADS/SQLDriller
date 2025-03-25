CREATE TABLE CountryRegion
(
    CountryRegionCode TEXT                                 NOT NULL PRIMARY KEY,
    Name              TEXT                                 NOT NULL UNIQUE,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE Culture
(
    CultureID    TEXT                                 NOT NULL PRIMARY KEY,
    Name         TEXT                                 NOT NULL UNIQUE,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE Currency
(
    CurrencyCode TEXT                                 NOT NULL PRIMARY KEY,
    Name         TEXT                                 NOT NULL UNIQUE,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE CountryRegionCurrency
(
    CountryRegionCode TEXT                                 NOT NULL,
    CurrencyCode      TEXT                                 NOT NULL,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (CountryRegionCode, CurrencyCode),
    FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion (CountryRegionCode),
    FOREIGN KEY (CurrencyCode) REFERENCES Currency (CurrencyCode)
);
CREATE TABLE Person
(
    BusinessEntityID      INT                                  NOT NULL PRIMARY KEY,
    PersonType            TEXT                                 NOT NULL,
    NameStyle             INT      DEFAULT 0                   NOT NULL,
    Title                 TEXT,
    FirstName             TEXT                                 NOT NULL,
    MiddleName            TEXT,
    LastName              TEXT                                 NOT NULL,
    Suffix                TEXT,
    EmailPromotion        INT      DEFAULT 0                   NOT NULL,
    AdditionalContactInfo TEXT,
    Demographics          TEXT,
    rowguid               TEXT                                 NOT NULL UNIQUE,
    ModifiedDate          DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
);
CREATE TABLE BusinessEntityContact
(
    BusinessEntityID INT                                  NOT NULL,
    PersonID         INT                                  NOT NULL,
    ContactTypeID    INT                                  NOT NULL,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, PersonID, ContactTypeID),
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID),
    FOREIGN KEY (ContactTypeID) REFERENCES ContactType (ContactTypeID),
    FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID)
);
CREATE TABLE EmailAddress
(
    BusinessEntityID INT                                  NOT NULL,
    EmailAddressID   INT,
    EmailAddress     TEXT,
    rowguid          TEXT                                 NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (EmailAddressID, BusinessEntityID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person (BusinessEntityID)
);
CREATE TABLE Employee
(
    BusinessEntityID  INT                                  NOT NULL PRIMARY KEY,
    NationalIDNumber  TEXT                                 NOT NULL UNIQUE,
    LoginID           TEXT                                 NOT NULL UNIQUE,
    OrganizationNode  TEXT,
    OrganizationLevel INT,
    JobTitle          TEXT                                 NOT NULL,
    BirthDate         DATE                                 NOT NULL,
    MaritalStatus     TEXT                                 NOT NULL,
    Gender            TEXT                                 NOT NULL,
    HireDate          DATE                                 NOT NULL,
    SalariedFlag      INT      DEFAULT 1                   NOT NULL,
    VacationHours     INT      DEFAULT 0                   NOT NULL,
    SickLeaveHours    INT      DEFAULT 0                   NOT NULL,
    CurrentFlag       INT      DEFAULT 1                   NOT NULL,
    rowguid           TEXT                                 NOT NULL UNIQUE,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES Person (BusinessEntityID)
);
CREATE TABLE Password
(
    BusinessEntityID INT                                  NOT NULL PRIMARY KEY,
    PasswordHash     TEXT                                 NOT NULL,
    PasswordSalt     TEXT                                 NOT NULL,
    rowguid          TEXT                                 NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES Person (BusinessEntityID)
);
CREATE TABLE PersonCreditCard
(
    BusinessEntityID INT                                  NOT NULL,
    CreditCardID     INT                                  NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, CreditCardID),
    FOREIGN KEY (CreditCardID) REFERENCES CreditCard (CreditCardID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person (BusinessEntityID)
);
CREATE TABLE ProductCategory
(
    ProductCategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name              TEXT                                 NOT NULL UNIQUE,
    rowguid           TEXT                                 NOT NULL UNIQUE,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE ProductDescription
(
    ProductDescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    Description          TEXT                                 NOT NULL,
    rowguid              TEXT                                 NOT NULL UNIQUE,
    ModifiedDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE ProductModel
(
    ProductModelID     INT PRIMARY KEY AUTO_INCREMENT,
    Name               TEXT                                 NOT NULL UNIQUE,
    CatalogDescription TEXT,
    Instructions       TEXT,
    rowguid            TEXT                                 NOT NULL UNIQUE,
    ModifiedDate       DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE ProductModelProductDescriptionCulture
(
    ProductModelID       INT                                  NOT NULL,
    ProductDescriptionID INT                                  NOT NULL,
    CultureID            TEXT                                 NOT NULL,
    ModifiedDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductModelID, ProductDescriptionID, CultureID),
    FOREIGN KEY (ProductModelID) REFERENCES ProductModel (ProductModelID),
    FOREIGN KEY (ProductDescriptionID) REFERENCES ProductDescription (ProductDescriptionID),
    FOREIGN KEY (CultureID) REFERENCES Culture (CultureID)
);
CREATE TABLE ProductPhoto
(
    ProductPhotoID         INT PRIMARY KEY AUTO_INCREMENT,
    ThumbNailPhoto         BLOB,
    ThumbnailPhotoFileName TEXT,
    LargePhoto             BLOB,
    LargePhotoFileName     TEXT,
    ModifiedDate           DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE ProductSubcategory
(
    ProductSubcategoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductCategoryID    INT                                  NOT NULL,
    Name                 TEXT                                 NOT NULL UNIQUE,
    rowguid              TEXT                                 NOT NULL UNIQUE,
    ModifiedDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory (ProductCategoryID)
);
CREATE TABLE SalesReason
(
    SalesReasonID INT PRIMARY KEY AUTO_INCREMENT,
    Name          TEXT                                 NOT NULL,
    ReasonType    TEXT                                 NOT NULL,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE SalesTerritory
(
    TerritoryID       INT PRIMARY KEY AUTO_INCREMENT,
    Name              TEXT                                 NOT NULL UNIQUE,
    CountryRegionCode TEXT                                 NOT NULL,
    `Group`           TEXT                                 NOT NULL,
    SalesYTD          FLOAT    DEFAULT 0.0000              NOT NULL,
    SalesLastYear     FLOAT    DEFAULT 0.0000              NOT NULL,
    CostYTD           FLOAT    DEFAULT 0.0000              NOT NULL,
    CostLastYear      FLOAT    DEFAULT 0.0000              NOT NULL,
    rowguid           TEXT                                 NOT NULL UNIQUE,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion (CountryRegionCode)
);
CREATE TABLE SalesPerson
(
    BusinessEntityID INT                                  NOT NULL PRIMARY KEY,
    TerritoryID      INT,
    SalesQuota       FLOAT,
    Bonus            FLOAT    DEFAULT 0.0000              NOT NULL,
    CommissionPct    FLOAT    DEFAULT 0.0000              NOT NULL,
    SalesYTD         FLOAT    DEFAULT 0.0000              NOT NULL,
    SalesLastYear    FLOAT    DEFAULT 0.0000              NOT NULL,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES Employee (BusinessEntityID),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory (TerritoryID)
);
CREATE TABLE SalesPersonQuotaHistory
(
    BusinessEntityID INT                                  NOT NULL,
    QuotaDate        DATETIME                             NOT NULL,
    SalesQuota       FLOAT                                NOT NULL,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, QuotaDate),
    FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson (BusinessEntityID)
);
CREATE TABLE SalesTerritoryHistory
(
    BusinessEntityID INT                                  NOT NULL,
    TerritoryID      INT                                  NOT NULL,
    StartDate        DATETIME                             NOT NULL,
    EndDate          DATETIME,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, StartDate, TerritoryID),
    FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson (BusinessEntityID),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory (TerritoryID)
);
CREATE TABLE ScrapReason
(
    ScrapReasonID INT PRIMARY KEY AUTO_INCREMENT,
    Name          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE Shift
(
    ShiftID      INT PRIMARY KEY AUTO_INCREMENT,
    Name         TEXT                                 NOT NULL UNIQUE,
    StartTime    TEXT                                 NOT NULL,
    EndTime      TEXT                                 NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (StartTime, EndTime)
);
CREATE TABLE ShipMethod
(
    ShipMethodID INT PRIMARY KEY AUTO_INCREMENT,
    Name         TEXT                                 NOT NULL UNIQUE,
    ShipBase     FLOAT    DEFAULT 0.0000              NOT NULL,
    ShipRate     FLOAT    DEFAULT 0.0000              NOT NULL,
    rowguid      TEXT                                 NOT NULL UNIQUE,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE SpecialOffer
(
    SpecialOfferID INT PRIMARY KEY AUTO_INCREMENT,
    Description    TEXT                                 NOT NULL,
    DiscountPct    FLOAT    DEFAULT 0.0000              NOT NULL,
    Type           TEXT                                 NOT NULL,
    Category       TEXT                                 NOT NULL,
    StartDate      DATETIME                             NOT NULL,
    EndDate        DATETIME                             NOT NULL,
    MinQty         INT      DEFAULT 0                   NOT NULL,
    MaxQty         INT,
    rowguid        TEXT                                 NOT NULL UNIQUE,
    ModifiedDate   DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE BusinessEntityAddress
(
    BusinessEntityID INT                                  NOT NULL,
    AddressID        INT                                  NOT NULL,
    AddressTypeID    INT                                  NOT NULL,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, AddressID, AddressTypeID),
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID),
    FOREIGN KEY (AddressTypeID) REFERENCES AddressType (AddressTypeID),
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
);
CREATE TABLE SalesTaxRate
(
    SalesTaxRateID  INT PRIMARY KEY AUTO_INCREMENT,
    StateProvinceID INT                                  NOT NULL,
    TaxType         INT                                  NOT NULL,
    TaxRate         FLOAT    DEFAULT 0.0000              NOT NULL,
    Name            TEXT                                 NOT NULL,
    rowguid         TEXT                                 NOT NULL UNIQUE,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (StateProvinceID, TaxType),
    FOREIGN KEY (StateProvinceID) REFERENCES StateProvince (StateProvinceID)
);
CREATE TABLE Store
(
    BusinessEntityID INT                                  NOT NULL PRIMARY KEY,
    Name             TEXT                                 NOT NULL,
    SalesPersonID    INT,
    Demographics     TEXT,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID),
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (BusinessEntityID)
);
CREATE TABLE SalesOrderHeaderSalesReason
(
    SalesOrderID  INT                                  NOT NULL,
    SalesReasonID INT                                  NOT NULL,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (SalesOrderID, SalesReasonID),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader (SalesOrderID),
    FOREIGN KEY (SalesReasonID) REFERENCES SalesReason (SalesReasonID)
);
CREATE TABLE TransactionHistoryArchive
(
    TransactionID        INT                                  NOT NULL PRIMARY KEY,
    ProductID            INT                                  NOT NULL,
    ReferenceOrderID     INT                                  NOT NULL,
    ReferenceOrderLineID INT      DEFAULT 0                   NOT NULL,
    TransactionDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    TransactionType      TEXT                                 NOT NULL,
    Quantity             INT                                  NOT NULL,
    ActualCost           FLOAT                                NOT NULL,
    ModifiedDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE UnitMeasure
(
    UnitMeasureCode TEXT                                 NOT NULL PRIMARY KEY,
    Name            TEXT                                 NOT NULL UNIQUE,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE ProductCostHistory
(
    ProductID    INT                                  NOT NULL,
    StartDate    DATE                                 NOT NULL,
    EndDate      DATE,
    StandardCost FLOAT                                NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, StartDate),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE ProductDocument
(
    ProductID    INT                                  NOT NULL,
    DocumentNode TEXT                                 NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, DocumentNode),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (DocumentNode) REFERENCES Document (DocumentNode)
);
CREATE TABLE ProductInventory
(
    ProductID    INT                                  NOT NULL,
    LocationID   INT                                  NOT NULL,
    Shelf        TEXT                                 NOT NULL,
    Bin          INT                                  NOT NULL,
    Quantity     INT      DEFAULT 0                   NOT NULL,
    rowguid      TEXT                                 NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, LocationID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (LocationID) REFERENCES Location (LocationID)
);
CREATE TABLE ProductProductPhoto
(
    ProductID      INT                                  NOT NULL,
    ProductPhotoID INT                                  NOT NULL,
    `Primary`      INT      DEFAULT 0                   NOT NULL,
    ModifiedDate   DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, ProductPhotoID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (ProductPhotoID) REFERENCES ProductPhoto (ProductPhotoID)
);
CREATE TABLE ProductReview
(
    ProductReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID       INT                                  NOT NULL,
    ReviewerName    TEXT                                 NOT NULL,
    ReviewDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    EmailAddress    TEXT                                 NOT NULL,
    Rating          INT                                  NOT NULL,
    Comments        TEXT,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE ShoppingCartItem
(
    ShoppingCartItemID INT PRIMARY KEY AUTO_INCREMENT,
    ShoppingCartID     TEXT                                 NOT NULL,
    Quantity           INT      DEFAULT 1                   NOT NULL,
    ProductID          INT                                  NOT NULL,
    DateCreated        DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    ModifiedDate       DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE SpecialOfferProduct
(
    SpecialOfferID INT                                  NOT NULL,
    ProductID      INT                                  NOT NULL,
    rowguid        TEXT                                 NOT NULL UNIQUE,
    ModifiedDate   DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (SpecialOfferID, ProductID),
    FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOffer (SpecialOfferID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE SalesOrderDetail
(
    SalesOrderID          INT                                  NOT NULL,
    SalesOrderDetailID    INT PRIMARY KEY AUTO_INCREMENT,
    CarrierTrackingNumber TEXT,
    OrderQty              INT                                  NOT NULL,
    ProductID             INT                                  NOT NULL,
    SpecialOfferID        INT                                  NOT NULL,
    UnitPrice             FLOAT                                NOT NULL,
    UnitPriceDiscount     FLOAT    DEFAULT 0.0000              NOT NULL,
    LineTotal             FLOAT                                NOT NULL,
    rowguid               TEXT                                 NOT NULL UNIQUE,
    ModifiedDate          DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader (SalesOrderID),
    FOREIGN KEY (SpecialOfferID, ProductID) REFERENCES SpecialOfferProduct (SpecialOfferID, ProductID)
);
CREATE TABLE TransactionHistory
(
    TransactionID        INT PRIMARY KEY AUTO_INCREMENT,
    ProductID            INT                                  NOT NULL,
    ReferenceOrderID     INT                                  NOT NULL,
    ReferenceOrderLineID INT      DEFAULT 0                   NOT NULL,
    TransactionDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    TransactionType      TEXT                                 NOT NULL,
    Quantity             INT                                  NOT NULL,
    ActualCost           FLOAT                                NOT NULL,
    ModifiedDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE Vendor
(
    BusinessEntityID        INT                                  NOT NULL PRIMARY KEY,
    AccountNumber           TEXT                                 NOT NULL UNIQUE,
    Name                    TEXT                                 NOT NULL,
    CreditRating            INT                                  NOT NULL,
    PreferredVendorStatus   INT      DEFAULT 1                   NOT NULL,
    ActiveFlag              INT      DEFAULT 1                   NOT NULL,
    PurchasingWebServiceURL TEXT,
    ModifiedDate            DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity (BusinessEntityID)
);
CREATE TABLE ProductVendor
(
    ProductID        INT                                  NOT NULL,
    BusinessEntityID INT                                  NOT NULL,
    AverageLeadTime  INT                                  NOT NULL,
    StandardPrice    FLOAT                                NOT NULL,
    LastReceiptCost  FLOAT,
    LastReceiptDate  DATETIME,
    MinOrderQty      INT                                  NOT NULL,
    MaxOrderQty      INT                                  NOT NULL,
    OnOrderQty       INT,
    UnitMeasureCode  TEXT                                 NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, BusinessEntityID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Vendor (BusinessEntityID),
    FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure (UnitMeasureCode)
);
CREATE TABLE PurchaseOrderHeader
(
    PurchaseOrderID INT PRIMARY KEY AUTO_INCREMENT,
    RevisionNumber  INT      DEFAULT 0                   NOT NULL,
    Status          INT      DEFAULT 1                   NOT NULL,
    EmployeeID      INT                                  NOT NULL,
    VendorID        INT                                  NOT NULL,
    ShipMethodID    INT                                  NOT NULL,
    OrderDate       DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    ShipDate        DATETIME,
    SubTotal        FLOAT    DEFAULT 0.0000              NOT NULL,
    TaxAmt          FLOAT    DEFAULT 0.0000              NOT NULL,
    Freight         FLOAT    DEFAULT 0.0000              NOT NULL,
    TotalDue        FLOAT                                NOT NULL,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (BusinessEntityID),
    FOREIGN KEY (VendorID) REFERENCES Vendor (BusinessEntityID),
    FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod (ShipMethodID)
);
CREATE TABLE PurchaseOrderDetail
(
    PurchaseOrderID       INT                                  NOT NULL,
    PurchaseOrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    DueDate               DATETIME                             NOT NULL,
    OrderQty              INT                                  NOT NULL,
    ProductID             INT                                  NOT NULL,
    UnitPrice             FLOAT                                NOT NULL,
    LineTotal             FLOAT                                NOT NULL,
    ReceivedQty           FLOAT                                NOT NULL,
    RejectedQty           FLOAT                                NOT NULL,
    StockedQty            FLOAT                                NOT NULL,
    ModifiedDate          DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader (PurchaseOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE WorkOrder
(
    WorkOrderID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductID     INT                                  NOT NULL,
    OrderQty      INT                                  NOT NULL,
    StockedQty    INT                                  NOT NULL,
    ScrappedQty   INT                                  NOT NULL,
    StartDate     DATETIME                             NOT NULL,
    EndDate       DATETIME,
    DueDate       DATETIME                             NOT NULL,
    ScrapReasonID INT,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
    FOREIGN KEY (ScrapReasonID) REFERENCES ScrapReason (ScrapReasonID)
);
CREATE TABLE WorkOrderRouting
(
    WorkOrderID        INT                                  NOT NULL,
    ProductID          INT                                  NOT NULL,
    OperationSequence  INT                                  NOT NULL,
    LocationID         INT                                  NOT NULL,
    ScheduledStartDate DATETIME                             NOT NULL,
    ScheduledEndDate   DATETIME                             NOT NULL,
    ActualStartDate    DATETIME,
    ActualEndDate      DATETIME,
    ActualResourceHrs  FLOAT,
    PlannedCost        FLOAT                                NOT NULL,
    ActualCost         FLOAT,
    ModifiedDate       DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (WorkOrderID, ProductID, OperationSequence),
    FOREIGN KEY (WorkOrderID) REFERENCES WorkOrder (WorkOrderID),
    FOREIGN KEY (LocationID) REFERENCES Location (LocationID)
);
CREATE TABLE Customer
(
    CustomerID    INT PRIMARY KEY,
    PersonID      INT,
    StoreID       INT,
    TerritoryID   INT,
    AccountNumber TEXT                                 NOT NULL UNIQUE,
    rowguid       TEXT                                 NOT NULL UNIQUE,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person (BusinessEntityID),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory (TerritoryID),
    FOREIGN KEY (StoreID) REFERENCES Store (BusinessEntityID)
);
CREATE TABLE ProductListPriceHistory
(
    ProductID    INT                                  NOT NULL,
    StartDate    DATE                                 NOT NULL,
    EndDate      DATE,
    ListPrice    FLOAT                                NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (ProductID, StartDate),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);
CREATE TABLE `Address`
(
    AddressID       INT PRIMARY KEY AUTO_INCREMENT,
    AddressLine1    TEXT                                 NOT NULL,
    AddressLine2    TEXT,
    City            TEXT                                 NOT NULL,
    StateProvinceID INT                                  NOT NULL REFERENCES StateProvince (StateProvinceID),
    PostalCode      TEXT                                 NOT NULL,
    SpatialLocation TEXT,
    rowguid         TEXT                                 NOT NULL UNIQUE,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (AddressLine1, AddressLine2, City, StateProvinceID, PostalCode)
);
CREATE TABLE `AddressType`
(
    AddressTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Name          TEXT                                 NOT NULL UNIQUE,
    rowguid       TEXT                                 NOT NULL UNIQUE,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `BillOfMaterials`
(
    BillOfMaterialsID INT PRIMARY KEY AUTO_INCREMENT,
    ProductAssemblyID INT REFERENCES Product (ProductID),
    ComponentID       INT                                  NOT NULL REFERENCES Product (ProductID),
    StartDate         DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    EndDate           DATETIME,
    UnitMeasureCode   TEXT                                 NOT NULL REFERENCES UnitMeasure (UnitMeasureCode),
    BOMLevel          INT                                  NOT NULL,
    PerAssemblyQty    FLOAT    DEFAULT 1.00                NOT NULL,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (ProductAssemblyID, ComponentID, StartDate)
);
CREATE TABLE `BusinessEntity`
(
    BusinessEntityID INT PRIMARY KEY AUTO_INCREMENT,
    rowguid          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `ContactType`
(
    ContactTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Name          TEXT                                 NOT NULL UNIQUE,
    ModifiedDate  DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `CurrencyRate`
(
    CurrencyRateID   INT PRIMARY KEY AUTO_INCREMENT,
    CurrencyRateDate DATETIME                             NOT NULL,
    FromCurrencyCode TEXT                                 NOT NULL REFERENCES Currency (CurrencyCode),
    ToCurrencyCode   TEXT                                 NOT NULL REFERENCES Currency (CurrencyCode),
    AverageRate      FLOAT                                NOT NULL,
    EndOfDayRate     FLOAT                                NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (CurrencyRateDate, FromCurrencyCode, ToCurrencyCode)
);
CREATE TABLE `Department`
(
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name         TEXT                                 NOT NULL UNIQUE,
    GroupName    TEXT                                 NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `EmployeeDepartmentHistory`
(
    BusinessEntityID INT                                  NOT NULL REFERENCES Employee (BusinessEntityID),
    DepartmentID     INT                                  NOT NULL REFERENCES Department (DepartmentID),
    ShiftID          INT                                  NOT NULL REFERENCES Shift (ShiftID),
    StartDate        DATE                                 NOT NULL,
    EndDate          DATE,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, StartDate, DepartmentID, ShiftID)
);
CREATE TABLE `EmployeePayHistory`
(
    BusinessEntityID INT                                  NOT NULL REFERENCES Employee (BusinessEntityID),
    RateChangeDate   DATETIME                             NOT NULL,
    Rate             FLOAT                                NOT NULL,
    PayFrequency     INT                                  NOT NULL,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    PRIMARY KEY (BusinessEntityID, RateChangeDate)
);
CREATE TABLE `JobCandidate`
(
    JobCandidateID   INT PRIMARY KEY AUTO_INCREMENT,
    BusinessEntityID INT REFERENCES Employee (BusinessEntityID),
    Resume           TEXT,
    ModifiedDate     DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `Location`
(
    LocationID   INT PRIMARY KEY AUTO_INCREMENT,
    Name         TEXT                                 NOT NULL UNIQUE,
    CostRate     FLOAT    DEFAULT 0.0000              NOT NULL,
    Availability FLOAT    DEFAULT 0.00                NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `PhoneNumberType`
(
    PhoneNumberTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Name              TEXT                                 NOT NULL,
    ModifiedDate      DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `Product`
(
    ProductID             INT PRIMARY KEY AUTO_INCREMENT,
    Name                  TEXT                                 NOT NULL UNIQUE,
    ProductNumber         TEXT                                 NOT NULL UNIQUE,
    MakeFlag              INT      DEFAULT 1                   NOT NULL,
    FinishedGoodsFlag     INT      DEFAULT 1                   NOT NULL,
    Color                 TEXT,
    SafetyStockLevel      INT                                  NOT NULL,
    ReorderPoint          INT                                  NOT NULL,
    StandardCost          FLOAT                                NOT NULL,
    ListPrice             FLOAT                                NOT NULL,
    Size                  TEXT,
    SizeUnitMeasureCode   TEXT REFERENCES UnitMeasure (UnitMeasureCode),
    WeightUnitMeasureCode TEXT REFERENCES UnitMeasure (UnitMeasureCode),
    Weight                FLOAT,
    DaysToManufacture     INT                                  NOT NULL,
    ProductLine           TEXT,
    Class                 TEXT,
    Style                 TEXT,
    ProductSubcategoryID  INT REFERENCES ProductSubcategory (ProductSubcategoryID),
    ProductModelID        INT REFERENCES ProductModel (ProductModelID),
    SellStartDate         DATETIME                             NOT NULL,
    SellEndDate           DATETIME,
    DiscontinuedDate      DATETIME,
    rowguid               TEXT                                 NOT NULL UNIQUE,
    ModifiedDate          DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `Document`
(
    DocumentNode    TEXT                                 NOT NULL PRIMARY KEY,
    DocumentLevel   INT,
    Title           TEXT                                 NOT NULL,
    Owner           INT                                  NOT NULL REFERENCES Employee (BusinessEntityID),
    FolderFlag      INT      DEFAULT 0                   NOT NULL,
    FileName        TEXT                                 NOT NULL,
    FileExtension   TEXT                                 NOT NULL,
    Revision        TEXT                                 NOT NULL,
    ChangeNumber    INT      DEFAULT 0                   NOT NULL,
    Status          INT                                  NOT NULL,
    DocumentSummary TEXT,
    Document        BLOB,
    rowguid         TEXT                                 NOT NULL UNIQUE,
    ModifiedDate    DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (DocumentLevel, DocumentNode)
);
CREATE TABLE `StateProvince`
(
    StateProvinceID         INT PRIMARY KEY AUTO_INCREMENT,
    StateProvinceCode       TEXT                                 NOT NULL,
    CountryRegionCode       TEXT                                 NOT NULL REFERENCES CountryRegion (CountryRegionCode),
    IsOnlyStateProvinceFlag INT      DEFAULT 1                   NOT NULL,
    Name                    TEXT                                 NOT NULL UNIQUE,
    TerritoryID             INT                                  NOT NULL REFERENCES SalesTerritory (TerritoryID),
    rowguid                 TEXT                                 NOT NULL UNIQUE,
    ModifiedDate            DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    UNIQUE (StateProvinceCode, CountryRegionCode)
);
CREATE TABLE `CreditCard`
(
    CreditCardID INT PRIMARY KEY AUTO_INCREMENT,
    CardType     TEXT                                 NOT NULL,
    CardNumber   TEXT                                 NOT NULL UNIQUE,
    ExpMonth     INT                                  NOT NULL,
    ExpYear      INT                                  NOT NULL,
    ModifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
CREATE TABLE `SalesOrderHeader`
(
    SalesOrderID           INT PRIMARY KEY AUTO_INCREMENT,
    RevisionNumber         INT      DEFAULT 0                   NOT NULL,
    OrderDate              DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL,
    DueDate                DATETIME                             NOT NULL,
    ShipDate               DATETIME,
    Status                 INT      DEFAULT 1                   NOT NULL,
    OnlineOrderFlag        INT      DEFAULT 1                   NOT NULL,
    SalesOrderNumber       TEXT                                 NOT NULL UNIQUE,
    PurchaseOrderNumber    TEXT,
    AccountNumber          TEXT,
    CustomerID             INT                                  NOT NULL REFERENCES Customer (CustomerID),
    SalesPersonID          INT REFERENCES SalesPerson (BusinessEntityID),
    TerritoryID            INT REFERENCES SalesTerritory (TerritoryID),
    BillToAddressID        INT                                  NOT NULL REFERENCES Address (AddressID),
    ShipToAddressID        INT                                  NOT NULL REFERENCES Address (AddressID),
    ShipMethodID           INT                                  NOT NULL REFERENCES Address (AddressID),
    CreditCardID           INT REFERENCES CreditCard (CreditCardID),
    CreditCardApprovalCode TEXT,
    CurrencyRateID         INT REFERENCES CurrencyRate (CurrencyRateID),
    SubTotal               FLOAT    DEFAULT 0.0000              NOT NULL,
    TaxAmt                 FLOAT    DEFAULT 0.0000              NOT NULL,
    Freight                FLOAT    DEFAULT 0.0000              NOT NULL,
    TotalDue               FLOAT                                NOT NULL,
    Comment                TEXT,
    rowguid                TEXT                                 NOT NULL UNIQUE,
    ModifiedDate           DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL
);
