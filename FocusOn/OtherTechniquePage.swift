//
//  OtherTechniquePage.swift
//  FocusOn
//
//  Created by Enes Öztürk on 21.01.2025.
//

import SwiftUI

struct OtherTechniquePage: View {
    
    @State private var timer: Timer? = nil

    @State var minute=52
    @State var second=0
    @State private var timerRunning = false
    @State var angleOfProgress: Double = -90
    @State var progressDuration = 52
    @State var isBreak = false
    @State var count = 0

   

    
    var body: some View {
        ZStack {
            Color.specialBackGround
                .ignoresSafeArea()
            
            VStack (spacing: -150){
                

                Text("Session: \(count)")
                    .foregroundColor(Color.primary)
                    .offset(y: -300)
                    .padding(.top)
                    .font(.largeTitle)
                

                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 320, height: 320)
                        .overlay() {
                            Path { aPath in
                                aPath.move(to: CGPoint(x:160, y:160))
                                aPath.addArc(center: CGPoint(x:160, y:160), radius: 160, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: Double(angleOfProgress)), clockwise: false)
                            }
                            .fill(isBreak ? Color.green : Color.cyan)
                        }
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 270, height: 270)
                    
                    Text(String(format: "%02d:%02d", minute, second))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.system(size: 52, weight: .bold))
                    
                }

                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                

                
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
                .padding([.leading, .bottom, .trailing], 50.0)
            }
        }

    }
    
    func startTimer() {
        timer?.invalidate()  // Stop any existing timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                let totalTime = progressDuration * 60  // Total duration in seconds
                let timeElapsed = ((progressDuration * 60) - ((minute * 60) + second))
                let progress = Double(timeElapsed) / Double(totalTime)

                // Animate the angle of progress correctly
                withAnimation(.linear(duration: 2)) {
                    angleOfProgress = -90 + (progress * 360)
                }

                // Timer countdown logic
                if minute == 0 && second == 0 {
                    
                    isBreak.toggle()
                    manage()
                    if (!isBreak) {
                        count += 1
                    }
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
    
    func breakTime() {
        minute = 17
        second = 0
        timerRunning = true
        progressDuration = 17
        startTimer()
    }
    
    func manage() {
        stopTimer()
        
        if isBreak {
            breakTime()
        }
        else {
            minute = 52
            second = 0
            timerRunning = true
            progressDuration = 52
            startTimer()
        }

    }
    
    func startTimer() {
        timer?.invalidate()  // Stop any existing timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                let totalTime = progressDuration * 60  // Total duration in seconds
                let timeElapsed = ((progressDuration * 60) - ((minute * 60) + second))
                let progress = Double(timeElapsed) / Double(totalTime)

                // Animate the angle of progress correctly
                withAnimation(.linear(duration: 2)) {
                    angleOfProgress = -90 + (progress * 360)
                }

                // Timer countdown logic
                if minute == 0 && second == 0 {
                    
                    isBreak.toggle()
                    stopTimer()
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
}

#Preview {
    OtherTechniquePage()
}
