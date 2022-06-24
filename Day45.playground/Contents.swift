import SwiftUI

// Special effects in SwiftUI: blurs, blending, and more
/*
struct ContentView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("Picture1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1-amount) * 20)
            /*
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
             */
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}
*/






// Animating simple shapes with animatableData

/*
 struct Trapezoid: Shape {
     var insetAmount: Double
     
     var animatableData: Double {
         get { insetAmount }
         set { insetAmount = newValue }
     }
     
     func path(in rect: CGRect) -> Path {
         var path = Path()
         
         path.move(to: CGPoint(x: 0, y: rect.maxY))
         path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
         path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
         path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
         path.addLine(to: CGPoint(x: 0, y: rect.maxY))
         
         return path
     }
 }


 struct ContentView: View {
     @State private var insetAmount = 50.0
     
     var body: some View {
         Trapezoid(insetAmount: insetAmount)
             .frame(width: 200, height: 100)
             .onTapGesture {
                 withAnimation {
                     insetAmount = Double.random(in: 10...90)
                 }
             }
     }
 }
 */




// Animating complex shapes with animatablepair
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
        
    }
}




// sprirograph

/*
 struct Spirograph: Shape {
     let innerRadius: Int
     let outerRadius: Int
     let distance: Int
     let amount: Double
     
     func gcd(_ a: Int, _ b: Int) -> Int {
         var a = a
         var b = b
         while b != 0 {
             let temp = b
             b = a % b
             a = temp
         }
         return a
     }
     
     func path(in rect: CGRect) -> Path {
         let divisor = gcd(innerRadius, outerRadius)
         let outerRadius = Double(self.outerRadius)
         let innerRadius = Double(self.innerRadius)
         let distance = Double(self.distance)
         let difference = innerRadius - outerRadius
         let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
         
         // more code to come
         var path = Path()
         
         for theta in stride(from: 0, through: endPoint, by: 0.01) {
             var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
             var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
             
             x += rect.width / 2
             y += rect.height / 2
             
             if theta == 0 {
                 path.move(to: CGPoint(x: x, y: y))
             } else {
                 path.addLine(to: CGPoint(x: x, y: y))
             }
         }
         return path
     }
 }
 
 */

/*
 var body: some View {
         VStack(spacing: 0) {
             Spacer()

             Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                 .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                 .frame(width: 300, height: 300)

             Spacer()

             Group {
                 Text("Inner radius: \(Int(innerRadius))")
                 Slider(value: $innerRadius, in: 10...150, step: 1)
                     .padding([.horizontal, .bottom])

                 Text("Outer radius: \(Int(outerRadius))")
                 Slider(value: $outerRadius, in: 10...150, step: 1)
                     .padding([.horizontal, .bottom])

                 Text("Distance: \(Int(distance))")
                 Slider(value: $distance, in: 1...150, step: 1)
                     .padding([.horizontal, .bottom])

                 Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
                 Slider(value: $amount)
                     .padding([.horizontal, .bottom])

                 Text("Color")
                 Slider(value: $hue)
                     .padding(.horizontal)
 
                }
            }
        }
    }
 */
