//
//  lastPage.swift
//  Quiz App
//
//  Created by StudentPM on 5/5/25.
//

import SwiftUI // Importing SwiftUI for UI support

struct lastPage: View { // Final screen showing results
    var score: Int // Accepts the score from the quiz

    var body: some View {
        Text("CONGRATULATIONS!") // Congratulatory message
        Text("you scored \(score)/20") // Displays final score out of 20
    }
}

#Preview {
    lastPage(score:8) // Previews results page with a sample score of 8
}
