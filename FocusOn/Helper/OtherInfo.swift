//
//  PomodoroInfo.swift
//  FocusOn
//
//  Created by Enes Öztürk on 22.01.2025.
//

import SwiftUI

struct OtherInfo: View {
    @Binding var showOtherInfo: Bool
    
    var body: some View {
        ZStack {
            Color.specialBackGround
                .ignoresSafeArea()
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 350, height: 250)
                    .cornerRadius(35)
                    .shadow(color: Color.black.opacity(1.0), radius: 40)
                    .overlay(Text("The 57/12 technique involves 57 minutes of focused work followed by a 12-minute break, promoting deep concentration and sustained productivity while preventing burnout.").font(.title2).padding(.horizontal, 3.0))
                                        
                    }
            .offset(y: -120)
        
            Button(action: {
                showOtherInfo = false}) {
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
    OtherInfo(showOtherInfo: .constant(false))
}
