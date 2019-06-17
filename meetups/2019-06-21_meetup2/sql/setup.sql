//=================================================================================
// setup security objects
//=================================================================================
USE ROLE SECURITYADMIN;

// create roles
CREATE ROLE OKC_MEETUP_ROLE;
GRANT ROLE OKC_MEETUP_ROLE TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_ROLE TO USER <your username here>;
//=================================================================================


//=================================================================================
// setup top level objects
//=================================================================================
USE ROLE SYSADMIN;

CREATE DATABASE IF NOT EXISTS OKC_MEETUP_DB;

CREATE WAREHOUSE IF NOT EXISTS
  OKC_MEETUP_WH
  COMMENT='Warehouse for activity related to the okc snowflake meetup group'
  WAREHOUSE_SIZE=XSMALL
  AUTO_SUSPEND=60 // shut this bad boy down as fast as possible in between queries
  INITIALLY_SUSPENDED=TRUE;

// grant ownership to our okc role
GRANT OWNERSHIP ON DATABASE OKC_MEETUP_DB TO ROLE OKC_MEETUP_ROLE;
GRANT OWNERSHIP ON WAREHOUSE OKC_MEETUP_WH TO ROLE OKC_MEETUP_ROLE;
//=================================================================================


//=================================================================================
// create meetup resources
//=================================================================================
USE ROLE OKC_MEETUP_ROLE;
USE WAREHOUSE OKC_MEETUP_WH;

// build a home for our raw data
CREATE SCHEMA IF NOT EXISTS OKC_MEETUP_DB.RAW_DATASETS;

// create a file format definition for loading raw data later
CREATE FILE FORMAT 
  OKC_MEETUP_DB.RAW_DATASETS.CSV_WITH_HEADER_AND_TEXT_FIELDS 
  SKIP_HEADER = 1 
  FIELD_OPTIONALLY_ENCLOSED_BY = '\042';
//=================================================================================
