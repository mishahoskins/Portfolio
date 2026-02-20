# Program Name:  MSSQL_File Upload_Python.py
# Author:        Mikhail Hoskins
# Edits:
# Date Created:  02/09/2026
# Date Modified:
# Description:   Basic syntax for pulling files from specific location(s) and dropping them into my 
#                server. TRANSITION TO PYTHON.
#
# Inputs:       .
#
# Output:       none
# Notes:        may need tweaks but will test and adjust as needed.
#
#
#               Annotations are at # (between /* in SAS) to help guide.

# Installing required packages for SQL Server connection and data handling
import subprocess
import sys

subprocess.check_call([sys.executable, "-m", "pip", "install", "pandas", "pyodbc", "sqlalchemy"])

import pandas as pd
import pyodbc
import os
import re
from pathlib import Path
from sqlalchemy import create_engine

# Check available drivers
drivers = [driver for driver in pyodbc.drivers()]
print("Available ODBC Drivers:")
print(sorted(drivers))

# Connect to SQL Server
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=LAPTOP-PTVDVGSP\\SQL2025;'
    'DATABASE=Projects_Database;'
    'Trusted_Connection=yes;'
)

cursor = conn.cursor()

# Get list of CSV files
data_path = "C:/Data/Skills Test/Data"
files = list(Path(data_path).rglob("*.csv"))

print(f"Found {len(files)} files")
print(f"First few files: {files[:5]}")

# Creat path to SQL Server using SQLAlchemy
engine = create_engine(
        'mssql+pyodbc://LAPTOP-PTVDVGSP\\SQL2025/Projects_Database'
        '?driver=ODBC+Driver+17+for+SQL+Server'
        '&trusted_connection=yes'
    )

# Loop through files and upload
for f in files:
    # Create table name from filename
    tbl = f.stem  # Gets filename without extension
    tbl = re.sub(r'[^A-Za-z0-9_]', '_', tbl)  # Replace non-alphanumeric with underscore
    
    print(f"Loading: {f} -> {tbl}")
    
    # Read CSV
    df = pd.read_csv(f)  
    df.to_sql(
        name=tbl,
        con=engine,
        schema='dbo',
        if_exists='replace',  # 'replace' = overwrite, 'append' = add rows
        index=False
    )
    
    print(f"✓ Uploaded {tbl}")

# Close connection
conn.close()


# Query to see what tables exist in your database
query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo'"
result = pd.read_sql(query, engine)
result

# If everything is there, print success message
print("\nAll files uploaded successfully!\nfin.")