USE education_schema;

INSERT INTO students (first_name, last_name, email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Michael', 'Johnson', 'michael.johnson@example.com');

INSERT INTO professors (first_name, last_name, email)
VALUES
    ('Professor', 'Anderson', 'prof.anderson@example.com'),
    ('Professor', 'Williams', 'prof.williams@example.com'),
    ('Professor', 'Brown', 'prof.brown@example.com');

INSERT INTO courses (course_name, course_code, credit_hours)
VALUES
    ('Mathematics 101', 'MATH101', 3),
    ('History 202', 'HIST202', 4),
    ('Computer Science 301', 'CS301', 3);

INSERT INTO grades (student_id, course_id, professor_id, grade)
VALUES
    (1, 1, 1, '93'),
    (1, 2, 2, '87'),
    (2, 1, 1, '91'),
    (2, 2, 2, '93'),
    (3, 3, 3, '84');

INSERT INTO grades (student_id, course_id, professor_id, grade)
VALUES
	(3, 1, 1, '94');


SELECT AVG(grade) as average_grade, COUNT(professor_id)
FROM grades
GROUP BY professor_id;

SELECT MAX(grade) as max_grade, COUNT(student_id)
FROM grades
GROUP BY student_id;

SELECT grade, course_id
FROM grades 
WHERE grade_average = (
	SELECT AVG(grade) as grade_average, COUNT(course_id) as course_id
	FROM grades
);
ORDER BY grade_average ASC;
