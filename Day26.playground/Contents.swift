
import SwiftUI





// Entering numbers with Stepper
/*
struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}
*/




// Selecting dates and times with DatePicker
/*
struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, displayComponent: .hourAndMinute, in: Date.now...)
           // .labelsHidden()
    }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}
*/




// Working with Dates
/*
struct ContentView: View {
    
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
        // Text(Date.now.formatted(date: .long, time: .omitted))
    }
    
    func trivialExample() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}
*/


