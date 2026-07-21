import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv("data/Customer_Data.csv")


engine = create_engine("mysql+pymysql://root:root123@localhost:3306/churn_db")

df.to_sql("customers", engine, if_exists="replace", index=False)

print("Data loaded into churn_db.customers successfully.")