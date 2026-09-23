show databases;

create database if not exists internship_prep;
show databases;

use internship_prep;

CREATE TABLE health_data (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
region VARCHAR(40),
patient_age INT,
hypertension_status INT,
bmi DECIMAL(4,2)
);

#insertion
INSERT into health_data (region,patient_age,hypertension_status,bmi)
VALUES
('kerala',25,1,27.67),
('tamilnadu',32,0,30.5),
('kerala',27,1,23.38),
('karnataka',23,1,20),
('tamilnadu',28,0,29.6)
;

select * from health_data;

#filtering

#only hypertension =1
select * from health_data WHERE hypertension_status=1;

#region = kerala & karnataka
select * from health_data where region in ('kerala','karnataka');


#average bmi 
select AVG(bmi) as bmi_avg from health_data ;

#average bmi of hypertension_status=1
select AVG(bmi) as average_bim from health_data where hypertension_status=1;


#grouping - count number of patients by region
select region,count(patient_id) as patient_count from health_data group by region;

#Filter the dataset to isolate only the patients from 'Kerala'.
select * from health_data where region="kerala";

#Calculate the mean (average) age of those specific patients.
select avg(patient_age) as average_age from health_data where region="kerala"
