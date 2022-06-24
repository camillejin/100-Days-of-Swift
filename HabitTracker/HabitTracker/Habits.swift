//
//  Habits.swift
//  HabitTracker
//

import Foundation


class Habits: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode(
                [Activity].self, from: savedActivities) {
                activities = decodedItems
                return
            }
        }
        
        activities = []
    }
    
}
