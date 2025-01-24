//
//  PomodoroPage.swift
//  FocusOn
//
//  Created by Enes Öztürk on 21.01.2025.
//

import SwiftUI

struct PomodoroPage: View {
    
    @State var starStage=0
    @State private var timer: Timer? = nil
    @State var minute=25
    @State var second=0
    @State private var timerRunning = false
    @State var angleOfProgress = -90
    
    var body: some View {
        ZStack {
            Color.specialBackGround
                .ignoresSafeArea()
            
            VStack(spacing: -150) {
                
                HStack(spacing: 20) {
                    ForEach (0..<4, id: \.self) { index in
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .overlay(Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(index < starStage ? .yellow : .specialBackGround))
                        
                    }
                    
                }.offset(y: -250)
                
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 320, height: 320)
                        .overlay() {
                            Path { aPath in
                                aPath.move(to: CGPoint(x:160, y:160))
                                aPath.addArc(center: CGPoint(x:160, y:160), radius: 160, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: Double(angleOfProgress)), clockwise: false)
                            }
                            .fill(Color.cyan)
                        }
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 270, height: 270)
                    
                    Text(String(format: "%02d:%02d", minute, second))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.system(size: 52, weight: .bold))
                    
                }
                
                Button(action: {
                    timerRunning.toggle()// Replace with your desired action
                    if timerRunning {
                        startTimer()
                    }
                    else {
                        stopTimer()
                    }
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color.cyan)
                            .frame(width: 250, height: 100)
                        Image(systemName: (timerRunning ? "pause" : "play"))
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.all)
                            .foregroundColor(.white)
                    }
                }
                .offset(y: 250)
                .padding(.horizontal)
                
            }
        }
    }
    
    
    func startTimer() {
            timer?.invalidate()  // Önceki timer varsa durdur
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                DispatchQueue.main.async {
                    withAnimation(.linear(duration: 0.1)) {
                                    angleOfProgress += 360 / (25 * 60)
                                    angleOfProgress = min(angleOfProgress, 360)
                                }
                    if minute == 0 && second == 0 {
                        completePomodoro()
                    } else if second > 0 {
                        second -= 1
                    } else {
                        minute -= 1
                        second = 59
                    }
                }
            }
        }
    
    func stopTimer() {
            timer?.invalidate()
            timer = nil
            timerRunning = false
        }
    
    // 🎯 Pomodoro Tamamlandığında Çalışan Fonksiyon
       func completePomodoro() {
           stopTimer()
           starStage += 1
           
           if starStage == 4 {
               startLongBreak()
           } else {
               startShortBreak()
           }
       }

       // ☕ Kısa Mola (5 dk)
       func startShortBreak() {
           minute = 5
           second = 0
           startTimer()
       }

       // 🛌 Uzun Mola (15 dk)
       func startLongBreak() {
           minute = 15
           second = 0
           startTimer()
       }
    
}
#Preview {
    PomodoroPage()
}
