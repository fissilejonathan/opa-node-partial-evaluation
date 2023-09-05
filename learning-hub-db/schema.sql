CREATE DATABASE IF NOT EXISTS learning_hub;

USE learning_hub;



CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (username, email)
VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com'),
    ('user3', 'user3@example.com');



CREATE TABLE IF NOT EXISTS user_access (
    access_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    module_id INT,
    lesson_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id)
);

-- Grant user access to all modules and lessons in Course 1
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (1, 1, NULL, NULL);

-- Grant user access to all modules and lessons in Course 2
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (2, 2, NULL, NULL);

-- Grant user access to all modules and lessons in Course 1
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (3, 1, NULL, NULL);

-- Grant user access to all modules and lessons in Course 2
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (3, 2, NULL, NULL);

-- Grant user access to Module 2 and all its lessons in Course 1
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (4, 1, 2, NULL);

-- Grant user access to Lesson 3 in Module 1 of Course 2
INSERT INTO user_access (user_id, course_id, module_id, lesson_id)
VALUES (5, 2, 1, 3);



CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_description TEXT,
    start_date DATE,
    end_date DATE
);

INSERT INTO courses (course_name, course_description, start_date, end_date)
VALUES
    ('Introduction to Programming', 'Learn the basics of programming.', '2023-09-01', '2023-10-15'),
    ('Web Development Fundamentals', 'Explore the world of web development.', '2023-09-15', '2023-11-01');



CREATE TABLE IF NOT EXISTS modules (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    module_name VARCHAR(255) NOT NULL,
    module_description TEXT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO modules (module_name, module_description, course_id)
VALUES
    ('Module 1', 'Introduction to programming concepts.', 1),
    ('Module 2', 'Data structures and algorithms.', 1),
    ('Module 1', 'HTML and CSS basics.', 2),
    ('Module 2', 'JavaScript fundamentals.', 2);

    

CREATE TABLE IF NOT EXISTS lessons (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_title VARCHAR(255) NOT NULL,
    lesson_content TEXT,
    module_id INT,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

INSERT INTO lessons (lesson_title, lesson_content, module_id)
VALUES
    ('Getting Started with Programming', 'Introduction to programming languages.', 1),
    ('Variables and Data Types', 'Understanding data types in programming.', 1),
    ('Arrays and Loops', 'Working with arrays and loops.', 2),
    ('HTML Structure', 'Basic HTML document structure.', 3),
    ('CSS Styling', 'Introduction to CSS for styling web pages.', 3),
    ('JavaScript Variables', 'Declaring and using variables in JavaScript.', 4);
