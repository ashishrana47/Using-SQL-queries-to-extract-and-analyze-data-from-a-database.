##Using SQL queries to extract and analyze data from a database.

## 🧾 Project Description  
This project demonstrates how to use **SQL for data analysis** by building and querying a **Bookstore database**.  
It includes schema creation, importing data from CSV files, and analytical queries to extract insights about books, customers, and orders.

## 🛠️ Technologies Used  

- **Database**: PostgreSQL  
- **Tools**: pgAdmin / psql CLI  
- **Data Format**: CSV  

## 📁 Repository Structure  

The project is logically organized into folders for easy navigation and reproducibility:

| Directory | Content | Purpose |
| **`data/`** | `TABLE 2 CSV FILE(orders).csv`, `TABLE 2 CSV FILE(Customers).csv`, `TABLE 2 CSV FILE(Books).csv` | **Raw Data Files** used for import into the database. |
| **`sql/`** |  `online book store.sql` | **SQL Scripts** for creating the database structure and running the analysis. |
| **`output/`** | `screenshots/` | Screenshots of the database schema and key query results (as required for the deliverable). |
| **`README.md`** | This file | Project documentation and interview question answers. |


## 📊 Dataset Overview

The analysis utilizes three interconnected tables:

| Table Name | Key Fields | Description | Relationship |

| **`Customers`** | `Customer_ID`, `Name`, `Country` | Customer demographics and location data. | **Primary Key** is `Customer_ID`. |
| **`Books`** | `Book_ID`, `Title`, `Author`, `Price` | Inventory details and pricing information. | **Primary Key** is `Book_ID`. |
| **`Orders`** | `Order_ID`, `Order_Date`, `Total_Amount` | Transactional data linking customers to purchased books. | Uses **Foreign Keys** (`Customer_ID`, `Book_ID`). |
