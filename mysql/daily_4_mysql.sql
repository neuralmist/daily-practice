use internship_prep;

create table hospital_admissions(
patient_id int primary key,
admission_date date,
diagnosis_code varchar(10));

insert into hospital_admissions(patient_id,admission_date,diagnosis_code) values
(301,'2025-11-15','A1'),
(302,'2026-01-05','B1'),
(303,'2026-03-22','A1'),
(304,'2025-12-10','C3'),
(305,'2026-06-18','B2');

select * from hospital_admissions;


#extract year and month
select patient_id , 
admission_date,
YEAR(admission_date) as admit_year,
month(admission_date) as admit_month
from hospital_admissions;

#filter patient admitted after 2025

select * from hospital_admissions where admission_date>="2026-01-01";

#only march

select * from hospital_admissions 
where admission_date>="2026-03-01"
and admission_date<="2026-03-31";

# find diagnosis = a1
select * from hospital_admissions where diagnosis_code="A1";

#sort by date latest
select * from hospital_admissions order by admission_date desc;



#select id 302-304
select * from hospital_admissions where patient_id between 302 and 304;


# return day of the week

select patient_id,admission_date,dayname(admission_date) as day_of_week
from hospital_admissions;



#change date format dd-mm-yyyy
select patient_id, date_format(admission_date,"%d-%m-%y") as date_
from hospital_admissions;


#days till today

select patient_id,
admission_date,
datediff(curdate(),admission_date) as days_since_admit
from hospital_admissions;



#total patient count
select count(patient_id) as number_of_patients
from hospital_admissions;
