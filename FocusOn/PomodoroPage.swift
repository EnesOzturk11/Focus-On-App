//
//  PomodoroPage.swift
//  FocusOn
//
//  Created by Enes Öztürk on 21.01.2025.
//

import SwiftUI

struct PomodoroPage: View {
    var body: some View {
        ZStack {
            Color.specialBackGround
                .ignoresSafeArea()
            
            VStack(spacing: -150) {
                
                HStack(spacing: 20) {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                }.offset(y: -250)
                    
                
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 320, height: 320)
                        
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 270, height: 270)
                        
                }
                
                ZStack {
                    Capsule()
                        .foregroundColor(.orange)
                        .frame(width: 250, height: 100)
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.red)
                    Image(systemName: "play")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.all)
                        .foregroundColor(.white)
                    
                } .offset(y: 250)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    PomodoroPage()
}
