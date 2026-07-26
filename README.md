# Customer-Segmentation-Sales-Performance-Analysis

# 📊 Customer Segmentation & Sales Performance Analysis

## 📌 Project Overview

This project analyses retail transaction data to understand customer purchasing behaviour and overall sales performance using **RFM (Recency, Frequency, Monetary) Analysis**.

The workflow includes **data cleaning in Python**, **RFM segmentation using SQL in Google BigQuery**, and an **interactive Tableau dashboard** to identify high-value customer segments, monitor sales trends, and support data-driven business decisions.


## 🎯 Business Objective

The objective of this project is to:

- Analyse sales performance and customer purchasing behaviour.
- Segment customers using RFM analysis.
- Identify high-value and at-risk customer groups.
- Monitor revenue trends across products and countries.
- Provide actionable business insights to improve customer retention and revenue growth.


## 🛠️ Tools & Technologies

- Python (Google Colab)
- Pandas
- Google BigQuery (SQL)
- Tableau
- GitHub


## 📂 Dataset

The dataset contains online retail transactions with the following information:

- Invoice Number
- Product Description
- Quantity
- Invoice Date
- Unit Price
- Customer ID
- Country

A new **TotalPrice** field was created by multiplying Quantity and Unit Price.


## 🔄 Project Workflow

### 1. Data Cleaning (Python)

- Loaded the retail dataset into Google Colab.
- Removed missing Customer IDs.
- Converted data types.
- Removed cancelled orders.
- Removed negative quantities and prices.
- Removed duplicate transactions.
- Created a **TotalPrice** column.
- Exported the cleaned dataset.


### 2. SQL Analysis (Google BigQuery)

Performed SQL analysis to calculate:

- Total Revenue
- Total Customers
- Total Orders
- Revenue by Country
- Top Products
- Monthly Revenue Trends


### 3. RFM Analysis

Calculated customer:

- **Recency**
- **Frequency**
- **Monetary Value**

Generated RFM scores and classified customers into:

- Champions
- Loyal Customers
- Potential Loyalists
- New Customers
- At Risk
- Lost Customers
- Others


### 4. Tableau Dashboard

Created an interactive dashboard including:

#### KPI Cards
- Total Revenue
- Total Customers
- Total Orders

#### Sales Performance
- Monthly Revenue Trend
- Revenue by Country
- Top 10 Products

#### Customer Segmentation
- Customers by Segment
- Revenue by Segment
- Average Customer Value
- Average Purchase Frequency
- Average Recency


## 📈 Dashboard Preview


<img width="3200" height="1800" alt="Dashboard" src="https://github.com/user-attachments/assets/57b23321-f672-4ebf-8854-ecb4c6204f87" />





## 💡 Key Business Insights

- Generated **£8.89M** in revenue from **4,338 customers** and **18,532 orders**.
- Champion customers generated the highest revenue and purchase frequency.
- Revenue increased steadily throughout the year, peaking in the final quarter.
- The United Kingdom was the highest-performing market.
- A small number of products contributed a significant share of total revenue.
- At-risk and Lost Customers present opportunities for targeted retention campaigns.



## 📌 Business Recommendations

- Reward Champion and Loyal customers through loyalty programmes.
- Re-engage At Risk customers using personalised marketing campaigns.
- Promote top-selling products to maximise revenue.
- Expand marketing efforts in high-potential countries.
- Prepare inventory for peak sales periods.




## 🚀 Skills Demonstrated

- Python Data Cleaning
- Data Wrangling
- SQL (Google BigQuery)
- RFM Analysis
- Customer Segmentation
- Data Visualisation
- Tableau Dashboard Development
- Business Intelligence
- KPI Reporting
- Data Storytelling

---

## 📄 Conclusion

This project demonstrates an end-to-end analytics workflow, from data cleaning and SQL-based customer segmentation to interactive dashboard development. The analysis provides actionable insights into customer behaviour, sales performance, and business opportunities to support data-driven decision-making.
