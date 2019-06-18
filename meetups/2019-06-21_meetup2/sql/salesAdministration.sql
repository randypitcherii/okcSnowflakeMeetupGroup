//=================================================================================
// create snowflake objects
//=================================================================================
USE ROLE OKC_MEETUP_SALES_ADMIN;

// raw data schema
CREATE SCHEMA 
  OKC_MEETUP_SALES_DB.RAW
  COMMENT='landing zone for raw sales data';

// bi schema
CREATE SCHEMA 
  OKC_MEETUP_SALES_DB.BI
  COMMENT='consumption zone for clean sales data';

// raw purchase orders data
CREATE TABLE IF NOT EXISTS
  OKC_MEETUP_SALES_DB.RAW.PURCHASE_ORDERS (
    ORDER_DATA VARIANT
  )
  COMMENT='raw purchase order data in semistructured format from our point of sales system';

// cleaned purchase orders data
CREATE TABLE IF NOT EXISTS
  OKC_MEETUP_SALES_DB.BI.PURCHASE_ORDERS (
    BUYER_NAME STRING,
    PURCHASE_TIME DATETIME,
    PRICE DOUBLE,
    SALES_REGION STRING 
  )
  COMMENT='cleaned purchase order data in tabular format from our point of sales system';
//=================================================================================


//=================================================================================
// grant permissions
//=================================================================================
USE ROLE OKC_MEETUP_SALES_ADMIN;

// grant 
//=================================================================================