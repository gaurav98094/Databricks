-- Databricks notebook source
-- MAGIC %fs
-- MAGIC ls dbfs:/mnt/demo/external_default/_delta_log/

-- COMMAND ----------

select * from json.`dbfs:/mnt/demo/external_default/_delta_log/00000000000000000000.json`

-- COMMAND ----------

select * from json.`dbfs:/mnt/demo/external_default/_delta_log/*.json`

-- COMMAND ----------

CREATE TEMP VIEW books_tmp_vw
   (book_id STRING, title STRING, author STRING, category STRING, price DOUBLE)
USING CSV
OPTIONS (
  path = "${dataset.bookstore}/books-csv/export_*.csv",
  header = "true",
  delimiter = ";"
);

-- COMMAND ----------

CREATE TABLE books AS
  SELECT * FROM books_tmp_vw;

-- COMMAND ----------


SELECT * FROM books;
