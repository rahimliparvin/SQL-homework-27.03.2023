use Course

create database Course

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)

create table GroupStudents(
[Id]  int primary key identity(1,1),
)

alter table GroupStudents
add [GroupId] int foreign key references Groups(Id)

alter table GroupStudents
add [StudentId] int foreign key references Students(Id)



create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar(150),
[Birthday] date,
[Address] nvarchar(200),
[CityId] int foreign key references Cities(Id)
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CountryId] int foreign key references Countries(Id)
)

create table Staffmembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(150),
[Salary] decimal,
[CityId] int foreign key references Cities(Id)
)

create table RoleMembers(
[Id] int primary key identity(1,1),
[MemberId] int foreign key references Staffmembers(Id)
)

alter table RoleMembers
add [RoleId] int foreign key references Roles(Id)


create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int
)

create table GroupTeachers(
[Id] int primary key identity(1,1),
[TeacherId] int foreign key references Teachers(Id)
)

alter table GroupTeachers
add [GroupId] int foreign key references Groups(Id)



create table Teachers(
[Id]  int primary key identity(1,1),
[FullName] nvarchar(150),
[Email] nvarchar(200),
[Address]nvarchar(200),
[Salary] decimal,
[CityId] int foreign key references Cities(Id)
)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
)


create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[RoomId] int foreign key references Rooms(Id)
)

alter table Groups
add [EducationId] int foreign key references Educations(Id)

alter table Groups
add [WeekDaySeansId] int foreign key references WeekDaySeans(Id)



create table WeekDaySeans(
[Id] int primary key identity(1,1)
)

alter table WeekDaySeans
add [WeekDayId] int foreign key references WeekDays(Id)

alter table WeekDaySeans
add [SeansId] int foreign key references Seanses(Id)


create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(150),
[Duration] int
)

create table WeekDays(
[Id] int primary key identity(1,1),
[Name] nvarchar(25)
)

create table Seanses(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)