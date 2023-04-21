//
//  ContentView.swift
//  PathApp
//
//  Created by Дмитрий Спичаков on 18.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isInverted: Bool = false
    
    var body: some View {
        VStack {
            ReachLevelShapeOne(isInverted: isInverted)
                .frame(width: 380, height: 474)
                .onTapGesture {
                    isInverted.toggle()
                }
        }
        .padding()
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ReachLevelShapeOne: Shape {
    var isInverted: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        let cornerRadius = min(width, height) * 0.07
        let deep = 0.14 // Place for touch labels
        
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        
        path.addLine(to: CGPoint(x: width * 0.5 - cornerRadius, y: 0))
        
        path.addArc(center: CGPoint(x: width * 0.5 - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: width * 0.5, y: height * deep - cornerRadius))
        
        path.addArc(center: CGPoint(x: width * 0.5 + cornerRadius, y: height * deep - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -180),
                    endAngle: Angle(degrees: 90),
                    clockwise: true)
                
        path.addLine(to: CGPoint(x: width - cornerRadius, y: height * deep))
        
        path.addArc(center: CGPoint(x: width - cornerRadius, y: height * deep + cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))
        
        path.addArc(center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: cornerRadius, y: height))
        
        path.addArc(center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        
        path.closeSubpath()
        
        if isInverted {
            return path.applying(CGAffineTransform(scaleX: -1, y: 1).translatedBy(x: -rect.size.width, y: 0))
        } else {
            return path
        }
    }
}
