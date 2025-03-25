CREATE TABLE `Country`
(
    CountryCode                                TEXT NOT NULL PRIMARY KEY,
    ShortName                                  TEXT,
    TableName                                  TEXT,
    LongName                                   TEXT,
    Alpha2Code                                 TEXT,
    CurrencyUnit                               TEXT,
    SpecialNotes                               TEXT,
    Region                                     TEXT,
    IncomeGroup                                TEXT,
    Wb2Code                                    TEXT,
    NationalAccountsBaseYear                   TEXT,
    NationalAccountsReferenceYear              TEXT,
    SnaPriceValuation                          TEXT,
    LendingCategory                            TEXT,
    OtherGroups                                TEXT,
    SystemOfNationalAccounts                   TEXT,
    AlternativeConversionFactor                TEXT,
    PppSurveyYear                              TEXT,
    BalanceOfPaymentsManualInUse               TEXT,
    ExternalDebtReportingStatus                TEXT,
    SystemOfTrade                              TEXT,
    GovernmentAccountingConcept                TEXT,
    ImfDataDisseminationStandard               TEXT,
    LatestPopulationCensus                     TEXT,
    LatestHouseholdSurvey                      TEXT,
    SourceOfMostRecentIncomeAndExpenditureData TEXT,
    VitalRegistrationComplete                  TEXT,
    LatestAgriculturalCensus                   TEXT,
    LatestIndustrialData                       INT,
    LatestTradeData                            INT,
    LatestWaterWithdrawalData                  INT
);
CREATE TABLE `Series`
(
    SeriesCode                       TEXT NOT NULL PRIMARY KEY,
    Topic                            TEXT,
    IndicatorName                    TEXT,
    ShortDefinition                  TEXT,
    LongDefinition                   TEXT,
    UnitOfMeasure                    TEXT,
    Periodicity                      TEXT,
    BasePeriod                       TEXT,
    OtherNotes                       INT,
    AggregationMethod                TEXT,
    LimitationsAndExceptions         TEXT,
    NotesFromOriginalSource          TEXT,
    GeneralComments                  TEXT,
    Source                           TEXT,
    StatisticalConceptAndMethodology TEXT,
    DevelopmentRelevance             TEXT,
    RelatedSourceLinks               TEXT,
    OtherWebLinks                    INT,
    RelatedIndicators                INT,
    LicenseType                      TEXT
);
CREATE TABLE CountryNotes
(
    Countrycode TEXT NOT NULL,
    Seriescode  TEXT NOT NULL,
    Description TEXT,
    PRIMARY KEY (Countrycode, Seriescode),
    FOREIGN KEY (Seriescode) REFERENCES Series (SeriesCode),
    FOREIGN KEY (Countrycode) REFERENCES Country (CountryCode)
);
CREATE TABLE Footnotes
(
    Countrycode TEXT NOT NULL,
    Seriescode  TEXT NOT NULL,
    Year        TEXT,
    Description TEXT,
    PRIMARY KEY (Countrycode, Seriescode, Year),
    FOREIGN KEY (Seriescode) REFERENCES Series (SeriesCode),
    FOREIGN KEY (Countrycode) REFERENCES Country (CountryCode)
);
CREATE TABLE Indicators
(
    CountryName   TEXT,
    CountryCode   TEXT NOT NULL,
    IndicatorName TEXT,
    IndicatorCode TEXT NOT NULL,
    Year          INT  NOT NULL,
    Value         INT,
    PRIMARY KEY (CountryCode, IndicatorCode, Year),
    FOREIGN KEY (CountryCode) REFERENCES Country (CountryCode)
);
CREATE TABLE SeriesNotes
(
    Seriescode  TEXT NOT NULL,
    Year        TEXT NOT NULL,
    Description TEXT,
    PRIMARY KEY (Seriescode, Year),
    FOREIGN KEY (Seriescode) REFERENCES Series (SeriesCode)
);
