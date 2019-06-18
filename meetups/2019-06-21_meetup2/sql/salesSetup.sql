//=================================================================================
// setup security entities
//=================================================================================
USE ROLE SECURITYADMIN;

// create business activity roles
CREATE ROLE OKC_MEETUP_SALES_ADMIN;
CREATE ROLE OKC_MEETUP_SALES_DATA_ENGINEER;
CREATE ROLE OKC_MEETUP_SALES_DATA_SCIENTIST;
CREATE ROLE OKC_MEETUP_SALES_BUS_ANALYST;

// create object access roles
CREATE ROLE OKC_MEETUP_SALES_BI_READ;
CREATE ROLE OKC_MEETUP_SALES_BI_ALL;
CREATE ROLE OKC_MEETUP_SALES_RAW_READ;
CREATE ROLE OKC_MEETUP_SALES_RAW_ALL;

// ASSIGN ALL ROLES TO SYSADMIN
GRANT ROLE OKC_MEETUP_SALES_ADMIN           TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_DATA_ENGINEER   TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_DATA_SCIENTIST  TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_BUS_ANALYST     TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_BI_READ         TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_BI_ALL          TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_RAW_READ        TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_SALES_RAW_ALL         TO ROLE SYSADMIN;

// build role heirarchy
GRANT ROLE OKC_MEETUP_SALES_DATA_ENGINEER   TO ROLE OKC_MEETUP_SALES_ADMIN;
GRANT ROLE OKC_MEETUP_SALES_DATA_SCIENTIST  TO ROLE OKC_MEETUP_SALES_ADMIN;
GRANT ROLE OKC_MEETUP_SALES_BUS_ANALYST     TO ROLE OKC_MEETUP_SALES_ADMIN;
GRANT ROLE OKC_MEETUP_SALES_BUS_ANALYST     TO ROLE OKC_MEETUP_SALES_DATA_ENGINEER;
GRANT ROLE OKC_MEETUP_SALES_BUS_ANALYST     TO ROLE OKC_MEETUP_SALES_DATA_SCIENTIST;

// grant object access roles to business activity roles
GRANT ROLE OKC_MEETUP_SALES_BI_READ   TO ROLE OKC_MEETUP_SALES_BUS_ANALYST;

GRANT ROLE OKC_MEETUP_SALES_BI_READ   TO ROLE OKC_MEETUP_SALES_DATA_SCIENTIST;
GRANT ROLE OKC_MEETUP_SALES_RAW_READ  TO ROLE OKC_MEETUP_SALES_DATA_SCIENTIST;

GRANT ROLE OKC_MEETUP_SALES_BI_ALL    TO ROLE OKC_MEETUP_SALES_DATA_ENGINEER;
GRANT ROLE OKC_MEETUP_SALES_RAW_ALL   TO ROLE OKC_MEETUP_SALES_DATA_ENGINEER;
//=================================================================================


//=================================================================================
// setup top level objects
//=================================================================================
USE ROLE SYSADMIN;

CREATE DATABASE IF NOT EXISTS OKC_MEETUP_SALES_DB;

// warehouse for data engineers
CREATE WAREHOUSE IF NOT EXISTS
  OKC_MEETUP_SALES_DEV_WH
  COMMENT='Warehouse for data engineering work in sales'
  WAREHOUSE_SIZE=MEDIUM
  AUTO_SUSPEND=60
  INITIALLY_SUSPENDED=TRUE;

CREATE WAREHOUSE IF NOT EXISTS
  OKC_MEETUP_SALES_DS_WH
  COMMENT='Warehouse for data science work in sales'
  WAREHOUSE_SIZE=MEDIUM
  AUTO_SUSPEND=60
  INITIALLY_SUSPENDED=TRUE;

CREATE WAREHOUSE IF NOT EXISTS
  OKC_MEETUP_SALES_BI_WH
  COMMENT='Warehouse for powering BI activities in sales'
  WAREHOUSE_SIZE=XSMALL
  AUTO_SUSPEND=60
  INITIALLY_SUSPENDED=TRUE;

// grant ownership of top level objects
GRANT OWNERSHIP ON DATABASE OKC_MEETUP_SALES_DB         TO ROLE OKC_MEETUP_SALES_ADMIN;
GRANT OWNERSHIP ON WAREHOUSE OKC_MEETUP_SALES_DEV_WH    TO ROLE OKC_MEETUP_SALES_DATA_ENGINEER;
GRANT OWNERSHIP ON WAREHOUSE OKC_MEETUP_SALES_BI_WH     TO ROLE OKC_MEETUP_SALES_DATA_ENGINEER; // our data engineers will own this
GRANT OWNERSHIP ON WAREHOUSE OKC_MEETUP_SALES_DS_WH     TO ROLE OKC_MEETUP_SALES_DATA_SCIENTIST;
//=================================================================================
