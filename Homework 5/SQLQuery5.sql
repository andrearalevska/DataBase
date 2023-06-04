CREATE PROCEDURE CreateGrade
(
	@StudentId int,
	@CourseId int,
	@TeacherId int,
	@Grade int,
	@CreatedDate datetime,
	@TotalNumberOfGrades int OUT,
	@MaxGradeOfGrades int OUT
)
AS
BEGIN

INSERT INTO Grade(StudentId, CourseId, TeacherId, Grade, CreatedDate)
VALUES (@StudentId, @CourseId, @TeacherId, @Grade, @CreatedDate)

SELECT @TotalNumberOfGrades = COUNT(*) 
FROM Grade
WHERE StudentId = @StudentId

SELECT @MaxGradeOfGrades = MAX(Grade)
FROM Grade 
WHERE StudentId = @StudentId and TeacherId = @TeacherId  

END
GO

DECLARE @NumberOfGrades int
DECLARE @MaxGrade int

EXEC CreateGrade

	@StudentId = 10,
	@CourseId = 3,
	@TeacherId = 7,
	@Grade = 6,
	@CreatedDate = '2020-03-03',
	@TotalNumberOfGrades = @NumberOfGrades OUT,
	@MaxGradeOfGrades = @MaxGrade OUT

SELECT @NumberOfGrades
SELECT @MaxGrade
GO

