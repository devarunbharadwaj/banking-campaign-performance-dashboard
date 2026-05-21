-- ============================================
-- BANKING CAMPAIGN PERFORMANCE ANALYSIS
-- ============================================


-- Total Customers
SELECT 
    COUNT(*) AS total_customers
FROM bank;


-- Overall Conversion Rate
SELECT 
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report;


-- Average Account Balance
SELECT 
    ROUND(AVG(account_balance), 2) AS avg_account_balance
FROM final_banking_report;


-- Average Call Duration
SELECT 
    ROUND(AVG(call_duration), 2) AS avg_call_duration
FROM final_banking_report;


-- Monthly Conversion Trend
SELECT 
    contact_month,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY contact_month
ORDER BY conversion_rate DESC;


-- Conversion Rate by Balance Segment
SELECT 
    balance_segment,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY balance_segment
ORDER BY conversion_rate DESC;


-- Conversion Rate by Education Level
SELECT 
    education,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY education
ORDER BY conversion_rate DESC;


-- Conversion Rate by Marital Status
SELECT 
    marital_status,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY marital_status
ORDER BY conversion_rate DESC;


-- Conversion Rate by Personal Loan Status
SELECT 
    personal_loan,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY personal_loan
ORDER BY conversion_rate DESC;


-- Conversion Rate by Profession
SELECT 
    job,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY job
ORDER BY conversion_rate DESC;


-- Conversion Rate by Contact Channel
SELECT 
    contact_type,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY contact_type
ORDER BY conversion_rate DESC;


-- Impact of Contact Attempts on Conversion
SELECT 
    campaign_contacts,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY campaign_contacts
ORDER BY campaign_contacts;


-- Impact of Call Duration on Conversion
SELECT 
    call_duration,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY call_duration
ORDER BY call_duration;


-- Conversion Rate by Previous Campaign Outcome
SELECT 
    previous_outcome,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY previous_outcome
ORDER BY conversion_rate DESC;


-- Top Performing Customer Segments
SELECT 
    education,
    marital_status,
    balance_segment,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY education, marital_status, balance_segment
ORDER BY conversion_rate DESC
LIMIT 10;


-- Customers with High Balance and Successful Conversion
SELECT 
    age,
    job,
    account_balance,
    deposit_subscribed
FROM final_banking_report
WHERE account_balance > 5000
AND deposit_subscribed = 1
ORDER BY account_balance DESC;


-- Conversion Rate by Age Group
SELECT 
    CASE
        WHEN age < 30 THEN 'Young Adults'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    ROUND(AVG(deposit_subscribed) * 100, 2) AS conversion_rate
FROM final_banking_report
GROUP BY age_group
ORDER BY conversion_rate DESC;


-- Average Call Duration by Contact Channel
SELECT 
    contact_type,
    ROUND(AVG(call_duration), 2) AS avg_call_duration
FROM final_banking_report
GROUP BY contact_type
ORDER BY avg_call_duration DESC;
