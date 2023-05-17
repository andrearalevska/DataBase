CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE Students(
Id int identity(1,1) not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
DateOfBirth date not null,
EnrolledDate date not null,
Gender nchar(1) not null,
NationalIdNumber nvarchar(20) not null,
StudentCardNUmber nvarchar(10) not null
)

CREATE TABLE Teachers(
Id int identity(1,1) not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
DateOfBirth date null,
AcademicRank nvarchar(20) not null,
HireDate date not null
)

CREATE TABLE Grades(
Id int identity(1,1) not null,
StudentId int not null,
CourseId int not null,
TeacherId int not null,
Grade nchar(1) not null,
Comment nvarchar(max) null,
CreatedDate date not null
)

CREATE TABLE Courses(
Id int identity(1,1) not null,
CourseName nvarchar(20) not null,
Credit int not null,
AcademicYear date not null,
Semester int not null
)

CREATE TABLE GradeDetails(
Id int identity(1,1) not null,
GradeId int not null,
AchievementTypeId int not null,
AchievementPoints int not null,
AchievementMaxPoints int not null,
AchievementDate date not null
)

CREATE TABLE AchievementType(
Id int identity(1,1) not null,
[Name] nvarchar(50) not null,
[Description] nvarchar(max) null,
ParticipationRate decimal not null
)