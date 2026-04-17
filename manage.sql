
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);


INSERT INTO Departments VALUES
(1, 'CSE'),
(2, 'IT'),
(3, 'ECE');


INSERT INTO Students VALUES
(101, 'Amit', 1, 85),
(102, 'Rahul', 2, 78),
(103, 'Neha', 1, 92),
(104, 'Priya', 3, 88),
(105, 'Karan', 2, 81);


SELECT * FROM Students;

SELECT name, marks
FROM Students
WHERE marks > 80;

SELECT s.name, d.dept_name, s.marks
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id;

SELECT d.dept_name, AVG(s.marks) AS avg_marks
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT name, marks
FROM Students
ORDER BY marks DESC
LIMIT 1;

SELECT name, marks
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);
