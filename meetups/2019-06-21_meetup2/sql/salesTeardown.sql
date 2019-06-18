//=================================================================================
// drop top level objects
//=================================================================================
// delete each top level object
USE ROLE OKC_MEETUP_SALES_ADMIN; // this role inherits all owner roles in the sales heirarchy
DROP DATABASE IF EXISTS OKC_MEETUP_SALES_DB;
DROP WAREHOUSE IF EXISTS OKC_MEETUP_SALES_DEV_WH;
DROP WAREHOUSE IF EXISTS OKC_MEETUP_SALES_BI_WH;
DROP WAREHOUSE IF EXISTS OKC_MEETUP_SALES_DS_WH;
//=================================================================================


//=================================================================================
// delete security entities
//=================================================================================
USE ROLE SECURITYADMIN;

// delete business activity roles
DROP ROLE IF EXISTS OKC_MEETUP_SALES_ADMIN;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_DATA_ENGINEER;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_DATA_SCIENTIST;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_BUS_ANALYST;

// delete object access roles
DROP ROLE IF EXISTS OKC_MEETUP_SALES_BI_READ;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_BI_WRITE;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_RAW_READ;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_RAW_ALL;
//=================================================================================
