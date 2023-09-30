-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Managed Table

-- COMMAND ----------

CREATE TABLE managed_default
  (width INT, length INT, height INT);

-- COMMAND ----------

INSERT INTO managed_default
VALUES (3, 2, 1)

-- COMMAND ----------

DESCRIBE EXTENDED managed_default

-- COMMAND ----------

-- MAGIC %fs 
-- MAGIC ls dbfs:/user/hive/warehouse/managed_default

-- COMMAND ----------

DROP TABLE managed_default

-- COMMAND ----------

-- MAGIC %fs 
-- MAGIC ls dbfs:/user/hive/warehouse/managed_default

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## External Table

-- COMMAND ----------

CREATE TABLE external_default
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';

-- COMMAND ----------

INSERT INTO external_default
VALUES (3, 2 , 1)

-- COMMAND ----------

DESCRIBE EXTENDED external_default

-- COMMAND ----------

-- MAGIC %fs 
-- MAGIC ls dbfs:/mnt/demo/external_default

-- COMMAND ----------

drop table external_default

-- COMMAND ----------

-- MAGIC %fs 
-- MAGIC ls dbfs:/mnt/demo/external_default

-- COMMAND ----------

-- External DB
-- CREATE SCHEMA custom
-- LOCATION 'dbfs:/Shared/schemas/custom.db'

-- COMMAND ----------

CREATE TABLE ext
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';

-- COMMAND ----------

select * from ext

-- COMMAND ----------

drop table ext

-- COMMAND ----------


