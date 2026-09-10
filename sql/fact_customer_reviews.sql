-- Query to clean whitespace issues in the ReviewText column
SELECT
    ReviewID, 
    CustomerID,
    ProductID, 
    Rating,
    ReviewDate,
    LTRIM(RTRIM(
        REPLACE(REPLACE(REPLACE(ReviewText, '   ', ' '), '  ', ' '), '  ', ' ')
    )) AS ReviewText
--INTO fact_customer_reviews
FROM dbo.customer_reviews;

