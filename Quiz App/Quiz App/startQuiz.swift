//
//  startQuiz.swift
//  Quiz App
//
//  Created by StudentPM on 4/28/25.
//

import SwiftUI

// Define a struct for each quiz question
struct Question {
    let questionText: String
    let options: [String]
    let correctAnswer: String
}

struct startQuiz: View {
    @State private var currentQuestionIndex = 0 // Tracks which question is showing
    @State private var score = 0 // Tracks the player's score

    @State private var selectedIndex = -1 // Keeps track of the option the player clicked (-1 = none)
    @State private var showAnswerFeedback = false // Controls if the answer colors should be shown

    // All 20 quiz questions
    @State private var questions: [Question] = [
        Question(
            questionText: "Whats my name?",
            options: ["a) Julianna", "b) Juliana", "c) Yuliana", "d) Giulliana"],
            correctAnswer: "b) Juliana"
        ),
        Question(
            questionText: "How many pets fo I have?",
            options: ["a) 1", "b) 2", "c) 3", "d) 0"],
            correctAnswer: "b) 2"
        ),
        Question(
            questionText: "What kind of pets do I have?",
            options: ["a) birds", "b) dogs", "c) cats", "d) A paper towel"],
            correctAnswer: "c) cats"
        ),
        Question(
            questionText: "What month was I born?",
            options: ["a) July", "b) October", "c) March", "d) December"],
            correctAnswer: "c) March"
        ),
        Question(
            questionText: "Whats my zodiac sign?",
            options: ["a) Libra", "b) Piscis", "c) Capricorn", "d) sigma"],
            correctAnswer: "b)Piscis"
        ),
        Question(
            questionText: "What’s my biggest pet peeve?",
            options: ["a) heavy breathing ", "b) Evan asking to play ping pong", "c) chewing with mouth open", "d) sneezing"],
            correctAnswer: "b) Evan asking to play ping pong"
        ),
        Question(
            questionText: "Do i like Movies or TV shows more?",
            options: ["a) TV shows", "b) movies"],
            correctAnswer: "b) movies"
        ),
        Question(
            questionText: "Now riddles: What has one eye but can’t see?",
            options: ["a) A needle", "b) A blind cat", "c) A storm", "d) A pirate"],
            correctAnswer: "a) A needle"
        ),
        Question(
            questionText: "The more you remove from me, the bigger I get. What am I?",
            options: ["a) A pit", "b) A black hole", "c) A hole", "d) A secret"],
            correctAnswer: "c) A hole"
        ),
        Question(
            questionText: "What has a head and a tail but no body?",
            options: ["a) A snake", "b) A ghost", "c) A coin", "d) A comet"],
            correctAnswer: "c) A coin"
        ),
        Question(
            questionText: "What comes once in a minute, twice in a moment, but never in a thousand years?",
            options: ["a) The sun", "b) The letter M", "c) A blink", "d) A dream"],
            correctAnswer: "b) The letter M"
        ),
        Question(
            questionText: "What belongs to you but other people use it more than you do?",
            options: ["a) Your phone", "b) Your name", "c) Your stuff", "d) Your patience"],
            correctAnswer: "b) Your name"
        ),
        Question(
            questionText: "What has a face and two hands but no arms or legs?",
            options: ["a) A teddy bear", "b) A wall clock", "c) A drawing", "d) A puppet"],
            correctAnswer: "b) A wall clock"
        ),
        Question(
            questionText: "What runs, but never walks; has a bed, but never sleeps?",
            options: ["a) A waterfall", "b) A river", "c) A dream", "d) The internet"],
            correctAnswer: "b) A river"
        ),
        Question(
            questionText: "What breaks without being touched?",
            options: ["a) A mirror", "b) A promise", "c) A balloon", "d) Trust"],
            correctAnswer: "b) A promise"
        ),
        Question(
            questionText: "What has many keys but can’t open a single lock?",
            options: ["a) A piano", "b) A keyboard", "c) A janitor", "d) A treasure chest"],
            correctAnswer: "a) A piano"
        ),
        Question(
            questionText: "You see me once in June, twice in November, but not at all in May. What am I?",
            options: ["a) The moon", "b) The letter E", "c) Fireflies", "d) Clouds"],
            correctAnswer: "b) The letter E"
        ),
        Question(
            questionText: "I have legs but can’t walk. What am I?",
            options: ["a) A table", "b) A chair", "c) A spiderweb", "d) A robot vacuum"],
            correctAnswer: "a) A table"
        ),
        Question(
            questionText: "What kind of room has no doors or windows?",
            options: ["a) A panic room", "b) A locker", "c) A mushroom", "d) A vacuum"],
            correctAnswer: "c) A mushroom"
        ),
        Question(
            questionText: "The more you look at me, the less you see. What am I?",
            options: ["a) A shadow", "b) Fog", "c) Darkness", "d) A magic trick"],
            correctAnswer: "c) Darkness"
        ),
    ]

    var body: some View {
        NavigationView {
            let currentQuestion = questions[currentQuestionIndex] // Get the current question
            ZStack {
                Image("yellowWPP")
                    .resizable()
                    .frame(width: 780, height: 850)
                    .ignoresSafeArea()

                VStack {
                    // Show the score
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .shadow(radius: 0, x: 3, y: 4)
                        .padding()
                        .background(Color.indigo.opacity(1))

                    // Show the question
                    Text(currentQuestion.questionText)
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .shadow(color: .orange, radius: 0, x: 3, y: 4)
//                        .shadow(color: .pink, radius: 0, x: 4, y: 2)
                        .frame(width: 400)

                    // Show all the answer options
                    ForEach(0..<currentQuestion.options.count, id: \.self) { index in
                        let option = currentQuestion.options[index]
                        Button(action: {
                            // When a button is clicked:
                            selectedIndex = index // Mark this button as selected
                            showAnswerFeedback = true // Show green/red

                            // If the selected answer is correct, increase score
                            if option == currentQuestion.correctAnswer {
                                score += 1
                            }

                            // Wait 0.8 seconds, then go to next question
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                if currentQuestionIndex + 1 < questions.count {
                                    currentQuestionIndex += 1
                                    selectedIndex = -1 // Reset selection
                                    showAnswerFeedback = false
                                }
                            }
                        }) {
                            // Answer button view
                            Text(option)
                                .padding()
                                .background(buttonColor(option: option, index: index, correctAnswer: currentQuestion.correctAnswer))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .fontWeight(.semibold)
                                
                        }
                        .disabled(showAnswerFeedback) // Disable tap if already clicked
                    }

                    // Show "Finish Test" button on the last question
                    if currentQuestionIndex == 19 {
                        NavigationLink(destination: lastPage(score: score)) {
                            Text("Finish Test")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
    }

    // Function to choose button color depending on if it's the right or wrong answer
    func buttonColor(option: String, index: Int, correctAnswer: String) -> Color {
        if !showAnswerFeedback {
            return Color.cyan.opacity(0.7) // default color
        }

        if option == correctAnswer {
            return Color.green // correct answer is green
        } else {
            return Color.red // all incorrect answers turn red
        }
    }

}

#Preview {
    startQuiz()
}
