CREATE TABLE Specialization(
  name VarChar(30) Primary Key
);

CREATE TABLE Students(
  id Integer Primary Key,
  name VarChar(30),
  native_language VarChar(30)
);

CREATE TABLE Courses(
  name VarChar(30) Primary Key,
  credits Integer
);

CREATE TABLE Takes(
  SpecName VarChar(30) REFERENCES Specialization(name),
  PersonID Integer REFERENCES Students(id)
);

CREATE TABLE Enroll(
  CourseName VarChar(30) REFERENCES Courses(name),
  PersonID Integer REFERENCES Students(id)
);

INSERT INTO Specialization VALUES("SD");
INSERT INTO Specialization VALUES("CS");
INSERT INTO Specialization VALUES("DS");
INSERT INTO Specialization VALUES("AAI");
INSERT INTO Specialization VALUES("Robotics");

INSERT INTO Students VALUES(1, "Sanya", "Finnish");
INSERT INTO Students VALUES(2, "Anton", "Ukrainian");
INSERT INTO Students VALUES(3, "Gera", "Turkish");
INSERT INTO Students VALUES(4, "Muhammadjon", "Tajik");
INSERT INTO Students VALUES(5, "Vlad", "Spain");
INSERT INTO Students VALUES(6, "Sergey", "Russian");
INSERT INTO Students VALUES(7, "Michael", "English");
INSERT INTO Students VALUES(8, "Vasya", "Russian");
INSERT INTO Students VALUES(9, "Petya", "Russian");
INSERT INTO Students VALUES(10, "Andrew", "Russian");
INSERT INTO Students VALUES(11, "Fedya", "English");
INSERT INTO Students VALUES(12, "Elina", "French");
INSERT INTO Students VALUES(13, "Daria", "Spain");

INSERT INTO Courses VALUES("Security systems", 1);
INSERT INTO Courses VALUES("ML", 1);
INSERT INTO Courses VALUES("Mechanics", 1);
INSERT INTO Courses VALUES("Statistical Techniques", 1);
INSERT INTO Courses VALUES("Software project", 1);

INSERT INTO Takes VALUES("AAI", 4);
INSERT INTO Takes VALUES("SD", 5);
INSERT INTO Takes VALUES("SD", 3);
INSERT INTO Takes VALUES("CS", 1);
INSERT INTO Takes VALUES("Robotics", 2);
INSERT INTO Takes VALUES("DS", 12);