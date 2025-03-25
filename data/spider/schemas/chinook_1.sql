create table Artist
(
    ArtistId integer not null
        primary key,
    Name     varchar(120) default NULL
);

create table Album
(
    AlbumId  integer      not null
        primary key,
    Title    varchar(160) not null,
    ArtistId integer      not null
        references Artist (ArtistId)
);

create index idx_Album_IFK_AlbumArtistId
    on Album (ArtistId);

create table Employee
(
    EmployeeId integer     not null
        primary key,
    LastName   varchar(20) not null,
    FirstName  varchar(20) not null,
    Title      varchar(30) default NULL,
    ReportsTo  integer     default NULL
        references Employee (EmployeeId),
    BirthDate  datetime    default NULL,
    HireDate   datetime    default NULL,
    Address    varchar(70) default NULL,
    City       varchar(40) default NULL,
    State      varchar(40) default NULL,
    Country    varchar(40) default NULL,
    PostalCode varchar(10) default NULL,
    Phone      varchar(24) default NULL,
    Fax        varchar(24) default NULL,
    Email      varchar(60) default NULL
);

create table Customer
(
    CustomerId   integer     not null
        primary key,
    FirstName    varchar(40) not null,
    LastName     varchar(20) not null,
    Company      varchar(80) default NULL,
    Address      varchar(70) default NULL,
    City         varchar(40) default NULL,
    State        varchar(40) default NULL,
    Country      varchar(40) default NULL,
    PostalCode   varchar(10) default NULL,
    Phone        varchar(24) default NULL,
    Fax          varchar(24) default NULL,
    Email        varchar(60) not null,
    SupportRepId integer     default NULL
        references Employee (EmployeeId)
);

create index idx_Customer_IFK_CustomerSupportRepId
    on Customer (SupportRepId);

create index idx_Employee_IFK_EmployeeReportsTo
    on Employee (ReportsTo);

create table Genre
(
    GenreId integer not null
        primary key,
    Name    varchar(120) default NULL
);

create table Invoice
(
    InvoiceId         integer        not null
        primary key,
    CustomerId        integer        not null
        references Customer (CustomerId),
    InvoiceDate       datetime       not null,
    BillingAddress    varchar(70) default NULL,
    BillingCity       varchar(40) default NULL,
    BillingState      varchar(40) default NULL,
    BillingCountry    varchar(40) default NULL,
    BillingPostalCode varchar(10) default NULL,
    Total             decimal(10, 2) not null
);

create index idx_Invoice_IFK_InvoiceCustomerId
    on Invoice (CustomerId);

create table MediaType
(
    MediaTypeId integer not null
        primary key,
    Name        varchar(120) default NULL
);

create table Playlist
(
    PlaylistId integer not null
        primary key,
    Name       varchar(120) default NULL
);

create table Track
(
    TrackId      integer        not null
        primary key,
    Name         varchar(200)   not null,
    AlbumId      integer      default NULL
        references Album (AlbumId),
    MediaTypeId  integer        not null
        references MediaType (MediaTypeId),
    GenreId      integer      default NULL
        references Genre (GenreId),
    Composer     varchar(220) default NULL,
    Milliseconds integer        not null,
    Bytes        integer      default NULL,
    UnitPrice    decimal(10, 2) not null
);

create table InvoiceLine
(
    InvoiceLineId integer        not null
        primary key,
    InvoiceId     integer        not null
        references Invoice (InvoiceId),
    TrackId       integer        not null
        references Track (TrackId),
    UnitPrice     decimal(10, 2) not null,
    Quantity      integer        not null
);

create index idx_InvoiceLine_IFK_InvoiceLineInvoiceId
    on InvoiceLine (InvoiceId);

create index idx_InvoiceLine_IFK_InvoiceLineTrackId
    on InvoiceLine (TrackId);

create table PlaylistTrack
(
    PlaylistId integer not null
        references Playlist (PlaylistId),
    TrackId    integer not null
        references Track (TrackId),
    primary key (PlaylistId, TrackId)
);

create index idx_PlaylistTrack_IFK_PlaylistTrackTrackId
    on PlaylistTrack (TrackId);

create index idx_Track_IFK_TrackAlbumId
    on Track (AlbumId);

create index idx_Track_IFK_TrackGenreId
    on Track (GenreId);

create index idx_Track_IFK_TrackMediaTypeId
    on Track (MediaTypeId);

