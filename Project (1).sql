USE CustomerChurnDB;
GO

-- Total customers
select count(*) AS total_customers
from cleaned_churn_data;


-- Churn count
select churn,
count(*) AS count
from cleaned_churn_data
group by churn;


-- Customers by gender
select gender,
count(*) as total_customers
from cleaned_churn_data
group by gender;


-- Customers by contract
select contract,
count(*) as total_customers
from cleaned_churn_data
group by contract
order by total_customers desc;


-- Internet service distribution
select InternetService,
count(*) AS Total_Customers
from cleaned_churn_data
group by InternetService
order by Total_Customers desc;


-- Churn rate
select (sum(case when churn = '1' then 1 else 0 end) * 100.0) / count(*) as churn_rate_percentage
from cleaned_churn_data;


-- Average charges
select AVG(monthlycharges) AS AVG_monthly_charges,
AVG(totalcharges) AS AVG_total_charges
from cleaned_churn_data;


-- Average tenure by churn
select churn,
avg(tenure) as average_tenure
from cleaned_churn_data
group by churn;


-- Gender vs churn
select gender,
churn,
count(*) AS count
from cleaned_churn_data
group by gender, churn;


-- Senior citizen vs churn
select SeniorCitizen,
churn,
count(*) AS count
from cleaned_churn_data
group by SeniorCitizen, churn;


-- Partner vs churn
select partner,
churn,
count(*) AS count
from cleaned_churn_data
group by partner, churn;


-- Dependents vs churn
select Dependents,
churn,
count(*) AS count
from cleaned_churn_data
group by Dependents, churn;


-- Contract vs churn
select contract,
churn,
count(*) AS count
from cleaned_churn_data
group by contract, churn;


-- Payment method vs churn
select PaymentMethod,
churn,
count(*) AS count
from cleaned_churn_data
group by PaymentMethod, churn;


-- Internet service vs churn

select InternetService,
churn,
count(*) AS count
from cleaned_churn_data
group by InternetService, churn
order by InternetService, churn;



-- Tech support vs churn
select TechSupport,
churn,
count(*) AS count
from cleaned_churn_data
group by TechSupport, churn;


-- Online security vs churn
select OnlineSecurity,
churn,
count(*) AS count
from cleaned_churn_data
group by OnlineSecurity, churn;


-- Average charges by churn
select churn,
AVG(MonthlyCharges) AS AVG_Monthly
from cleaned_churn_data
group by churn;


-- New churned customers
select count(*) AS New_Churned_Customers
from cleaned_churn_data
where tenure < 12
AND churn = '1';


-- High churn payment methods
select PaymentMethod,
count(*) AS churn_count
from cleaned_churn_data
where churn = '1'
group by PaymentMethod
HAVING count(*) > 200;


-- High charge churned customers
select customerID,
MonthlyCharges,
tenure
from cleaned_churn_data
where MonthlyCharges >
(
select AVG(MonthlyCharges)
from cleaned_churn_data
)
AND churn = '1';