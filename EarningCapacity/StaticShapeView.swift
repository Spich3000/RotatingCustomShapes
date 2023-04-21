//
//  StaticShapeView.swift
//  EarningCapacity
//
//  Created by Дмитрий Спичаков on 22.04.2023.
//

import SwiftUI

import SwiftUI

struct StaticShapeView: View {
    
    var pointSet = PointSet()
    let color: Color = .blue
    let offset: Double = 36
    
    var body: some View {
            ZStack {
                rhombus
                hashMarks
                horizontalLine
                footnote
                centralCircle
                outerCircle
        }
    }
    
    private func createRectangle(offset: Double) -> some View {
        Path { path in
            path.move(to: CGPoint(x: 123 + offset * self.offset, y: 323))
            path.addLine(to: CGPoint(x: 153  + offset * self.offset, y: 323))
            path.addLine(to: CGPoint(x: 123  + offset * self.offset, y: 353))
            path.addLine(to: CGPoint(x: 93  + offset * self.offset, y: 353))
            path.closeSubpath()
        }
        .fill(color)
    }
    
    private func drawLine(from: CGPoint, to: CGPoint) -> some View {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }
        .stroke(color, lineWidth: 2)
    }
    
    private func drawCircle(center: CGPoint, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .zero,
                endAngle: .degrees(360),
                clockwise: false)
        }
    }
    
    private var rhombus: some View {
        ForEach(0...4, id: \.self) { index in
            createRectangle(offset: Double(index))
                .opacity(1 - Double(index * 2)/10.0)
        }
    }
    
    private var hashMarks: some View {
        Group {
            drawLine(from: pointSet.hshMark4Start, to: pointSet.hshMark4End)
            drawLine(from: pointSet.hshMark3Start, to: pointSet.hshMark3End)
            drawLine(from: pointSet.hshMark2Start, to: pointSet.hshMark2End)
            drawLine(from: pointSet.hLineEnd, to: pointSet.hshMarkEnd)
        }
    }
    
    private var horizontalLine: some View {
        drawLine(from: pointSet.footnoteEnd, to: pointSet.hLineEnd)
    }
    
    private var footnote: some View {
        drawLine(from: pointSet.center, to: pointSet.footnoteEnd)
    }
    
    private var centralCircle: some View {
        drawCircle(center: pointSet.center, radius: 12)
            .fill(color)
    }
    
    private var outerCircle: some View {
        drawCircle(center: pointSet.center, radius: 30)
            .stroke(color, lineWidth: 2)
    }
}

struct StaticShapeView_Previews: PreviewProvider {
    static var previews: some View {
        StaticShapeView()
    }
}
