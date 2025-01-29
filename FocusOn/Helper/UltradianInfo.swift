//
//  PomodoroInfo.swift
//  FocusOn
//
//  Created by Enes Öztürk on 22.01.2025.
//

import SwiftUI

struct UltradianInfo: View {
    @Binding var showUltradianInfo: Bool
    
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
                    .overlay(Text("The **Ultradian Rhythm Technique (90/30 Rule)** is based on the brain's natural cycles. It suggests working for 90 minutes without interruption, followed by a 30-minute break. This cycle helps maintain focus and increases productivity by aligning with the brain's natural rhythms.").font(.title2).multilineTextAlignment(.center).padding(.horizontal, 3.0))
                                        
                    }
            .offset(y: -120)
        
            Button(action: {
                showUltradianInfo = false}) {
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
    UltradianInfo(showUltradianInfo: .constant(false))
}
