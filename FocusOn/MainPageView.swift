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
                            ZStack {
                                Capsule()
                                    .foregroundColor(Color.cyan)
                                    .frame(width: 250, height: 80)
                                    .padding(.horizontal)
                                    .shadow(radius: 10)
                                
                                Label("Pomodoro", systemImage: "timer")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                            }
                        
                        }
                        
                        Button(action: {
                            showPomodoroInfo = true
                        }) {
                            Circle()
                                .frame(width: 60, height: 60)
                                .shadow(radius: 10)
                                .overlay(Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 30, height: 30))
                        }
                        .popover(isPresented: $showPomodoroInfo) {
                            PomodoroInfo(showPomodoroInfo: $showPomodoroInfo)
                                
                        }

                    }
                    HStack {
                        NavigationLink(destination: OtherTechniquePage()) {
                            ZStack {
                                Capsule()
                                    .foregroundColor(Color.cyan)
                                    .frame(width: 250, height: 80)
                                    .padding(.horizontal)
                                    .shadow(radius: 10)
                                
                                Label("57/12 Technique", systemImage: "timer")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                            }

                        }
                        Button(action: {
                            showOtherInfo = true
                        }) {
                            Circle()
                                .frame(width: 60, height: 60)
                                .shadow(radius: 10)
                                .overlay(Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 30, height: 30))
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

