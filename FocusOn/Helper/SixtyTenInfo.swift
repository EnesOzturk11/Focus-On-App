//
//  PomodoroInfo.swift
//  FocusOn
//
//  Created by Enes Öztürk on 22.01.2025.
//

import SwiftUI

struct SixtyTenInfo: View {
    @Binding var showSixtyTenInfo: Bool
    
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
                    .overlay(Text("The **60/10 Technique** involves **60 minutes of focused work**, followed by a **10-minute break**. This cycle helps maintain deep concentration while preventing burnout. It’s ideal for **large projects** that require sustained focus, balancing productivity with short recovery periods.").font(.title2).multilineTextAlignment(.center).padding(.horizontal, 3.0))
                                        
                    }
            .offset(y: -120)
        
            Button(action: {
                showSixtyTenInfo = false}) {
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
    SixtyTenInfo(showSixtyTenInfo: .constant(false))
}
