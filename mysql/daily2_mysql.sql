use internship_prep;

create table demo_data(
patient_id INT PRIMARY KEY,
state VARCHAR(50),
age INT);

insert into demo_data(patient_id,state,age) values
(101,'kerala',45),
(102,"karnataka",52),
(103,"maharashtra",34),
(104,"kerala",28),
(105,"tamil nadu",61);


create table clinical_data(
patient_id int primary key,
hypertension_status int,
bmi decimal(4,1));

insert into clinical_data(patient_id,hypertension_status,bmi) values
(101,1,26.5),
(102,1,29.0),
(104,0,22.1),
(105,1,31.4);

show tables;
desc demo_data;
desc clinical_data;

select * from demo_data;
select * from clinical_data;

# Inner Join
select d.patient_id,d.state,d.age,c.hypertension_status
from demo_data d
inner join clinical_data c on d.patient_id = c.patient_id;

#left join
select d.patient_id,d.state,d.age,c.hypertension_status,c.bmi
from demo_data d 
left join clinical_data c
on d.patient_id=c.patient_id;

#replace NaN  to 0
select d.patient_id,
d.state,
COALESCE(c.hypertension_status,0) as hypertension_status,
c.bmi
from demo_data d
left join clinical_data c
on d.patient_id = c.patient_id;

#replace NaN  to 0
select 
d.patient_id,
d.state,
COALESCE(c.hypertension_status,0) as hypertension_status,
COALESCE(c.bmi,(select avg(bmi) from clinical_data))as bmi
from demo_data d
left join clinical_data c
on d.patient_id = c.patient_id;


#inner join where patient age more than 40
select d.patient_id,d.state,d.age,c.hypertension_status,c.bmi
from demo_data d
inner join clinical_data c 
on d.patient_id=c.patient_id
where d.age>=40;