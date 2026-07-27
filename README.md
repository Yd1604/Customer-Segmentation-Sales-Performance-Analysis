
# 📊 Customer Segmentation & Sales Performance Analysis

## 👋 About This Project

For this project, I wanted to go beyond simply analysing sales numbers and understand the **customers behind those numbers**.

I worked with an online retail transaction dataset and used **RFM (Recency, Frequency, Monetary) analysis** to answer questions such as:

- Who are the most valuable customers?
- Which customers purchase most frequently?
- Which customers haven't purchased recently?
- Where is most of the revenue coming from?
- Which customers could benefit from a retention campaign?

I built the project from start to finish using **Python, SQL, Google BigQuery and Tableau**, eventually turning the analysis into an interactive customer segmentation and sales performance dashboard.

---

## 🎯 What I Wanted to Find Out

My main goal was to understand both **sales performance and customer behaviour**.

I focused on:

- Identifying high-value and loyal customers
- Finding customers who may be at risk of leaving
- Understanding how frequently different customer groups purchase
- Exploring revenue trends across countries and products
- Turning the analysis into practical business recommendations

---

## 🛠️ Tools I Used

**Python & Pandas** — Data cleaning and preparation  
**Google Colab** — Python development 
**Google BigQuery & SQL** — Data exploration, RFM analysis and segmentation  
**Tableau** — Dashboard development and visualisation  
**GitHub** — Project documentation and version control

---

## 📂 The Dataset

The dataset contains online retail transactions, including:

- Invoice Number
- Product Description
- Quantity
- Invoice Date
- Unit Price
- Customer ID
- Country

Before starting the analysis, I created a new `TotalPrice` field:

`TotalPrice = Quantity × Unit Price`

This allowed me to calculate revenue at the transaction, customer, product and country level.

---

# 🔄 How I Built the Project

## 1️⃣ Cleaning the Data with Python

I started by loading the raw dataset into **Google Colab** and exploring it using Pandas.

Before moving into SQL, I cleaned the data by:

- Removing records with missing Customer IDs
- Correcting data types
- Removing cancelled transactions
- Removing invalid negative quantities and prices
- Removing duplicate records
- Creating the `TotalPrice` field
- Exporting the cleaned dataset for analysis

This gave me a cleaner and more reliable dataset to work with in BigQuery.

---

## 2️⃣ Exploring the Data with SQL

I uploaded the cleaned dataset into **Google BigQuery** and used SQL to understand the overall performance of the business.

I calculated:

- Total Revenue
- Total Customers
- Total Orders
- Monthly Revenue
- Revenue by Country
- Top Revenue-Generating Products

This gave me a good understanding of the business before moving into customer-level analysis.

---

## 3️⃣ Building the RFM Analysis

This was the main part of the project.

I calculated three metrics for every customer:

**Recency (R)** — How recently did the customer make a purchase?

**Frequency (F)** — How often does the customer place an order?

**Monetary (M)** — How much has the customer spent?

I then assigned customers R, F and M scores and used those scores to create meaningful customer groups.

---

## 👥 Customer Segments

The final segmentation included:

- 🏆 **Champions** — Recent, frequent and high-value customers
- 💙 **Loyal Customers** — Customers who purchase consistently
- 🌱 **Potential Loyalists** — Recent customers with potential to become loyal
- ✨ **New Customers** — Customers at the beginning of their relationship with the business
- ⚠️ **At Risk** — Previously valuable customers who haven't purchased recently
- 💤 **Lost Customers** — Customers with low recent activity and engagement
- 📦 **Others** — Customers who don't fall into the main RFM groups

This was particularly useful because it turned thousands of individual customer records into groups that could actually be used for business decisions.

---

## 4️⃣ Bringing Everything Together in Tableau

Once the SQL analysis was complete, I connected the results to **Tableau** and built an interactive dashboard.

### Business KPIs

- Total Revenue
- Total Customers
- Total Orders

### Sales Performance

- Monthly Revenue Trend
- Revenue by Country
- Top 10 Products

### Customer Behaviour

- Customers by Segment
- Revenue by Segment
- Average Customer Value
- Average Purchase Frequency
- Average Recency

---

## 📈 Dashboard Preview

<img width="3200" height="1800" alt="Dashboard" src="https://github.com/user-attachments/assets/1c571ac0-9e28-41b2-be6f-520efb1ecc07" />

---

## 💡 What I Found

A few findings stood out during the analysis:

- The business generated **£8.89M in revenue** from **4,338 customers** and **18,532 orders**.
- **Champion customers** generated the highest revenue and also purchased most frequently.
- Revenue increased throughout the year and reached its highest levels during the final quarter.
- The **United Kingdom** was by far the strongest market by revenue.
- A relatively small group of products accounted for a significant amount of sales.
- **At Risk and Lost Customers** represent an opportunity for targeted re-engagement and retention campaigns.

---

## 📌 What Could the Business Do With These Insights?

Based on the analysis, I would recommend:

- Rewarding **Champions and Loyal Customers** through loyalty programmes, exclusive offers or early access promotions.
- Creating personalised re-engagement campaigns for **At Risk customers**.
- Using top-performing products for bundles, recommendations and cross-selling opportunities.
- Exploring growth opportunities in promising markets outside the UK.
- Preparing inventory and marketing activity ahead of the stronger final-quarter sales period.

---

## 🚀 Skills I Practised

Through this project, I strengthened my experience in:

- Python & Pandas
- Data Cleaning
- Data Wrangling
- SQL
- Google BigQuery
- RFM Analysis
- Customer Segmentation
- Tableau
- KPI Development
- Dashboard Design
- Business Intelligence
- Data Visualisation
- Data Storytelling
- Translating analysis into business recommendations

---

## 💭 What I Took Away From This Project

What I enjoyed most about this project was seeing how the different tools could work together as part of one analytics workflow.

I started with a large transactional dataset in **Python**, cleaned and prepared it, moved the analysis into **BigQuery**, used **SQL and RFM analysis** to understand customer behaviour, and finally brought everything together in **Tableau**.

More importantly, the project helped me think beyond *"What does the data show?"* and focus more on *"What could a business actually do with this information?"*

That shift from analysing data to communicating **actionable insights** was one of my biggest takeaways from the project.
