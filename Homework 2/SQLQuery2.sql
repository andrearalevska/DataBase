SELECT *
FROM Student
WHERE FirstName = 'Antonio'

SELECT *
FROM Student
WHERE DateOfBirth > '1999-01-01'

SELECT *
FROM Student
WHERE LastName like 'J%' and  EnrolledDate >= '1998-01-01' and EnrolledDate <= '1998-01-31'

SELECT *
FROM Student
ORDER BY FirstName  

SELECT LastName
FROM Teacher
UNION
SELECT LastName
FROM Student

ALTER TABLE Student
ADD PRIMARY KEY (ID)

ALTER TABLE Teacher
ADD PRIMARY KEY (ID)

ALTER TABLE Grade
ADD PRIMARY KEY (ID)

ALTER TABLE Course
ADD PRIMARY KEY (ID)

ALTER TABLE GradeDetails
ADD PRIMARY KEY (ID)

ALTER TABLE AchievementType
ADD PRIMARY KEY (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentId) REFERENCES Student(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseId) REFERENCES Course(ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherId) REFERENCES Teacher(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeId) REFERENCES Grade(ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeId) REFERENCES AchievementType(ID)