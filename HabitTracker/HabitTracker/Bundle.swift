//
//  Bundle.swift
//  HabitTracker
//
//  Created by 진승연 on 2022/06/20.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        // let formatter = DateFormatter()
        // formatter.dateFormat = "y-MM-dd"
        // decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
    
    func encode<T: Codable>(items: T) {
        let encoder = JSONEncoder()
        
        guard let encoded = try? encoder.encode(items) else {
            fatalError("Failed to encode")
        }
    }
}
