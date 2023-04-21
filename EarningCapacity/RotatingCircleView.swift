//
//  ContentView2.swift
//  EarningCapacity
//
//  Created by Дмитрий Спичаков on 21.04.2023.
//

import SwiftUI

struct RotatingCircleView: View {
    
    let color: Color = .red
    let circleStrokeWidth: CGFloat = 2

    @State private var rotationAngle: Angle = .degrees(360)
    
    var body: some View {
        GeometryReader { geo in
            let center = CGPoint(x: geo.size.width/2, y: geo.size.height/2)
            
            filledFig(center: center)
            chevron(center: center)
            drawCircleToFill(center: CGPoint(x: center.x - 30, y: center.y - 155), radius: 4)
                .foregroundColor(color)
            lines(center: center)
            rotationPArt(center: center)
        }
        .onAppear {
            startAnimation()
        }
    }
    
    private func filledFig(center: CGPoint) -> some View {
        Path { path in
            path.move(to: CGPoint(x: center.x - 10, y: center.y - 155))
            path.addLine(to: CGPoint(x: center.x - 6, y: center.y - 149))
            path.addLine(to: CGPoint(x: center.x + 10, y: center.y - 149))
            path.addLine(to: CGPoint(x: center.x + 15, y: center.y - 144))
            path.addLine(to: CGPoint(x: center.x + 65, y: center.y - 144))
            path.addLine(to: CGPoint(x: center.x + 70, y: center.y - 149))
            path.addLine(to: CGPoint(x: center.x + 120, y: center.y - 149))
            path.addLine(to: CGPoint(x: center.x + 125, y: center.y - 155))
            path.closeSubpath()
        }
        .fill(color)
    }
    
    private func chevron(center: CGPoint) -> some View {
        Group {
            drawLine(
                from: CGPoint(x: center.x + 225, y: center.y - 180),
                to: CGPoint(x: center.x + 215, y: center.y - 170))
            drawLine(
                from: CGPoint(x: center.x + 225, y: center.y - 180),
                to: CGPoint(x: center.x + 215, y: center.y - 190))
            drawLine(
                from: CGPoint(x: center.x + 220, y: center.y - 180),
                to: CGPoint(x: center.x + 200, y: center.y - 200))
            drawLine(
                from: CGPoint(x: center.x + 200, y: center.y - 160),
                to: CGPoint(x: center.x + 220, y: center.y - 180))
        }
    }
    
    private func lines(center: CGPoint) -> some View {
        Group {
            drawLine(
                from: CGPoint(x: center.x - 75, y: center.y - 155),
                to: CGPoint(x: center.x - 30, y: center.y - 155))
            drawLine(
                from: CGPoint(x: center.x - 80, y: center.y - 160),
                to: CGPoint(x: center.x - 75, y: center.y - 155))
            drawLine(
                from: CGPoint(x: center.x - 130, y: center.y - 160),
                to: CGPoint(x: center.x - 80, y: center.y - 160))
            drawLine(
                from: CGPoint(x: center.x - 135, y: center.y - 165),
                to: CGPoint(x: center.x - 130, y: center.y - 160))
            drawLine(
                from: CGPoint(x: center.x - 15, y: center.y - 165),
                to: CGPoint(x: center.x - 135, y: center.y - 165))
            drawLine(
                from: CGPoint( x: center.x - 10, y: center.y - 160),
                to: CGPoint(x: center.x - 15, y: center.y - 165))
            drawLine(
                from: CGPoint(x: center.x + 200, y: center.y - 160),
                to: CGPoint(x: center.x - 10, y: center.y - 160))
            drawLine(
                from: CGPoint(x: center.x + 120, y: center.y - 80),
                to: CGPoint(x: center.x + 200, y: center.y - 160))
            drawLine(
                from: CGPoint(x: center.x + 80, y: center.y - 80),
                to: CGPoint(x: center.x + 120, y: center.y - 80))
            drawLine(
                from: center,
                to: CGPoint(x: center.x + 80, y: center.y - 80))
        }
    }
    
    private func startAnimation() {
        withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
            rotationAngle = .degrees(0)
        }
    }
    
    private func drawLine(from: CGPoint, to: CGPoint) -> some View {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }
        .stroke(color, lineWidth: 2)
    }
    
    private func drawCircleToFill(center: CGPoint, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .zero,
                endAngle: .degrees(360),
                clockwise: false)
        }
    }
    private func drawCircle(
        center: CGPoint,
        radius: CGFloat,
        startAngle: Double,
        endAngle: Double
    ) -> some View {
        Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .degrees(startAngle),
                endAngle: .degrees(endAngle),
                clockwise: false)
        }
        .stroke(color, lineWidth: circleStrokeWidth)
    }
    
    private func rotationPArt(center: CGPoint) -> some View {
        ZStack {
            outerCircle(center: center)
            innerCircle(center: center)
            centerRectangle(center: center)
        }
        .rotationEffect(rotationAngle, anchor: .center)
    }
    
    private func outerCircle(center: CGPoint) -> some View {
        drawCircle(
            center: center,
            radius: 70,
            startAngle: 180,
            endAngle: 90)
    }
    
    private func innerCircle(center: CGPoint) -> some View {
        drawCircle(
            center: center,
            radius: 50,
            startAngle: 0,
            endAngle: 270)
    }
    
    private func centerRectangle(center: CGPoint) -> some View {
        Path { path in
            path.addRoundedRect(
                in: CGRect(
                    x: center.x - 10, // when 6 is width / 2
                    y: center.y - 10,
                    width: 20,
                    height: 20),
                cornerSize: CGSize(width: 4, height: 4))
        }
        .foregroundColor(.red)
    }
}

struct RotatingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingCircleView()
    }
}
