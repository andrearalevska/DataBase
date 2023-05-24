-- List all possible combinations of Courses names and AchievementType names that can be passed by student

SELECT c.[Name] as CourseName, a.[Name] as AchievementTypeName 
FROM Course c
CROSS JOIN AchievementType a
order by c.[Name], a.[Name]

-- List all Teachers without exam Grade

SELECT t.FirstName, t.LastName
FROM Teacher t
LEFT JOIN Grade g
on t.ID = g.TeacherId
where g.Grade is null

-- Calculate the count of all grades per Teacher in the system

SELECT t.FirstName, t.LastName, COUNT(*) as NumberOfGrades
FROM Grade g
INNER JOIN Teacher t
on g.TeacherId = t.ID
group by t.FirstName, t.LastName 
order by NumberOfGrades desc

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName, t.LastName, COUNT(*) as NumberOfGrades
FROM Grade g
INNER JOIN Teacher t
on g.TeacherId = t.ID
where g.StudentId < 100
group by t.FirstName, t.LastName
order by NumberOfGrades desc

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT s.FirstName, s.LastName, MAX(g.Grade) as MaximalGrade, AVG(g.Grade) as AverageGrade
FROM Student s
INNER JOIN Grade g
on s.ID = g.StudentId
INNER JOIN GradeDetails gd
on g.ID = gd.GradeId
group by s.FirstName, s.LastName

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.FirstName, t.LastName, COUNT(g.ID) as NumberOfGrades
FROM Grade g
INNER JOIN Teacher t
on g.TeacherId = t.ID
group by t.FirstName, t.LastName
having COUNT(g.ID) > 200
order by NumberOfGrades desc

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT s.FirstName, s.LastName, COUNT(g.ID) as GradeCount, MAX(g.Grade) as MaximalGrade, AVG(g.Grade) as AverageGrade
FROM Student s
INNER JOIN Grade g
on s.ID = g.StudentId
group by s.FirstName, s.LastName
having MAX(g.Grade) = AVG(g.Grade)




