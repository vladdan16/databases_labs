-- Exercise 2

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    book_title VARCHAR(50),
    publisher VARCHAR(15)
);

CREATE TABLE schools (
    school_id SERIAL PRIMARY KEY,
    school VARCHAR(50)
);

CREATE TABLE teacher_courses (
    tc_id SERIAL PRIMARY KEY,
    teacher VARCHAR(30),
    course VARCHAR(40),
    room VARCHAR(10),
    grade VARCHAR(15),
    loanDate DATE,
    school_id INTEGER REFERENCES schools(school_id)
);

CREATE TABLE loan_books (
    book_id INTEGER REFERENCES books(book_id),
    tc_id INTEGER REFERENCES teacher_courses(tc_id),
    PRIMARY KEY (book_id, tc_id)
);