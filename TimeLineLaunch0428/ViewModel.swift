//
//  ViewModel.swift
//  TimeLineLaunch0428
//
//  Created by 张亚飞 on 2022/4/28.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    @Published var particleSystem = ParticleSystem()
    
    let timerPublisher = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    var cancellables = Set<AnyCancellable>()
    
    var p:[CGPoint] = []
    let a = 5.0
    let b = 7.0
    let c = 2.2
    
    init() {
        
        for i  in stride(from: 0.0, to: 60.0, by: 0.02) {
            
            var x = a * sin(4.0 * i + c)
            var y = b * sin(i)
            x = x *  19.0 + 200
            y = y * 19.0 + 400
            p.append(CGPoint(x: x, y: y))
        }
        
        timerPublisher
            .zip(p.publisher)
            .sink { [weak self] turple in
                
                self?.particleSystem.center.x = turple.1.x / UIScreen.main.bounds.width
                self?.particleSystem.center.y = turple.1.y / UIScreen.main.bounds.height
            }
            .store(in: &cancellables)
    }
}
