//=================================================================================
// Create users
//=================================================================================
USE ROLE SECURITYADMIN;

// create a human user
CREATE USER IF NOT EXISTS
  TONY_SOPRANO
  PASSWORD = 'Never had the makings of a varsity athlete.'
  DISPLAY_NAME = 'TONY SOPRANO'
  FIRST_NAME = 'TONY'
  LAST_NAME = 'SOPRANO'
  EMAIL = 'tony.soprano@baronesanitation.com'
  MUST_CHANGE_PASSWORD = TRUE;

// create a BI service account user
CREATE USER IF NOT EXISTS
  OKC_MEETUP_SALES_ANALYTICS_SERVICE_ACCOUNT
  PASSWORD = 'Use an actually good passphrase here, and do not actually use this one.'
  MUST_CHANGE_PASSWORD = FALSE
  DEFAULT_WAREHOUSE = 'OKC_MEETUP_SALES_BI_WH'
  DEFAULT_ROLE = 'OKC_MEETUP_SALES_BUS_ANALYST';
//=================================================================================