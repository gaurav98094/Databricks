-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Advanced Delta Lake Features
-- MAGIC - Time Travel
-- MAGIC - Compaction
-- MAGIC - Vaccum

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Time Travel

-- COMMAND ----------

describe history employees

-- COMMAND ----------

select * from employees version as of 1

-- COMMAND ----------

select * from employees@v3

-- COMMAND ----------

RESTORE TABLE employees TO VERSION AS OF 3

-- COMMAND ----------

select * from employees

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Optimize

-- COMMAND ----------

describe detail employees
-- NumOfFiles = 3

-- COMMAND ----------

optimize employees

-- COMMAND ----------

describe detail employees
-- NumOfFiles = 1

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Vaccum

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls dbfs:/user/hive/warehouse/employees
-- MAGIC
-- MAGIC -- But optimize code said only 1 data

-- COMMAND ----------

VACUUM employees RETAIN 0 HOURS

-- COMMAND ----------

-- Never do in production
SET spark.databricks.delta.retentionDurationCheck.enabled = false;
VACUUM employees RETAIN 0 HOURS

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls dbfs:/user/hive/warehouse/employees

-- COMMAND ----------

DROP TABLE employees
