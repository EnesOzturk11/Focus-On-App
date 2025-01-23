//
//  MainPageView.swift
//  FocusOn
//
//  Created by Enes Öztürk on 21.01.2025.
//

import SwiftUI

extension Color {
    static let specialBackGround = Color(red: 200/255, green: 235/255, blue: 222/255)
}

struct MainPageView: View {
    @State private var showPomodoroInfo = false
    @State private var showOtherInfo = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                // Background color
                Color.specialBackGround
                    .ignoresSafeArea()
                

                // Centered Button
                VStack (spacing: 40){
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 370, height: 150)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal, 20)
                            .offset(y: -100)
                            
                        Text("Select a technique from under techniques")
                            .font(.title) // Increases text size
                            .fontWeight(.semibold) // Makes it bolder
                            .foregroundColor(.black) // Changes text color
                            .multilineTextAlignment(.center) // Centers text if it wraps
                            .padding(.horizontal, 20)
                            .offset(y: -100)
                    }

                    HStack {
                        NavigationLink(destination: PomodoroPage()) {
                            Label("Pomodoro", systemImage: "timer") // Use a valid SF Symbol
                                .padding()
                                .frame(width: 250, height: 70) // Adjust button size
                                .background(Color.blue) // Button background color
                                .foregroundColor(.white) // Text color
                                .cornerRadius(10) // Rounded corners
                                .shadow(radius: 5) // Button shadow effect
                                .font(.headline)
                                .fontWeight(.bold)
                            
                        }
                        
                        Button(action: {
                            showPomodoroInfo = true
                        }) {
                            Image(systemName: "info.circle.fill") // ℹ️ Icon
                                .resizable() // Allows resizing
                                .scaledToFit() // Maintains aspect ratio
                                .frame(width: 30, height: 30) // Icon size
                                .foregroundColor(.white) // Icon color
                                .padding() // Adds padding inside the button
                                .background(Color.blue) // Button background color
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .popover(isPresented: $showPomodoroInfo) {
                            PomodoroInfo(showPomodoroInfo: $showPomodoroInfo)
                                
                        }

                    }
                    HStack {
                        NavigationLink(destination: OtherTechniquePage()) {
                            Label("57/12 technique" ,systemImage: "timer")
                                .padding()
                                .frame(width: 250, height: 70)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        Button(action: {
                            showOtherInfo = true
                        }) {
                            Image(systemName: "info.circle.fill") // ℹ️ Icon
                                .resizable() // Allows resizing
                                .scaledToFit() // Maintains aspect ratio
                                .frame(width: 30, height: 30) // Icon size
                                .foregroundColor(.white) // Icon color
                                .padding() // Adds padding inside the button
                                .background(Color.blue) // Button background color
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .popover(isPresented: $showOtherInfo) {
                            OtherInfo(showOtherInfo: $showOtherInfo)
                                
                        }
                    }
                }
                
            }
            .navigationTitle("Focus On")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Focus On")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                }
            }
            
            
        }
    }
}



#Preview {
    MainPageView()
}

