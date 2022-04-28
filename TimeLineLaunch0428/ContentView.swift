//
//  ContentView.swift
//  TimeLineLaunch0428
//
//  Created by 张亚飞 on 2022/4/28.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        TimelineView(.animation) { timeline in
            
            Canvas { context, size in
                let  timeLineData = timeline.date.timeIntervalSinceReferenceDate
                vm.particleSystem.update(date: timeLineData)
                
                for particle in vm.particleSystem.particles {
                    
                    let xPos = particle.x * size.width
                    let yPos = particle.y * size.height
                    
                    var contextCopy = context
                    contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1  )))
                    contextCopy.opacity = 1 - (timeLineData - particle.creationDate)
                    contextCopy.draw(vm.particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
