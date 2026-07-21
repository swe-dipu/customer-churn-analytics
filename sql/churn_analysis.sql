-- 1. Overall churn rate (excluding brand-new 'Joined' customers)
SELECT
    ROUND(100.0 * SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END)
          / SUM(CASE WHEN Customer_Status IN ('Churned','Stayed') THEN 1 ELSE 0 END), 2) AS churn_rate_pct
FROM customers;


-- 2. Churn rate by Contract type
SELECT Contract,
       COUNT(*) AS total,
       SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END) AS churned,
       ROUND(100.0*SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END)/COUNT(*),2) AS churn_rate_pct
FROM customers
WHERE Customer_Status IN ('Churned','Stayed')
GROUP BY Contract
ORDER BY churn_rate_pct DESC;



-- 3. Revenue lost to churn
SELECT SUM(Total_Revenue) AS revenue_lost
FROM customers
WHERE Customer_Status = 'Churned';



-- 4. Top reasons customers churn
SELECT Churn_Category, COUNT(*) AS count
FROM customers
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Category
ORDER BY count DESC;




-- 5. Churn rate by Online Security status
SELECT Online_Security,
       COUNT(*) AS total,
       SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END) AS churned,
       ROUND(100.0*SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END)/COUNT(*),2) AS churn_rate_pct
FROM customers
WHERE Customer_Status IN ('Churned','Stayed')
GROUP BY Online_Security;