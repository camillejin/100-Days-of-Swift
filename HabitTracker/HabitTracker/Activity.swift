//
//  Activity.swift
//  HabitTracker
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
}

