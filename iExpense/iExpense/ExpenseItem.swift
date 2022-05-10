//
//  ExpenseItem.swift
//  iExpense
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // you no longer need id: \.id when you add "Identifiable" protocol
    // Identifiable protocol has one requirement:
        // need to have a property called id that should be unique
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
