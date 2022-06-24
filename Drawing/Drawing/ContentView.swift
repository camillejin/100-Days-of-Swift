//
//  ContentView.swift
//  Drawing
//

import SwiftUI

struct Arrow: Shape {
    var startX: Double
    var startY: Double
    var arrowLength: Double
    var arrowWidth: Double
    var hatLength: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.move(to: CGPoint(x: startX, y: startY))
        
        path.addLine(to: CGPoint(x: startX + arrowLength, y: startY))
        path.addLine(to: CGPoint(x: startX + arrowLength - hatLength, y: startY + arrowWidth))
        path.move(to: CGPoint(x: startX + arrowLength, y: startY))
        path.addLine(to: CGPoint(x: startX + arrowLength - hatLength, y: startY - arrowWidth))
        
        return path
    }
}


struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: 4, y: 5),
                            endPoint: UnitPoint(x: 3, y: 100)
                            ), lineWidth: 2)
            }
        }
        .drawingGroup() // uses Metal
        // makes it lightning fast
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct ContentView: View {
    @State private var thickness: Double = 1
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
            
            Arrow(startX: 100, startY: 100, arrowLength: 100, arrowWidth: 20, hatLength: 20)
                .stroke(.blue, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
                .onTapGesture {
                    withAnimation(.linear) {
                        thickness += 1
                    }
                }
            
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
        }
        .frame(width: 400, height: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

