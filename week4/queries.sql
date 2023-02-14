Select name from Students limit 10;

Select name from Students Where native_language != "Russian";

SELECT name
FROM Students
WHERE id IN (
  SELECT PersonID
  FROM Takes
  WHERE SpecName = "Robotics"
);

SELECT Courses.name AS CourseName, Students.name AS StudentName
FROM Courses
JOIN Enroll ON Courses.name = Enroll.CourseName
JOIN Students ON Enroll.PersonID = Students.id
WHERE Courses.credits < 3;