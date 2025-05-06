//
//  ContentView.swift
//  Quiz App
//
//  Created by StudentPM on 4/25/25.
//

import SwiftUI // Imports the SwiftUI framework for UI components

struct ContentView: View { // Main entry view of the app
    var body: some View { // UI body of the view
        NavigationView{ // Creates a navigation stack for navigating between screens
            ZStack { // Overlays multiple views on top of each other
                Image("Image") // Background image named "Image" (should be in Assets)
                    .resizable() // Makes image resizable to fit the frame
                    .frame(width: 1280, height: 853) // Sets specific size for the image
                    .ignoresSafeArea() // Makes the image extend under the safe areas

                VStack { // Vertically stacks views
                    NavigationLink(destination: startQuiz()){ // Button that navigates to startQuiz view
                        Text("Start") // Button label
                    }
                }
                .navigationTitle("Quiz Time!") // Title shown at the top of navigation bar
            }
        }
    }
}

#Preview {
    ContentView() // Previews ContentView in canvas or simulator
}

