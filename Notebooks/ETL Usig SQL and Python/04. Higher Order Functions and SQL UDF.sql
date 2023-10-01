-- Databricks notebook source
-- MAGIC %md
-- MAGIC # filter

-- COMMAND ----------

SELECT * FROM orders

-- COMMAND ----------

SELECT
  order_id,
  books,
  FILTER (books, i -> i.quantity >= 2) AS multiple_copies
FROM orders

-- COMMAND ----------

SELECT order_id, multiple_copies
FROM (
  SELECT
    order_id,
    FILTER (books, i -> i.quantity >= 2) AS multiple_copies
  FROM orders)
WHERE size(multiple_copies) > 0;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # transform

-- COMMAND ----------

SELECT
  order_id,
  books,
  TRANSFORM (
    books,
    b -> CAST(b.subtotal * 0.8 AS INT)
  ) AS subtotal_after_discount
FROM orders;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # UDF

-- COMMAND ----------

CREATE OR REPLACE FUNCTION get_url(email STRING)
RETURNS STRING

RETURN concat("https://www.", split(email, "@")[1])

-- COMMAND ----------

SELECT email, get_url(email) domain
FROM customers

-- COMMAND ----------

DESCRIBE FUNCTION EXTENDED get_url

-- COMMAND ----------

-- Example 2
CREATE FUNCTION site_type(email STRING)
RETURNS STRING
RETURN CASE 
          WHEN email like "%.com" THEN "Commercial business"
          WHEN email like "%.org" THEN "Non-profits organization"
          WHEN email like "%.edu" THEN "Educational institution"
          ELSE concat("Unknow extenstion for domain: ", split(email, "@")[1])

-- COMMAND ----------

SELECT email, site_type(email) as domain_category
FROM customers

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### drop udf

-- COMMAND ----------

DROP FUNCTION get_url;
DROP FUNCTION site_type;
