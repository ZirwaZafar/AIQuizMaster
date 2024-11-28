const questions = [
    {
        question: "What is the capital of France?",
        options: ["Berlin", "Madrid", "Paris", "Rome"],
        correct: "Paris",
        explanation: "Paris is the capital and largest city of France."
    },
    {
        question: "Who wrote 'Harry Potter'?",
        options: ["J.R.R. Tolkien", "J.K. Rowling", "George R.R. Martin", "C.S. Lewis"],
        correct: "J.K. Rowling",
        explanation: "J.K. Rowling is the author of the Harry Potter series."
    }
];

let currentQuestion = 0;
let score = 0;

function loadQuestion() {
    const q = questions[currentQuestion];
    document.getElementById("question").textContent = q.question;
    document.getElementById("answer1").textContent = q.options[0];
    document.getElementById("answer2").textContent = q.options[1];
    document.getElementById("answer3").textContent = q.options[2];
    document.getElementById("answer4").textContent = q.options[3];
    document.getElementById("feedback").textContent = '';
}

function checkAnswer(selectedOption) {
    const q = questions[currentQuestion];
    if (q.options[selectedOption] === q.correct) {
        score++;
        document.getElementById("feedback").textContent = `Correct! ${q.explanation}`;
    } else {
        document.getElementById("feedback").textContent = `Wrong! ${q.explanation}`;
    }

    currentQuestion++;
    if (currentQuestion < questions.length) {
        setTimeout(loadQuestion, 2000);
    } else {
        setTimeout(displayLeaderboard, 2000);
    }
}

function displayLeaderboard() {
    alert(`Quiz Finished! Your score: ${score}`);
    // Display leaderboard (can be dynamic in the future)
    document.getElementById("leaders").innerHTML = `<li>Your Score:
