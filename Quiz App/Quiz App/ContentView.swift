//
//  ContentView.swift
//  Quiz App
//
//  Created by StudentPM on 4/25/25.
//

import SwiftUI

struct ContentView: View { // Main entry view of the app
    var body: some View { // UI body of the view
        NavigationView { // Navigation stack for navigating between screens
            ZStack { // Overlays views on top of each other
                Image("Image") // Background image
                    .resizable() // Makes image resizable to fit the frame
                    .frame(width: 1280, height: 853) // Specific size for the image
                    .ignoresSafeArea() // Makes the image extend under the safe areas

                VStack(spacing: 40) {
                    // Custom Title
                    Text("Quiz Time!")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .shadow(color:.blue, radius: 0, x:3, y: 4)
                        .padding()
                        .background(Color.orange.opacity(0.8))
                        .cornerRadius(5)

                    
                    Text("Can you answer all the riddles?")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .shadow(color:.black, radius: 5, x:0, y: 4)

                    // Start Button
                    NavigationLink(destination: startQuiz()) {
                        Text("Start")
                            .padding()
                            .frame(width: 200)
                            .background(Color(red: 232/255, green: 46/255, blue: 91/255))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .shadow(color:.black, radius: 8, x:0, y: 5)
                            .offset(y: 10)
                    }
                }
            }
            .navigationBarHidden(true) // Hide the default nav bar title
        }
    }
}

#Preview {
    ContentView()
}

