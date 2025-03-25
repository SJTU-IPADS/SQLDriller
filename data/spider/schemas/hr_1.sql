CREATE TABLE `regions`
(
    `REGION_ID`   decimal(5, 0) NOT NULL,
    `REGION_NAME` varchar(25) DEFAULT NULL,
    PRIMARY KEY (`REGION_ID`)
);


CREATE TABLE `countries`
(
    `COUNTRY_ID`   varchar(2) NOT NULL,
    `COUNTRY_NAME` varchar(40)    DEFAULT NULL,
    `REGION_ID`    decimal(10, 0) DEFAULT NULL,
    PRIMARY KEY (`COUNTRY_ID`),
    FOREIGN KEY (`REGION_ID`) REFERENCES regions (`REGION_ID`)
);


CREATE TABLE `departments`
(
    `DEPARTMENT_ID`   decimal(4, 0) NOT NULL DEFAULT '0',
    `DEPARTMENT_NAME` varchar(30)   NOT NULL,
    `MANAGER_ID`      decimal(6, 0)          DEFAULT NULL,
    `LOCATION_ID`     decimal(4, 0)          DEFAULT NULL,
    PRIMARY KEY (`DEPARTMENT_ID`)
);


CREATE TABLE `jobs`
(
    `JOB_ID`     varchar(10) NOT NULL DEFAULT '',
    `JOB_TITLE`  varchar(35) NOT NULL,
    `MIN_SALARY` decimal(6, 0)        DEFAULT NULL,
    `MAX_SALARY` decimal(6, 0)        DEFAULT NULL,
    PRIMARY KEY (`JOB_ID`)
);


CREATE TABLE `employees`
(
    `EMPLOYEE_ID`    decimal(6, 0) NOT NULL DEFAULT '0',
    `FIRST_NAME`     varchar(20)            DEFAULT NULL,
    `LAST_NAME`      varchar(25)   NOT NULL,
    `EMAIL`          varchar(25)   NOT NULL,
    `PHONE_NUMBER`   varchar(20)            DEFAULT NULL,
    `HIRE_DATE`      date          NOT NULL,
    `JOB_ID`         varchar(10)   NOT NULL,
    `SALARY`         decimal(8, 2)          DEFAULT NULL,
    `COMMISSION_PCT` decimal(2, 2)          DEFAULT NULL,
    `MANAGER_ID`     decimal(6, 0)          DEFAULT NULL,
    `DEPARTMENT_ID`  decimal(4, 0)          DEFAULT NULL,
    PRIMARY KEY (`EMPLOYEE_ID`),
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES departments (`DEPARTMENT_ID`),
    FOREIGN KEY (`JOB_ID`) REFERENCES jobs (`JOB_ID`)
);


CREATE TABLE `job_history`
(
    `EMPLOYEE_ID`   decimal(6, 0) NOT NULL,
    `START_DATE`    date          NOT NULL,
    `END_DATE`      date          NOT NULL,
    `JOB_ID`        varchar(10)   NOT NULL,
    `DEPARTMENT_ID` decimal(4, 0) DEFAULT NULL,
    PRIMARY KEY (`EMPLOYEE_ID`, `START_DATE`),
    FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES employees (`EMPLOYEE_ID`),
    FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES departments (`DEPARTMENT_ID`),
    FOREIGN KEY (`JOB_ID`) REFERENCES jobs (`JOB_ID`)
);


CREATE TABLE `locations`
(
    `LOCATION_ID`    decimal(4, 0) NOT NULL DEFAULT '0',
    `STREET_ADDRESS` varchar(40)            DEFAULT NULL,
    `POSTAL_CODE`    varchar(12)            DEFAULT NULL,
    `CITY`           varchar(30)   NOT NULL,
    `STATE_PROVINCE` varchar(25)            DEFAULT NULL,
    `COUNTRY_ID`     varchar(2)             DEFAULT NULL,
    PRIMARY KEY (`LOCATION_ID`),
    FOREIGN KEY (`COUNTRY_ID`) REFERENCES countries (`COUNTRY_ID`)
);