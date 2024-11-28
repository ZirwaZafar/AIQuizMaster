-- Table to store users' progress
CREATE TABLE UserProgress (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_score INT DEFAULT 0,
    total_attempted INT DEFAULT 0
);

-- Table to store questions for different categories
CREATE TABLE Questions (
    question_id INT PRIMARY KEY,
    question_text TEXT,
    answer_1 VARCHAR(100),
    answer_2 VARCHAR(100),
    answer_3 VARCHAR(100),
    answer_4 VARCHAR(100),
    correct_answer INT,  -- store correct answer index (1-4)
    category VARCHAR(50)
);

-- Inserting example data into Questions table
INSERT INTO Questions (question_id, question_text, answer_1, answer_2, answer_3, answer_4, correct_answer, category)
VALUES
(1, 'What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 3, 'Geography'),
(2, 'Who wrote "Hamlet"?', 'Shakespeare', 'Dickens', 'Austen', 'Twain', 1, 'Literature'),
(3, 'What is 5 + 7?', '10', '11', '12', '13', 3, 'Math');

-- Inserting example data into UserProgress table
INSERT INTO UserProgress (user_id, user_name)
VALUES (1, 'Zriiii');

-- Query to get a random question from a specific category with randomized answers
SELECT question_text, 
       answer_1, answer_2, answer_3, answer_4
FROM Questions
WHERE category = 'Geography'
ORDER BY RANDOM()  -- randomly select question
LIMIT 1;

-- Query to update user score after answering a question
UPDATE UserProgress
SET total_score = total_score + 1, total_attempted = total_attempted + 1
WHERE user_id = 1;  -- update for user with ID 1

-- Query to get user progress
SELECT user_name, total_score, total_attempted
FROM UserProgress
WHERE user_id = 1;
