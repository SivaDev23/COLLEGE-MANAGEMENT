CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    EnrollmentYear INT,
    Major VARCHAR(100)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry');
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, EnrollmentYear, Major) VALUES
(1, 'John', 'Doe', '2001-06-15', 'M', 2020, 'Computer Science'),
(2, 'Jane', 'Smith', '2002-02-25', 'F', 2021, 'Physics');
INSERT INTO Faculty (FacultyID, FirstName, LastName, DepartmentID, Position) VALUES
(1, 'Dr. Alice', 'Johnson', 1, 'Professor'),
(2, 'Dr. Bob', 'Williams', 2, 'Assistant Professor');
INSERT INTO Courses (CourseID, CourseName, Credits, DepartmentID) VALUES
(1, 'Database Systems', 4, 1),
(2, 'Calculus I', 3, 2),
(3, 'Physics 101', 4, 3);
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 1, '2023-09-01'),
(2, 2, 3, '2023-09-01');
SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Database Systems';

SELECT f.FirstName, f.LastName, f.Position 
FROM Faculty f
JOIN Departments d ON f.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics';

SELECT c.CourseName 
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.StudentID = 1;

SELECT c.CourseName, COUNT(e.StudentID) AS NumberOfStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID;

SELECT f.FirstName, f.LastName 
FROM Faculty f
JOIN Courses c ON f.DepartmentID = c.DepartmentID
WHERE c.CourseName = 'Database Systems';

SELECT CourseName, Credits FROM Courses 
WHERE Semester = 'Fall 2024';
