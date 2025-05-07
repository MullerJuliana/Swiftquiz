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
        ZStack {
            Image("Image") // Background image
                .resizable()
                .frame(width: 1280, height: 853)
                .ignoresSafeArea()
            
            VStack(spacing: 20) { // Main vertical stack with spacing
                Text("CONGRATULATIONS!")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green.opacity(1))
                    .cornerRadius(5)
                
                Text("you scored:") // Displays final score label
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .shadow(radius: 1)
                    .shadow(color:.black, radius: 5, x:0, y: 4)
                
                Text("\(score)/20") // Shows score result
                    .padding()
                    .frame(width: 100)
                    .background(Color.orange.opacity(0.9))
                    .foregroundColor(.white)
                    .font(.title2)
//                    .fontWeight(.semibold)
                    .shadow(color:.pink, radius: 8, x:0, y: 5)
                    .offset(y: 10) // Move text downward

                // ✅ Restart button using NavigationLink
                NavigationLink(destination: ContentView()) {
                    Text("Start Again") // Button text
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .shadow(color:.purple, radius: 4, x:0, y: 5)
                        .font(.system(size: 26))
                        .fontWeight(.semibold)
                }
                .padding(.top, 20)
            }
        }
    }
}

// Preview for SwiftUI Canvas
#Preview {
    lastPage(score: 8) // Previews the results screen with score 8
}
