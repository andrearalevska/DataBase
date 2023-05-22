CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE Student(
ID int identity(1,1) not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
DateOfBirth date not null,
EnrolledDate date not null,
Gender nchar(1) not null,
NationalIdNumber nvarchar(50) not null,
StudentCardNUmber nvarchar(50) not null
)

CREATE TABLE Teacher(
ID int identity(1,1) not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
DateOfBirth date null,
AcademicRank nvarchar(50) not null,
HireDate date not null
)

CREATE TABLE Grade(
ID int identity(1,1) not null,
StudentId int not null,
CourseId int not null,
TeacherId int not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate datetime not null
)

CREATE TABLE Course(
ID int identity(1,1) not null,
[Name] nvarchar(100) not null,
Credit int not null,
AcademicYear int not null,
Semester int not null
)

CREATE TABLE GradeDetails(
ID int identity(1,1) not null,
GradeId int not null,
AchievementTypeId int not null,
AchievementPoints int not null,
AchievementMaxPoints int not null,
AchievementDate datetime not null
)

CREATE TABLE AchievementType(
ID int identity(1,1) not null,
[Name] nvarchar(50) not null,
[Description] nvarchar(max) null,
ParticipationRate decimal not null
)