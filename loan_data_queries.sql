SELECT * FROM loan_data;

SELECT COUNT(id) FROM loan_data;

SELECT COUNT(id) AS total_loan_applications FROM loan_data;

SELECT COUNT(id) AS pmtd_applications FROM loan_data 
WHERE issue_date BETWEEN '2021-11-01' AND '2021-11-30';


SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data;

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE issue_date BETWEEN '2021-12-01' AND '2021-12-31';

SELECT SUM(total_amount) AS Total_Amount_Collected FROM loan_data;

SELECT SUM(total_amount) AS Total_Amount_Collected FROM loan_data
WHERE issue_date BETWEEN '2021-12-01' AND '2021-12-31';

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM loan_data;

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM loan_data;

SELECT COUNT(id) AS Good_Loan_Applications FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM loan_data;

--LOAN STATUS--
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_amount) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    loan_data
WHERE
    loan_status IS NOT NULL 
    AND total_amount IS NOT NULL 
    AND loan_amount IS NOT NULL 
    AND int_rate IS NOT NULL 
    AND dti IS NOT NULL 
GROUP BY
    loan_status;
	
--LOAN STATUS MTD--
SELECT 
	loan_status, 
	SUM(total_amount) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM loan_data
WHERE issue_date BETWEEN '2021-12-01' AND '2021-12-31'
GROUP BY loan_status;

-- MONTH REPORT--
SELECT 
    EXTRACT(MONTH FROM issue_date) AS Month_Number, 
    TO_CHAR(issue_date, 'Month') AS Month_Name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY EXTRACT(MONTH FROM issue_date), TO_CHAR(issue_date, 'Month')
ORDER BY Month_Number;

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY address_state
ORDER BY address_state;

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY term
ORDER BY term;

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length;

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY purpose
ORDER BY purpose;

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY home_ownership
ORDER BY home_ownership;

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY purpose
ORDER BY purpose;

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY home_ownership
ORDER BY home_ownership;

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;






