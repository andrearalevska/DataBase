-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vv_StudentGrades
as
SELECT Grade.StudentId, COUNT(Grade.ID) as GradeCount
FROM Grade
group by Grade.StudentId
GO

SELECT *
FROM vv_StudentGrades
order by StudentId
GO

-- Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades
as
SELECT s.FirstName, s.LastName, COUNT(g.ID) as GradeCount
FROM Student s
INNER JOIN Grade g
on s.ID = g.StudentId
group by s.FirstName, s.LastName
GO

SELECT *
FROM vv_StudentGrades
GO

-- List all rows from view ordered by biggest Grade Count

SELECT *
FROM vv_StudentGrades
order by GradeCount desc

-- Declare scalar variable for storing FirstName values
-- Assign value ‘Antonio’ to the FirstName variable
-- Find all Students having FirstName same as the variable

DECLARE @FirstName NVARCHAR(100)

SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName
GO

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- Fill the table variable with all Female students

DECLARE @FemaleStudents TABLE (StudentId int not null, StudentName nvarchar(50), DateOfBirth date)

INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM Student
where Gender = 'F'

SELECT * 
FROM @FemaleStudents
GO

-- Declare temp table that will contain LastName and EnrolledDate columns
-- Fill the temp table with all Male students having First Name starting with ‘A’
-- Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #MaleStudents (LastName nvarchar(50), EnrolledDate date)

INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM STUDENT
where FirstName like 'A%' and Gender = 'M'

SELECT *
FROM #MaleStudents
where LEN(LastName) = 7
GO

-- Find all teachers whose FirstName length is less than 5 and
-- the first 3 characters of their FirstName and LastName are the same

SELECT FirstName, LastName
FROM Teacher
where LEFT(FirstName,3) = LEFT(LastName, 3) and LEN(FirstName) < 5