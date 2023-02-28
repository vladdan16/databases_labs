-- Exercise 2

DROP TABLE loan_books;
DROP TABLE teacher_courses;
DROP TABLE schools;
DROP TABLE books;

CREATE TABLE books
(
    book_id    SERIAL PRIMARY KEY,
    book_title VARCHAR(80),
    publisher  VARCHAR(30)
);

CREATE TABLE schools
(
    school_id SERIAL PRIMARY KEY,
    school    VARCHAR(80)
);

CREATE TABLE teacher_courses
(
    tc_id     SERIAL PRIMARY KEY,
    teacher   VARCHAR(30),
    course    VARCHAR(40),
    room      VARCHAR(30),
    grade     VARCHAR(30),
    loanDate  DATE,
    school_id INTEGER REFERENCES schools (school_id)
);

CREATE TABLE loan_books
(
    book_id INTEGER REFERENCES books (book_id),
    tc_id   INTEGER REFERENCES teacher_courses (tc_id),
    PRIMARY KEY (book_id, tc_id)
);

INSERT INTO schools (school)
VALUES ('Horizon Education Institute'),
       ('Bright Institution');

INSERT INTO books (book_title, publisher)
VALUES ('Learning and teaching in early childhood education', 'BOA Editions'),
       ('Preschool, N56', 'Taylor & Francis Publishing'),
       ('Early Childhood Education N9', 'Prentice Hall'),
       ('Know how to educate: guide for Parents and Teachers', 'McGraw Hill');

INSERT INTO teacher_courses (teacher, course, room, grade, loanDate, school_id)
VALUES ('Chad Russell', 'Logical Thinking', '1.A01', '1st grade', '2010-09-09', 1),
       ('Chad Russell', 'Writing', '1.A01', '1st grade', '2010-05-05', 1),
       ('Chad Russell', 'Numerical thinking', '1.A01', '1st grade', '2010-05-05', 1),
       ('E.F.Codd', 'Spatial, Temporal and Causal Thinking', '1.B01', '1st grade', '2010-05-06', 1),
       ('E.F.Codd', 'Numerical thinking', '1.B01', '1st grade', '2010-05-06', 1),
       ('Jones Smith', 'Writing', '1.A01', '2nd grade', '2010-09-09', 1),
       ('Jones Smith', 'English', '1.A01', '2nd grade', '2010-05-05', 1),
       ('Adam Baker', 'Logical Thinking', '2.B01', '1st grade', '2010-12-18', 2),
       ('Adam Baker', 'Numerical Thinking', '2.B01', '1st grade', '2010-05-06', 2);

INSERT INTO loan_books (book_id, tc_id)
VALUES (1, 1),
       (2, 2),
       (1, 3),
       (3, 4),
       (1, 5),
       (1, 6),
       (4, 7),
       (4, 8),
       (1, 9);

SELECT s.school, b.publisher, COUNT(*) as num_books
FROM loan_books lb
         JOIN teacher_courses tc ON lb.tc_id = tc.tc_id
         JOIN schools s ON tc.school_id = s.school_id
         JOIN books b ON lb.book_id = b.book_id
GROUP BY s.school, b.publisher
ORDER BY s.school, num_books DESC;

SELECT s.school, b.book_title, tc.teacher, tc.loanDate
FROM loan_books lb
         JOIN teacher_courses tc ON lb.tc_id = tc.tc_id
         JOIN schools s ON tc.school_id = s.school_id
         JOIN books b ON lb.book_id = b.book_id
WHERE (s.school, tc.loanDate) IN (SELECT s.school, MAX(tc.loanDate)
                                  FROM loan_books lb
                                           JOIN teacher_courses tc ON lb.tc_id = tc.tc_id
                                           JOIN schools s ON tc.school_id = s.school_id
                                  GROUP BY s.school)
ORDER BY s.school;
