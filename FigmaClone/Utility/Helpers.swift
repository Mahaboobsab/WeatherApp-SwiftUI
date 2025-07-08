//
//  Helpers.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 09/07/25.
//

import Foundation
extension String {
    func getFormattedDate() -> String? {
        // Step 1: Create a DateFormatter to parse the input
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let date = inputFormatter.date(from: self) {
            // Step 2: Subtract one day
            let calendar = Calendar.current
            if let adjustedDate = calendar.date(byAdding: .day, value: -1, to: date) {
                // Step 3: Format the new date
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMMM d" // "July 7" format
                let formattedDate = outputFormatter.string(from: adjustedDate)
                print("Converted date: \(formattedDate)")
                return formattedDate
                
            }
        }
        return nil
    }
    
    func convertTimeCode() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "hh:mm a"
        
        if let date = formatter.date(from: self) {
            return displayFormatter.string(from: date)
        }
        return "Invalid time"
    }
}
