# Customer-Segmentation-for-Personalized-Banking-Services
## Project Overview:
This project, conducted using a dataset containing over 1 million banking transactions, aimed to segment customers to enable Goldman Sachs to provide personalized banking services. The primary focus was to extract demographic and transactional insights using SQL, analyze spending habits using Python
## Data Cleaning:
- Handling date formats like '01-06-1994' consistently across all records.
-	Correcting year misinterpretations from Excel (e.g., 1957 becoming 2057).
-	Converting transaction amount to float and applying proper numeric formatting.
-	Removing nulls and irrelevant columns.
-	Creating derived columns like 'Age', 'AgeGroup'. 

Result: Cleaned dataset with 1,000,000+ rows and 9 essential fields.
## Exploratory Data Analysis (EDA):
Key EDA insights:- 
•	Highest transaction spend observed in the 31-40 age group: Rs.676.3 crore.
•	Top spending cities: Mumbai (Rs.174.7M), New Delhi (Rs.158.5M), Bangalore (Rs.117.5M).
•	Average transaction amount across top customers exceeds Rs.120,000.
•	Males and females show slightly different spending patterns and balances.
•	Transactions peak during business hours, notably during evening time.
Visuals were created using matplotlib and seaborn in Python.
## Business Impact:
•	This project delivers real business value by:- 
•	Identifying high-value customers for premium services. 
•	Detecting churn early (customers inactive for 60+ days).
•	Enabling targeted marketing by age, gender, and city segments.
•	Helping allocate resources to high-CLV customer groups.
These insights support strategic planning and retention initiatives.
## Conclusion:
With a comprehensive view of 1M+ records, this solution empowers Goldman Sachs to personalize offerings, reduce risk, and enhance customer retention using data-driven decision-making
