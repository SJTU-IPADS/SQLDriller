create table country
(
    Code           char(3)      default ''     not null
        primary key,
    Name           char(52)     default ''     not null,
    Continent      text         default 'Asia' not null,
    Region         char(26)     default ''     not null,
    SurfaceArea    float(10, 2) default '0.00' not null,
    IndepYear      integer      default NULL,
    Population     integer      default '0'    not null,
    LifeExpectancy float(3, 1)  default NULL,
    GNP            float(10, 2) default NULL,
    GNPOld         float(10, 2) default NULL,
    LocalName      char(45)     default ''     not null,
    GovernmentForm char(45)     default ''     not null,
    HeadOfState    char(60)     default NULL,
    Capital        integer      default NULL,
    Code2          char(2)      default ''     not null
);

create table city
(
    ID          integer              not null
        primary key,
    Name        char(35) default ''  not null,
    CountryCode char(3)  default ''  not null
        references country (Code),
    District    char(20) default ''  not null,
    Population  integer  default '0' not null
);

create index idx_city_CountryCode
    on city (CountryCode);

create table countrylanguage
(
    CountryCode char(3)     default ''    not null
        references country (Code),
    Language    char(30)    default ''    not null,
    IsOfficial  text        default 'F'   not null,
    Percentage  float(4, 1) default '0.0' not null,
    primary key (CountryCode, Language)
);

create index idx_countrylanguage_CountryCode
    on countrylanguage (CountryCode);

