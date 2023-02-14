SELECT name FROM Students LIMIT 10;

SELECT name FROM Students WHERE native_language != "Russian";

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

SELECT Courses.name
FROM Courses
INNER JOIN Enroll ON Courses.name = Enroll.CourseName
INNER JOIN Students ON Enroll.PersonID = Students.id
WHERE Students.native_language = 'English';