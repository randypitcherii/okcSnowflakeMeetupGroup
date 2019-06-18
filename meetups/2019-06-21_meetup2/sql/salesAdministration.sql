//=================================================================================
// create snowflake objects
//=================================================================================
USE ROLE OKC_MEETUP_SALES_ADMIN;

// raw data schema
CREATE SCHEMA IF NOT EXISTS
  OKC_MEETUP_SALES_DB.RAW
  COMMENT='landing zone for raw sales data';

// bi schema
CREATE SCHEMA IF NOT EXISTS
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
// grant priveleges to object access roles
//=================================================================================
USE ROLE OKC_MEETUP_SALES_ADMIN;

// BI_READ role
GRANT USAGE ON DATABASE OKC_MEETUP_SALES_DB                       TO ROLE OKC_MEETUP_SALES_BI_READ;
GRANT USAGE ON SCHEMA OKC_MEETUP_SALES_DB.BI                      TO ROLE OKC_MEETUP_SALES_BI_READ;
GRANT SELECT ON ALL TABLES IN SCHEMA OKC_MEETUP_SALES_DB.BI       TO ROLE OKC_MEETUP_SALES_BI_READ;

// BI_OWNER role
GRANT USAGE ON DATABASE OKC_MEETUP_SALES_DB                       TO ROLE OKC_MEETUP_SALES_BI_OWNER;
GRANT OWNERSHIP ON SCHEMA OKC_MEETUP_SALES_DB.BI                  TO ROLE OKC_MEETUP_SALES_BI_OWNER COPY CURRENT GRANTS;
GRANT OWNERSHIP ON TABLE OKC_MEETUP_SALES_DB.BI.PURCHASE_ORDERS   TO ROLE OKC_MEETUP_SALES_BI_OWNER COPY CURRENT GRANTS;

// RAW_READ_READ role
GRANT USAGE ON DATABASE OKC_MEETUP_SALES_DB                       TO ROLE OKC_MEETUP_SALES_RAW_READ;
GRANT USAGE ON SCHEMA OKC_MEETUP_SALES_DB.RAW                     TO ROLE OKC_MEETUP_SALES_RAW_READ;
GRANT SELECT ON ALL TABLES IN SCHEMA OKC_MEETUP_SALES_DB.RAW      TO ROLE OKC_MEETUP_SALES_RAW_READ;

// RAW_OWNER role
GRANT USAGE ON DATABASE OKC_MEETUP_SALES_DB                       TO ROLE OKC_MEETUP_SALES_RAW_OWNER;
GRANT OWNERSHIP ON SCHEMA OKC_MEETUP_SALES_DB.RAW                 TO ROLE OKC_MEETUP_SALES_RAW_OWNER COPY CURRENT GRANTS;
GRANT OWNERSHIP ON TABLE OKC_MEETUP_SALES_DB.RAW.PURCHASE_ORDERS  TO ROLE OKC_MEETUP_SALES_RAW_OWNER COPY CURRENT GRANTS;
//=================================================================================