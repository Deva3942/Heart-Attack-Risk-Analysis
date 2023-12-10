-- Count the number of patients in the dataset?
select count(*) as "Total Patients" from dbo.heart_attack_data;

-- Find the average age of the patients?
select avg(age) as "Average Age" from dbo.heart_attack_data;

-- List the countries represented in the dataset and their respective counts?
select country, count(*) as "Patient Count" from dbo.heart_attack_data group by country;

-- Calculate the average BMI for male and female patients?
select sex, avg(bmi) as "Average BMI" from dbo.heart_attack_data group by sex;

-- Identify the patients with the highest and lowest cholesterol levels?
select top 1 with ties *
from dbo.heart_attack_data
order by cholesterol desc; -- For highest cholesterol

select top 1 with ties *
from dbo.heart_attack_data
order by cholesterol asc; -- For lowest cholesterol

-- Determine the number of patients from each continent?
select continent, count(*) as "Patient Count" from dbo.heart_attack_data group by continent;

-- Calculate the average stress level for patients who smoke and those who don't?
select smoking, avg("Stress Level") as "Average Stress Level" from dbo.heart_attack_data group by smoking;

-- Identify the age group with the highest number of patients?
select AgeGroup, count(*) as PatientCount from (select concat(floor(age / 10) * 10, ' - ', (floor(age / 10) * 10 + 9)) as AgeGroup
from dbo.heart_attack_data) as AgeGroups group by AgeGroup order by PatientCount desc;

-- Calculate the average heart rate for patients with and without previous heart problems?
select [previous heart problems], avg([heart rate]) as [Average Heart Rate] from dbo.heart_attack_data 
group by [previous heart problems];

-- Find the top 5 countries with the highest average BMI?
select top 5 country, avg(bmi) as "Average BMI" from dbo.heart_attack_data group by country order by "Average BMI" desc;

-- Calculate the average cholesterol levels for each level of alcohol consumption?
select [alcohol consumption], avg([Cholesterol]) as [Average Cholesterol] from dbo.heart_attack_data group by [Alcohol Consumption];

-- Identify the relationship between stress level and sedentary hours per day?
select [Stress Level], avg([Sedentary Hours Per Day]) as [Average Sedentary Hours] from dbo.heart_attack_data
group by [Stress Level] order by [Stress Level];

-- Find the distribution of patients based on their diet (healthy, average, unhealthy)?
select diet, count(*) as "Patient Count" from dbo.heart_attack_data group by diet;

-- Calculate the percentage of patients with a family history of heart-related problems?
select (count(case when [family history] = 1 then 1 end) * 100.0 / count(*)) as "Family History Percentage" from dbo.heart_attack_data;

-- Identify the correlation between income level and alcohol consumption?
select income, [alcohol consumption], count(*) as "Patient Count" from dbo.heart_attack_data group by income, [alcohol consumption];

-- Identify the age group with the highest average cholesterol levels?
select concat((floor(age / 10) * 10), ' - ', (floor(age / 10) * 10 + 9)) as AgeGroup, avg(cholesterol) as AverageCholesterol
from dbo.heart_attack_data group by floor(age / 10) order by AverageCholesterol desc;

-- Calculate the average heart rate for patients within specific BMI ranges?
select case
when bmi < 18.5 then 'Underweight'
when bmi >= 18.5 and bmi < 24.9 then 'Normal Weight'
when bmi >= 25 and bmi < 29.9 then 'Overweight'
else 'Obese'
end as "BMI Range",
avg([Heart Rate]) as "Average Heart Rate"
from dbo.heart_attack_data
group by case
when bmi < 18.5 then 'Underweight'
when bmi >= 18.5 and bmi < 24.9 then 'Normal Weight'
when bmi >= 25 and bmi < 29.9 then 'Overweight'
else 'Obese'
end;

--Identify countries with the highest and lowest occurrences of obesity?
select country, count(*) as "Patient Count", sum(obesity) as "Obese Patients Count", 
round(cast(sum(obesity) as float) / count(*) * 100, 2) as "Obesity Percentage" from dbo.heart_attack_data
group by country order by "Obesity Percentage" desc;

-- Calculate the average stress level for patients based on their exercise hours per week?
select [exercise hours per week], avg("stress level") as "Average Stress Level"
from dbo.heart_attack_data
group by [exercise hours per week]
order by [exercise hours per week];

-- Identify the correlation between triglyceride levels and cholesterol levels?
select triglycerides, avg(cholesterol) as "Average Cholesterol" from dbo.heart_attack_data group by triglycerides 
order by triglycerides;




































