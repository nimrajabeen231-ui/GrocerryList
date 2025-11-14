//
//  SplashScreenView.swift
//  GrocerryList
//
//  Created by Nimra Jabeen on 11/11/25.
//



/*
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var rotationAmount: Angle = .degrees(-360)
    @State private var scaleAmount: CGFloat = 0.5
    @State private var textScaleAmount: CGFloat = 0.8
    @State private var opacityAmount: Double = 0.0
    
    @State private var waveOffset: CGFloat = 200 // Initial offset for wave to appear from bottom
    @State private var shapeOpacity: Double = 0.0 // Opacity for the wave shape itself

    // Main app gradient (darker, saturated)
    let appGradient = LinearGradient(
        colors: [
            Color(red: 0.0, green: 0.15, blue: 0.45), // Dark Navy Blue
            Color(red: 0.05, green: 0.35, blue: 0.3)  // Dark Forest Green
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Complementary color for the wave (e.g., a lighter, brighter green from your theme)
    let waveColor = Color(red: 0.2, green: 0.7, blue: 0.2).opacity(0.7) // A brighter, slightly transparent green

    // Text to animate
    let appTitle: String = "My Shopping List"
    @State private var animatedText: String = ""
    @State private var charIndex: Int = 0

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                // 1. Main Background Gradient
                appGradient.ignoresSafeArea()
                
                // 2. The Dribbble-style Wave Shape
                WaveShape(offset: waveOffset)
                    .fill(waveColor) // Fill with a complementary color
                    .opacity(shapeOpacity)
                    .frame(height: UIScreen.main.bounds.height * 0.7) // Make the wave take up part of the screen
                    .offset(y: UIScreen.main.bounds.height * 0.3) // Position it from the bottom
                    .animation(.easeInOut(duration: 1.0), value: shapeOpacity)
                    .animation(.easeOut(duration: 1.5), value: waveOffset)

                // 3. Animated Icon and Text (placed on top)
                VStack(spacing: 20) {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .rotationEffect(rotationAmount)
                        .scaleEffect(scaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 1.5), value: rotationAmount)

                    Text(animatedText)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .scaleEffect(textScaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 0.5), value: opacityAmount)
                }
                .padding(.bottom, 100) // Adjust padding to position icon/text above the wave visually
                
                // 4. Branding at the bottom (similar to Dribbble example)
                VStack {
                    Spacer()
                    Text("Powered by SwiftUI") // Or "© Your Brand"
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 20)
                }
            }
            .onAppear {
                // Animation Sequence:
                
                // 1. Wave shape rises and fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    shapeOpacity = 1.0
                    waveOffset = -100 // Move wave up slightly to show its curve
                }
                
                // 2. Tornado effect for icon/text (starts after wave appears)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    rotationAmount = .degrees(0)
                    scaleAmount = 1.0
                    textScaleAmount = 1.0
                    opacityAmount = 1.0
                }
                
                // 3. Start character reveal
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Adjusted delay
                    animateTitleCharacters()
                }

                // 4. Final transition to main app
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Longer total duration
                    isActive = true
                }
            }
        }
    }
    
    // Function to animate title characters one by one
    func animateTitleCharacters() {
        guard charIndex < appTitle.count else { return }
        
        let index = appTitle.index(appTitle.startIndex, offsetBy: charIndex)
        animatedText.append(appTitle[index])
        charIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
            animateTitleCharacters()
        }
    }
}

#Preview {
    SplashScreenView()
}

*/



/*

import SwiftUI

struct SplashScreenView: View {
    // STATE VARIABLES: Correctly declared at the top
    @State private var isActive = false
    @State private var rotationAmount: Angle = .degrees(-360)
    @State private var scaleAmount: CGFloat = 0.5
    @State private var textScaleAmount: CGFloat = 0.8
    @State private var opacityAmount: Double = 0.0
    @State private var logoOffset: CGFloat = 200
    
    @State private var waveOffset: CGFloat = 200 // For wave animation
    @State private var shapeOpacity: Double = 0.0 // For wave opacity

    // Darker Blue Gradient (Background)
    let appGradient = LinearGradient(
        colors: [
            Color(red: 0.0, green: 0.15, blue: 0.45), // Dark Navy Blue
            Color(red: 0.1, green: 0.4, blue: 0.6)  // Medium Teal Blue
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // 🚨 UPDATED WAVE COLOR: A contrasting light blue/cyan 🚨
    let waveColor = Color(red: 0.3, green: 0.6, blue: 0.8).opacity(0.8) // Light Blue/Cyan

    // Text to animate
    let appTitle: String = "My Shopping List"
    @State private var animatedText: String = ""
    @State private var charIndex: Int = 0

    var body: some View {
        if isActive {
            ContentView() // Transition to ContentView after animation
        } else {
            ZStack {
                // 1. Main Background Gradient
                appGradient.ignoresSafeArea()
                
                // 2. The Dribbble-style Wave Shape
                WaveShape(offset: waveOffset)
                    .fill(waveColor) // Fill with the new light blue color
                    .opacity(shapeOpacity)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .offset(y: UIScreen.main.bounds.height * 0.3)
                    .animation(.easeInOut(duration: 1.0), value: shapeOpacity)
                    .animation(.easeOut(duration: 1.5), value: waveOffset)

                // 3. Animated Icon and Text (placed on top)
                VStack(spacing: 20) {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.white) // White for contrast
                        .rotationEffect(rotationAmount)
                        .scaleEffect(scaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 1.5), value: rotationAmount)

                    Text(animatedText)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white) // White for contrast
                        .scaleEffect(textScaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 0.5), value: opacityAmount)
                }
                .padding(.bottom, 100)
                
                // 4. Branding at the bottom
                VStack {
                    Spacer()
                    Text("Powered by SwiftUI")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 20)
                }
            }
            .onAppear {
                // Animation Sequence:
                
                // 1. Wave shape rises and fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    shapeOpacity = 1.0
                    waveOffset = -100
                }
                
                // 2. Tornado effect for icon/text (starts after wave appears)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    rotationAmount = .degrees(0)
                    scaleAmount = 1.0
                    textScaleAmount = 1.0
                    opacityAmount = 1.0
                }
                
                // 3. Start character reveal
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    animateTitleCharacters()
                }

                // 4. Final transition to main app
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    isActive = true
                }
            }
        }
    }
    
    // Function to animate title characters one by one
    func animateTitleCharacters() {
        guard charIndex < appTitle.count else { return }
        
        let index = appTitle.index(appTitle.startIndex, offsetBy: charIndex)
        animatedText.append(appTitle[index])
        charIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
            animateTitleCharacters()
        }
    }
}

#Preview {
    SplashScreenView()
}
*/






import SwiftUI

struct SplashScreenView: View {
    // STATE VARIABLES: Controls animations and view transition
    @State private var isActive = false
    @State private var rotationAmount: Angle = .degrees(-360)
    @State private var scaleAmount: CGFloat = 0.5
    @State private var textScaleAmount: CGFloat = 0.8
    @State private var opacityAmount: Double = 0.0
    
    @State private var waveOffset: CGFloat = 200 // For wave animation
    @State private var shapeOpacity: Double = 0.0 // For wave opacity

    // 🚨 FINAL OCEAN GRADIENT: Dark Blue, Green, and Light Blue 🚨
    let appGradient = LinearGradient(
        colors: [
            // Darkest Blue (Top)
            Color(red: 0.0, green: 0.1, blue: 0.35),
            // Medium Blue (Mid-Top)
            Color(red: 0.1, green: 0.4, blue: 0.7),
            // Aqua/Teal Green (Mid-Bottom)
            Color(red: 0.0, green: 0.6, blue: 0.55),
            // Lightest Blue/Cyan (Bottom)
            Color(red: 0.3, green: 0.8, blue: 0.9)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Complementary color for the wave (Light Blue/Cyan)
    let waveColor = Color(red: 0.3, green: 0.6, blue: 0.8).opacity(0.8)

    // Text to animate
    let appTitle: String = "My Shopping List"
    @State private var animatedText: String = ""
    @State private var charIndex: Int = 0

    var body: some View {
        if isActive {
            ContentView() // Transition to ContentView after animation
        } else {
            ZStack {
                // 1. Main Background Gradient
                appGradient.ignoresSafeArea()
                
                // 2. The Dribbble-style Wave Shape
                WaveShape(offset: waveOffset)
                    .fill(waveColor)
                    .opacity(shapeOpacity)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .offset(y: UIScreen.main.bounds.height * 0.3)
                    .animation(.easeInOut(duration: 1.0), value: shapeOpacity)
                    .animation(.easeOut(duration: 1.5), value: waveOffset)

                // 3. Animated Icon and Text (placed on top)
                VStack(spacing: 20) {
                    // Icon (Tornado Effect)
                    Image(systemName: "cart.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .rotationEffect(rotationAmount)
                        .scaleEffect(scaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 1.5), value: rotationAmount)

                    // Animated Text
                    Text(animatedText)
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .scaleEffect(textScaleAmount)
                        .opacity(opacityAmount)
                        .animation(.easeInOut(duration: 0.5), value: opacityAmount)
                }
                .padding(.bottom, 100) // Lifts the content above the wave
                
                // 4. Branding at the bottom
                VStack {
                    Spacer()
                    Text("Powered by SwiftUI")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.bottom, 20)
                }
            }
            .onAppear {
                // Animation Sequence:
                
                // 1. Wave shape rises and fades in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    shapeOpacity = 1.0
                    waveOffset = -100
                }
                
                // 2. Tornado effect for icon/text (starts after wave appears)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    rotationAmount = .degrees(0)
                    scaleAmount = 1.0
                    textScaleAmount = 1.0
                    opacityAmount = 1.0
                }
                
                // 3. Start character reveal
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    animateTitleCharacters()
                }

                // 4. Final transition to main app (Pause included)
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    isActive = true
                }
            }
        }
    }
    
    // Function to animate title characters one by one
    func animateTitleCharacters() {
        guard charIndex < appTitle.count else { return }
        
        let index = appTitle.index(appTitle.startIndex, offsetBy: charIndex)
        animatedText.append(appTitle[index])
        charIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
            animateTitleCharacters()
        }
    }
}

#Preview {
    SplashScreenView()
}
