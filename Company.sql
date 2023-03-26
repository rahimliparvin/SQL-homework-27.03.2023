use Company

create database Company

create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Age] int,
[Salary] decimal,
[Position] nvarchar(100),
[CityId] int foreign key references Cities(Id),
[IsDeleted] int,
)

insert into Employees([Name],[Surname],[Age],[Salary],[Position],[CityId],[IsDeleted])
values('Cavid','Ismayilzade',22,2500,'Deputy Meneger',1,0),
      ('Elcan','Qurbanov',19,4000,'Meneger',1,0),
      ('Aqshin','Humbetov',27,3000,'Meneger',2,0),
	  ('Leyla','Alizade',21,500,'Reseption',3,1),
	  ('Aydan','Babayeva',20,550,'Reseption',3,0),
	  ('Murad','Veliyev',30,400,'Security',2,1),
	  ('Adil','Celalov',25,450,'Security',4,0)
	  

create table Cities(
[Id] int primary key Identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries(Id)
)

insert into Cities([Name],[CountryId])
values('Baki',1),
      ('Islamabad',3),
	  ('Istanbul',2),
	  ('Westhem',4)


create table Countries(
[Id] int primary key  identity(1,1),
[Name] nvarchar(100)
)

insert into Countries([Name])
values('Azerbaycan'),
      ('Turkiye'),
	  ('Pakistan'),
	  ('Ingiltere')

select *from Countries

select *from Cities

--SHERT1

select Employees.Id,Employees.Name,Employees.Surname,Employees.Age,Employees.Salary,Employees.Position,Cities.Name,Countries.Name from Employees
inner join Cities
on Cities.Id = Employees.CityId
inner join Countries
on Countries.Id = Cities.CountryId

--SHERT2

SELECT Employees.Name , Countries.Name from Employees 
inner join Cities
on Cities.Id = Employees.CityId
inner join Countries
on Countries.Id = Cities.CountryId
where Employees.Salary > 2000

--SHERT3

select Cities.Name,Countries.Name from Cities
inner join Countries
on Countries.Id = Cities.CountryId
 
 --SHERT4

 select Employees.Name,Employees.Surname,Employees.Age,Employees.Salary,Employees.Position,Employees.IsDeleted,Cities.Name,Countries.Name from Employees 
 inner join Cities
 on Cities.Id = Employees.CityId
 inner join Countries
 on Countries.Id = Cities.CountryId
 where Employees.Position = 'Reseption'


 --SHERT5

 select Employees.Name,Employees.Surname,Cities.Name,Countries.Name from Employees 
 inner join Cities
 on Cities.Id = Employees.CityId
 inner join Countries
 on Countries.Id = Cities.CountryId
 where Employees.IsDeleted = 1