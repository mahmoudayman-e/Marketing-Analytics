# Omni-Channel Digital Marketing Performance & Customer Sentiment Analytics

## 📌 Project Overview
This repository showcases an advanced, enterprise-grade **End-to-End Customer Marketing Analytics & Sentiment Modeling** solution. The project demonstrates an elite multi-stage production data pipeline: utilizing **T-SQL (SQL Server)** for high-density database cleaning, window functions, and relational optimization, **Python (NLTK VADER)** for programmatic NLP sentiment classification, and **Power BI** for deploying an executive 4-page interactive tracking application.

The core business objective is to diagnose the end-to-end conversion funnel from marketing touchpoints to purchase fulfillment, isolate engagement channels, and translate qualitative customer feedback text into quantitative strategic metrics.

---

## 🛠️ Technical Toolkit & Skills Demonstrated
* **Database Engineering & ETL (T-SQL):** Formulated complex CTEs, analytical window functions (`ROW_NUMBER() OVER`), string splitting/extraction routines, handle missing values utilizing `COALESCE`, and metadata normalization (`UPPER`, `REPLACE`).
* **Natural Language Processing & AI (Python):** Integrated the `nltk.sentiment.vader` analyzer to programmatically evaluate customer feedback text, scoring compound polarities and structuring discrete behavioral buckets.
* **Business Intelligence (Power BI):** Engineered a responsive, 4-page cross-functional dashboard canvas (`Overview`, `Conversion Details`, `Social Media Details`, `Customer Review Details`).

---

## 🗄️ Phase 1: Relational Data Engineering & Validation (T-SQL)
Before downstream modeling, the raw operational schemas were cleaned, deduplicated, and unified using SQL Server scripts to establish total metric integrity.

```sql
-- Deduplicating Customer Journey records and handling duration nulls with baseline averages
WITH DuplicateRecords AS (
    SELECT JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration,
           ROW_NUMBER() OVER(PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action ORDER BY JourneyID) AS row_num
    FROM dbo.customer_journey
)
SELECT JourneyID, CustomerID, ProductID, VisitDate, UPPER(Stage) AS Stage, Action,
       COALESCE(Duration, AVG(Duration) OVER(PARTITION BY VisitDate)) AS Duration
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action ORDER BY JourneyID) AS row_num
    FROM dbo.customer_journey
) AS subquery WHERE row_num = 1;

-- Normalizing mixed engagement structures and parsing Views vs Clicks fields
SELECT EngagementID, ContentID, CampaignID, ProductID,
       UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType,
       LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
       RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
       Likes, FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate
FROM dbo.engagement_data WHERE ContentType != 'Newsletter';
```

---

## 🐍 Phase 2: NLP Text Sentiment Analysis (Python Pipeline)
To extract true operational feedback, a Python pipeline was engineered to process unstructured customer review text data fetched directly from the SQL staging schema, using VADER Lexicon analysis.
```python
import pandas as pd
from nltk.sentiment.vader import SentimentIntensityAnalyzer

# Fetch staging reviews and compute compound VADER sentiment polarities
sia = SentimentIntensityAnalyzer()
customer_reviews_df['SentimentScore'] = customer_reviews_df['ReviewText'].apply(lambda x: sia.polarity_scores(x)['compound'])

# Rule-based contextual labeling integrating score and numeric rating thresholds
def categorize_sentiment(score, rating):
    if score > 0.05 and rating >= 4: return 'Positive'
    elif score < -0.05 and rating <= 2: return 'Negative'
    else: return 'Neutral'

customer_reviews_df['SentimentCategory'] = customer_reviews_df.apply(lambda r: categorize_sentiment(r['SentimentScore'], r['Rating']), axis=1)
```

---

## 📊 Phase 3: Executive Reporting Architecture (Power BI Sheets)
The unified dataset feeds an interactive workspace across 4 comprehensive analytical modules:

1. **Executive Overview Page:** Consolidates macro-level operational metrics: Global **Conversion Rate (8.5%)**, Total Traffic (**2.98M Views**), **458K Clicks**, and Average Product Reviews (**3.67**). Tracks monthly engagement trajectories and volume distributions.
<img width="2820" height="1681" alt="Marketing Analytics-1" src="https://github.com/user-attachments/assets/a421bb30-f001-49ae-9f42-d3947c8478df" />
2. **Conversion Details Page:** Deep-dives into individual customer lifecycle stages (View -> Click -> Drop-off -> Purchase) mapped against seasonal heatmaps and product item purchase rates.
<img width="2820" height="1681" alt="Marketing Analytics-2" src="https://github.com/user-attachments/assets/658c79d2-a109-42f6-aa24-34c4ee37096a" />

3. **Social Media Engagement Page:** Evaluates content channel performance (Blog, Social Media, Video) against transactional metrics, filtering absolute reach trends across multiple calendar months.
<img width="2820" height="1681" alt="Marketing Analytics-3" src="https://github.com/user-attachments/assets/57116ea3-1739-49b5-825a-1473fde037a6" />
4. **Customer Review Details Page:** Bridges the qualitative gap by cross-filtering raw `ReviewText` strings directly against categorical classifications (`Positive`, `Neutral`, `Negative`) and product satisfaction matrices.
<img width="2820" height="1681" alt="Marketing Analytics-4" src="https://github.com/user-attachments/assets/80e78a5a-4872-46bb-8fda-64f36bea68e5" />


---

## 🚀 Execution Instructions
1. Execute the production initialization scripts located in the `sql/` directory to configure tables and schemas.
2. Run the `sentiment_analysis.ipynb` Python notebook to append the modeled NLP scores to your data frame.
3. Open the `.pbix` compiled visual map inside the `dashboard/` canvas using **Power BI Desktop** to navigate across campaign timelines.

