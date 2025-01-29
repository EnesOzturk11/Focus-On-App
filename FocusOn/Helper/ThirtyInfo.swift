//
//  PomodoroInfo.swift
//  FocusOn
//
//  Created by Enes Öztürk on 22.01.2025.
//

import SwiftUI

struct ThirtyInfo: View {
    @Binding var showThirtyInfo: Bool
    
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
                    .overlay(Text("The **30/30 Technique** alternates **30 minutes of focused work** with **30 minutes of rest** to maintain productivity and prevent burnout. Breaks can include activities like exercising or reading, keeping the mind fresh. This balanced approach **enhances focus while reducing fatigue**.").font(.title2).multilineTextAlignment(.center).padding(.horizontal, 3.0))
                                        
                    }
            .offset(y: -120)
        
            Button(action: {
                showThirtyInfo = false}) {
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
    ThirtyInfo(showThirtyInfo: .constant(false))
}
