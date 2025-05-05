# 📊 Customer Insights SQL Queries

This repository contains a collection of SQL queries designed to explore and analyze customer data from a sample database. The queries address various business and data analysis needs, ranging from demographic segmentation to telecom operator breakdowns.

---

## 🗂️ Contents

The file includes the following SQL operations:

### 🔍 Filtering and Searching
- **[Q2]** Customers whose names start with 'A'.
- **[Q3]** Customers born between 1990 and 1995.
- **[Q11]** Customers who live in Istanbul but **not** in Kadıköy district.

### 🔗 Joins & Subqueries
- **[Q4]** Customers living in Istanbul using `JOIN`.
- **[Q5]** Same as Q4 using a subquery.

### 📈 Aggregations & Grouping
- **[Q6]** Number of customers per city.
- **[Q7]** Cities with more than 10 customers (sorted descending).
- **[Q8]** Number of male and female customers per city.
- **[Q14]** Most populated district (by customers) in each city.

### 🧠 Data Enrichment
- **[Q9]** Adding a new `AGEGROUP` column.
- **[Q10]** Updating `AGEGROUP` based on age ranges.

### 📞 Telecom Analysis
- **[Q12]** Extract operator codes from phone numbers.
- **[Q13]** Classify customers by operator (X, Y, Z) and count them.

### 📅 Date Functions
- **[Q15]** Day of the week of each customer's birthdate.

