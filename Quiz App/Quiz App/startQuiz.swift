//
//  startQuiz.swift
//  Quiz App
//
//  Created by StudentPM on 4/28/25.
//

import SwiftUI

struct Question {
    let questionText: String
    let options: [String]
    let correctAnswer: String
}

struct startQuiz: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0

    @State private var questions: [Question] = [
        Question(
            questionText: "What has hands but can’t clap?",
            options: ["a) A mannequin", "b) A wall clock", "c) A scarecrow", "d) A broken robot"],
            correctAnswer: "b) A wall clock"
        ),
        
        Question(
            questionText: "The more you take, the more you leave behind. What am I?",
            options: ["a) Regrets", "b) Footsteps", "c) Time", "d) Secrets"],
            correctAnswer: "b) Footsteps"
        ),
        
        Question(
            questionText: "What gets wetter the more it dries?",
            options: ["a) A mop", "b) A sponge", "c) A towel", "d) A paper towel"],
            correctAnswer: "c) A towel"
        ),
        
        Question(
            questionText: "What can you catch but not throw?",
            options: ["a) Your breath", "b) Feelings", "c) A cold", "d) A virus"],
            correctAnswer: "c) A cold"
        ),
        
        Question(
            questionText: "I speak without a mouth and hear without ears. What am I?",
            options: ["a) A ghost", "b) An echo", "c) A whisper", "d) A breeze"],
            correctAnswer: "b) An echo"
        ),
        
        Question(
            questionText: "What can travel around the world while staying in one corner?",
            options: ["a) A compass", "b) A map", "c) A stamp", "d) A postcard"],
            correctAnswer: "c) A stamp"
        ),
        
        Question(
            questionText: "What has a neck but no head?",
            options: ["a) A hanger", "b) A bottle", "c) A vase", "d) A broom"],
            correctAnswer: "b) A bottle"
        ),
        
        Question(
            questionText: "What has one eye but can’t see?",
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
        NavigationView{
            let currentQuestion = questions[currentQuestionIndex]
            VStack{
                Text("Score: \(score)")
                Text(currentQuestion.questionText)
                
                ForEach(currentQuestion.options, id: \.self) { option in
                    Button(option) {
                        if option == currentQuestion.correctAnswer {
                            score += 1
                        }
                        if currentQuestionIndex + 1 < questions.count {
                            currentQuestionIndex += 1
                        }
                      
                    }
                }
                
                if currentQuestionIndex == 19{
                    NavigationLink(destination: lastPage(score: score)){
                        Text("Finish Test")
                        
                    }
                }
            }
        }
    }
}
        

#Preview {
    startQuiz()
}
