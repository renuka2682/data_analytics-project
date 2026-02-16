USE customer;
#over all churn rate
SELECT 
ROUND(
COUNT(CASE WHEN Churn='Yes' THEN 1 END)*100.0/COUNT(*),2
) AS ChurnRate
FROM customer_churn_1000;
# churn by contract type
SELECT ContractType,
COUNT(*) AS Totalcustomer_churn_1000,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned
FROM customer_churn_1000
GROUP BY ContractType;
#High conplaint customers
SELECT NumberOfComplaints,
COUNT(*) AS Total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned
FROM customer_churn_1000
GROUP BY NumberOfComplaints
ORDER BY NumberOfComplaints DESC;
