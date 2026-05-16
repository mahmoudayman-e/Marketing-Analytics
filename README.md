📊 Marketing Analytics Project – Customer Sentiment Analysis & Dashboard

<img width="2820" height="1681" alt="Marketing Analytics-1" src="https://github.com/user-attachments/assets/13d8325f-0fd1-47ed-9c6b-567fe959e3be" />
<img width="2820" height="1681" alt="Marketing Analytics-2" src="https://github.com/user-attachments/assets/27759a63-6574-4740-9939-29ac28ddbd3c" />
<img width="2820" height="1681" alt="Marketing Analytics-3" src="https://github.com/user-attachments/assets/b10df434-e259-4492-8023-d614b0f6ddd2" />
<img width="2820" height="1681" alt="Marketing Analytics-4" src="https://github.com/user-attachments/assets/3a048894-0def-4ef3-af9d-e71fab1f54c6" />


🔍 Overview

This project focuses on marketing analytics and customer sentiment analysis to extract insights from customer reviews.
Using Python, customer feedback is explored, cleaned, and enriched with sentiment scores.
The sentiment-enriched data is exported to a CSV file, analyzed using SQL Server, and visualized through an interactive Power BI dashboard.

📁 Dataset

Marketing dataset containing customer reviews and related attributes

Format: CSV

Data includes unstructured text used for sentiment analysis

Output: sentiment-enriched CSV generated from Python

🛠 Tools & Technologies

Python (Pandas, NumPy, NLTK / TextBlob / VADER)

SQL Server

SQL Server Management Studio (SSMS)

Power BI

Jupyter Notebook

🔄 Project Workflow

Load customer reviews dataset in Python

Perform Exploratory Data Analysis (EDA)

Clean and preprocess text and structured data

Apply sentiment analysis on customer reviews

Generate sentiment scores and labels

Export enriched data to a CSV file

Load the CSV file into SQL Server

Run SQL queries for marketing insights

Build a Power BI dashboard

🧹 Data Cleaning & Sentiment Enrichment

Handling missing and duplicate values

Standardizing column formats

Cleaning text data (lowercasing, removing punctuation and stopwords)

Applying sentiment analysis to classify reviews as:

Positive

Neutral

Negative

Adding sentiment score and sentiment label columns

Saving the final enriched dataset as a CSV file

🗂 Python Script

File: customer_reviews_enrichment.ipynb

Responsibilities:

Data loading and EDA

Data cleaning and preprocessing

Sentiment analysis on customer reviews

Exporting sentiment-enriched data to CSV

🗄 SQL Analysis

Imported the sentiment-enriched CSV file into SQL Server

Executed SQL queries to:

Analyze sentiment distribution

Segment customers by sentiment

Identify trends and key marketing metrics

Prepared clean datasets for reporting

📈 Power BI Dashboard

The Power BI dashboard is built using data from SQL Server and includes:

Overall sentiment distribution

Marketing KPIs

Sentiment trends and comparisons

Interactive filters for analysis by category, time, or sentiment

📌 Results & Insights

Identified key customer sentiment patterns

Highlighted drivers of negative and positive feedback

Supported marketing decision-making using sentiment data

Delivered insights through a clear and interactive dashboard

▶️ How to Run the Project

Clone the repository from GitHub

Open and run customer_reviews_enrichment.ipynb

Generate the sentiment-enriched CSV file

Import the CSV file into SQL Server

Execute the SQL queries

Open the Power BI (.pbix) file to explore the dashboard

👤 Author

Mahmoud Ayman
Marketing Analytics | Python • SQL • Power BI
