//
//  Particle.swift
//  TimeLineLaunch0428
//
//  Created by 张亚飞 on 2022/4/28.
//

import SwiftUI

struct Particle: Hashable {
    
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
    let hue: Double
}


