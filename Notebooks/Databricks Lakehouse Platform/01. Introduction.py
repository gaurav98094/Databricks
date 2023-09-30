# Databricks notebook source
# MAGIC %md
# MAGIC # Introduction to Databricks

# COMMAND ----------

1 + 2 - 19093

# COMMAND ----------

!ls

# COMMAND ----------

# MAGIC %fs
# MAGIC ls

# COMMAND ----------

dbutils.help()

# COMMAND ----------

files = dbutils.fs.ls("/")
files

# COMMAND ----------

display(files)
