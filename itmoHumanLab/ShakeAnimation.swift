//
//  ShakaAnimation.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import Foundation
import SwiftUI
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
