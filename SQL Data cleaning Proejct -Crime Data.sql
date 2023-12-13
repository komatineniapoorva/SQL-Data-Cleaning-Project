use Project
--Retreiving the data
select * from [Crime Dataa]

--Changing the data types of the columns
alter table [Crime Dataa] alter column reporteddate date
alter table [Crime Dataa] alter column reportnumber int not null 
alter table [Crime Dataa] alter column  dateofcrime date
alter table [Crime Dataa] alter column  timeofcrime datetime

--Adding primary key 
alter table [Crime Dataa] add constraint pk_reportnumber primary key (reportnumber)

--Intial Exploration to check the columns and replacing column values to represent the crime premises properly
select distinct(status) from [Crime Dataa]
select premisDesc,premiscd from [Crime Dataa]
where premisDesc like '%APARTMENT%' or
premisDesc like '%CONDOMINIUM%' OR
 premisDesc like '%DUPLEX%' OR
  premisDesc like '%HOUSE%' OR
  premisDesc like '%RESIDENCE%'

select premisDesc,premiscd from [Crime Dataa]
where premisDesc like '%PARKING%' or
premisDesc like '%SIDEWALK%' OR
 premisDesc like '%PREMISE%' OR
  premisDesc like '%VEHICLE%' OR
  premisDesc like '%GARAGE%'

select premisDesc,premiscd from [Crime Dataa]
where premisDesc like '%LIBRARY%' or
premisDesc like '%SHOP%' OR
 premisDesc like '%STATION%' OR
  premisDesc like '%STORE%' OR
  premisDesc like '%GARAGE%' OR
  premisDesc like '%CLUB%' OR
 premisDesc like '%RESTAURANT%' OR
  premisDesc like '%BUSINESS%' 

select distinct premisDesc,premiscd from [Crime Dataa]
where premisDesc in ('%APARTMENT%' , 
'%CONDOMINIUM%',
'%DUPLEX%' ,
'%HOUSE%' , 
'%RESIDENCE%')
Group by  premisdesc

select count(Premiscd) from [Crime Dataa] where premisDesc like '%STREET%'

select count(distinct premiscd) from [Crime Dataa]

--Updating the column by using group by 
update [Crime Dataa] set premisDesc='101-Street' where premisDesc like '%STREET%' 
update [Crime Dataa] set premisDesc='503-Hotel' where premisDesc like '%HOTEL%' 
update [Crime Dataa] set premisDesc='704-School' where premisDesc like '%SCHOOL%' 
update [Crime Dataa] set premisDesc='502-House' where premisDesc like '%APARTMENT%' or
premisDesc like '%CONDOMINIUM%' OR
 premisDesc like '%DUPLEX%' OR
  premisDesc like '%HOUSE%' OR
  premisDesc like '%RESIDENCE%' 

update [Crime Dataa] set premisDesc='404-Publicplaces' where premisDesc like '%LIBRARY%' or
premisDesc like '%SHOP%' OR
 premisDesc like '%STATION%' OR
  premisDesc like '%STORE%' OR
  premisDesc like '%GARAGE%' OR
  premisDesc like '%CLUB%' OR
 premisDesc like '%RESTAURANT%' OR
  premisDesc like '%BUSINESS%' 

update [Crime Dataa] set premisDesc='102-ParkingArea' where premisDesc like '%PARKING%' or
premisDesc like '%SIDEWALK%' OR
 premisDesc like '%PREMISE%' OR
  premisDesc like '%VEHICLE%' OR
  premisDesc like '%GARAGE%'

update [Crime Dataa] set premisDesc='205-Other'where  premisDesc not in 
('101-Street','503-Hotel','704-School','502-House','404-Publicplaces','102-ParkingArea' )

select distinct premisdesc,count(premisdesc) from [Crime Dataa]
group by premisdesc

--Updating Crime category column with proper representation 
SELECT distinct(CrimeCategory) FROM [Crime Dataa]
UPDATE [Crime Dataa] SET CrimeCategory = 'Robbery' WHERE CrimeCategory = 1
UPDATE [Crime Dataa] SET CrimeCategory = 'Murder' WHERE CrimeCategory = 2
SELECT distinct(CrimeCategory) FROM [Crime Dataa]


--Updating Sex column
SELECT distinct(VictSex) FROM [Crime Dataa]
UPDATE [Crime Dataa] SET VictSex = 'Male' WHERE VictSex = 'M'
UPDATE [Crime Dataa] SET VictSex = 'Female' WHERE VictSex = 'F'
UPDATE [Crime Dataa] SET VictSex = 'Others' WHERE VictSex Not IN ('Male', 'Female')
SELECT distinct(VictSex) FROM [Crime Dataa]


--Other Analysis 
SELECT Distinct(AreaName)] From [Crime Dataa] GROUP BY AreaName
SELECT * FROM [Crime Dataa] WHERE VictAge < 0





