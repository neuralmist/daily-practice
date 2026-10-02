use internship_prep;

show tables;

create  table treatment_records(
record_id int auto_increment primary key,
district varchar(50),
gender char(1),
treatment_cost int,
recovery_days int
);

desc treatment_records;


insert into treatment_records
(district,gender,treatment_cost,recovery_days) values
('Udupi',"M",1200,5),
("Udupi","F",1500,6),
("Ernakulam","M",1300,5),
("Ernakulam",'F',1600,7),
("Udupi","M",1150,4),
("Ernakulam","M",1400,6);

select * from treatment_records;

#

select district,
sum(treatment_cost) as total_revenue,
avg(recovery_days) as avg_recovery
from treatment_records
group by district;

select gender,
sum(treatment_cost) as total_revenue,
avg(recovery_days) as avg_recovery
from treatment_records
group by gender;


#
select district,
avg(case when gender="M" then treatment_cost else null end) as avg_cost_male,
avg(case when gender="F" then treatment_cost else null end) as avg_cost_female
from treatment_records
group by district;

select gender,
max(case when gender="M" then recovery_days else null end) as max_recovery_Days_male,
max(case when gender="F" then recovery_days else null end) as max_recovery_days_female
from treatment_records
group by gender;