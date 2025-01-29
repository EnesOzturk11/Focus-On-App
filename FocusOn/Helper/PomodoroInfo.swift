//
//  PomodoroInfo.swift
//  FocusOn
//
//  Created by Enes Öztürk on 22.01.2025.
//

import SwiftUI

struct PomodoroInfo: View {
    @Binding var showPomodoroInfo: Bool
    
    var body: some View {
        ZStack {
            Color.specialBackGround
                .ignoresSafeArea()
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 350, height: 350)
                    .cornerRadius(35)
                    .shadow(color: Color.black.opacity(1.0), radius: 40)
                    .overlay(Text("The **Pomodoro Technique** boosts productivity by breaking work into 25-minute focused sessions (Pomodoros) followed by 5-minute breaks, with a longer break after every four Pomodoros. It enhances focus, reduces distractions, and prevents burnout.").font(.title2).multilineTextAlignment(.center).padding(.horizontal, 3.0))
                                        
                    }
            .offset(y: -120)
        
            Button(action: {
                showPomodoroInfo = false}) {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    }
                .offset(y: 175)
                }
        }
        
}

#Preview {
    PomodoroInfo(showPomodoroInfo: .constant(false))
}
