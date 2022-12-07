//
//  CategoryToImage.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct CategoryToImage {
    
    func getCategoryImage(category: String) -> String{
        
        switch category {
        case "Fitness":
        return "figure.run"
        case "Chores":
        return "house"
        case "Health":
        return "heart"
        case "Cooking":
        return "fork.knife"
        case "Study":
        return "book"
        case "Recreational":
        return "face.smiling"
        case "Busywork":
        return "house"
        case "Relaxation":
        return "sparkles.tv"
        default:
        return "questionmark.app"
        }
    }
}

