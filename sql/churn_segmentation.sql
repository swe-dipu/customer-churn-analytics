-- 1. Which State has the most churned customers? (simple GROUP BY + ORDER BY)
SELECT State,
       COUNT(*) AS churned_customers
FROM customers
WHERE Customer_Status = 'Churned'
GROUP BY State
ORDER BY churned_customers DESC;


-- 2. Average Monthly_Charge per Contract type, ranked highest to lowest
SELECT Contract,
       ROUND(AVG(Monthly_Charge), 2) AS avg_monthly_charge,
       COUNT(*) AS total_customers
FROM customers
GROUP BY Contract
ORDER BY avg_monthly_charge DESC;



-- 3. Total revenue generated per Payment_Method, ranked highest to lowest
SELECT Payment_Method,
       ROUND(SUM(Total_Revenue), 2) AS total_revenue,
       COUNT(*) AS total_customers
FROM customers
GROUP BY Payment_Method
ORDER BY total_revenue DESC;


-- 4. Average tenure of churned customers, grouped by Internet_Type
SELECT Internet_Type,
       ROUND(AVG(Tenure_in_Months), 1) AS avg_tenure_months,
       COUNT(*) AS churned_customers
FROM customers
WHERE Customer_Status = 'Churned'
GROUP BY Internet_Type
ORDER BY avg_tenure_months ASC;


-- 5. Number of referrals vs churn — grouped, sorted by group size
SELECT Number_of_Referrals,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY Number_of_Referrals
ORDER BY Number_of_Referrals ASC;