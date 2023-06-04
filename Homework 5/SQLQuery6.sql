CREATE PROCEDURE CreateGradeDetails
(
	@GradeId int,
	@AchievementTypeId int,
	@AchievementPoints int,
	@AchievementMaxPoints int,
	@AchievementDate datetime,
	@SumOfGradePoints int OUT
)
AS
BEGIN

UPDATE GradeDetails
SET AchievementPoints = @AchievementPoints, 
	AchievementMaxPoints = @AchievementMaxPoints,
	AchievementDate = @AchievementDate
WHERE GradeId = @GradeId and AchievementTypeId = @AchievementTypeId

SELECT @SumOfGradePoints = SUM((gd.AchievementPoints/gd.AchievementMaxPoints)*act.ParticipationRate)
FROM GradeDetails gd
inner join AchievementType act
on AchievementTypeId = act.ID
WHERE GradeId = @GradeId
END
GO

DECLARE @GradePoints int

EXEC CreateGradeDetails
	
	@GradeId = 2,
	@AchievementTypeId =2,
	@AchievementPoints = 50,
	@AchievementMaxPoints =100,
	@AchievementDate = '2020-06-22',
	@SumOfGradePoints = @GradePoints OUT

SELECT *
FROM GradeDetails
WHERE GradeId = 2 and AchievementTypeId = 2

SELECT @GradePoints
GO