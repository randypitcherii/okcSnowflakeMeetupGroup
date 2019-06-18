//=================================================================================
// setup security objects
//=================================================================================
USE ROLE SECURITYADMIN;

CREATE ROLE OKC_MEETUP_ROLE;

GRANT ROLE OKC_MEETUP_ROLE TO ROLE SYSADMIN;
GRANT ROLE OKC_MEETUP_ROLE TO USER <your username here>;
//=================================================================================


//=================================================================================
// setup snowflake objects
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