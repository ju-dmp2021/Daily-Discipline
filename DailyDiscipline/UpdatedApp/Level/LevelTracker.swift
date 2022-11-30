//
//  LevelTracker.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-30.
//

import Foundation

class LevelTracker {
    
    @Published var amountOfPoints: Int = 0
    
    func getPoints() -> Int {
        return amountOfPoints
    }
    
    func getLevel() -> Int {
        return (amountOfPoints / 10 + 1)
    }
    
    func addPoints() {
        
    }
}
