//=================================================================================
// drop top level objects
//=================================================================================
// Set context (this role inherits all owner roles in the sales heirarchy).
USE ROLE OKC_MEETUP_SALES_ADMIN; 

// delete each top level object
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
DROP ROLE IF EXISTS OKC_MEETUP_SALES_BI_OWNER;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_RAW_READ;
DROP ROLE IF EXISTS OKC_MEETUP_SALES_RAW_OWNER;

// delete users
DROP USER TONY_SOPRANO;
DROP USER OKC_MEETUP_SALES_ANALYTICS_SERVICE_ACCOUNT;
//=================================================================================
