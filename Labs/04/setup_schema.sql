CREATE TABLE department (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30)
);

CREATE TABLE faculty (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    salary NUMBER,
    joining_date DATE 
);

CREATE TABLE students (
    id NUMBER PRIMARY KEY,
    stdName VARCHAR2(30),
    email VARCHAR2(20),
    password VARCHAR2(20),
    age NUMBER,
    city VARCHAR2(20),
    salary NUMBER,
    dept_id NUMBER,
    f_id NUMBER,
    gpa NUMBER(3,1),
    fee NUMBER,
    CONSTRAINT fk_dept_id FOREIGN KEY (dept_id) REFERENCES department(id),
    CONSTRAINT fk_fac_id FOREIGN KEY (f_id) REFERENCES faculty(id)
);


CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(30),
    faculty_id NUMBER, 
    CONSTRAINT fk_course_faculty FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);


CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    CONSTRAINT fk_enroll_student FOREIGN KEY (student_id) REFERENCES students(id),
    CONSTRAINT fk_enroll_course FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE Retired_Faculty (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    joining_date DATE
);


CREATE TABLE Unassigned_Faculty (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30)
);
