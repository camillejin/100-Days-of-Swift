import SwiftUI



// Controlling the animation stack

/*
struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
            
    }
}
*/


// Animating Gestures I
/*
struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(dragAmount)
        .gesture(
            DragGesture()
            .onChanged { dragAmount = $0.translation}
            .onEnded { _ in
                withAnimation {
                    dragAmount = .zero
                }
            }
        )
        // .animation(.spring(), value: dragAmount)
    }
}
*/



// Showing and Hiding Views with Transitions
/*
struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount) // lets us move a view relative to its natural position
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}
 
 
 
 
 struct ContentView: View {
     @State private var isShowingRed = false
     
     var body: some View {
         VStack {
             Button("Tap Me") {
                 withAnimation {
                     isShowingRed.toggle()
                 }
             }
             if isShowingRed {
                 Rectangle()
                     .fill(.red)
                     .frame(width: 200, height: 200)
                     .transition(.asymmetric(insertion: .scale, removal: .opacity))
             }
         }
     }
 }
*/
