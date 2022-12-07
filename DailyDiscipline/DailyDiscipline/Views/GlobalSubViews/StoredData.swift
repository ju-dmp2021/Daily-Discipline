//
//  File.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import Foundation

class StoredData {
    
    let presetTasks: [TaskTemplate] = [
    TaskTemplate(name: "Go to the gym", category: "Fitness"),
    TaskTemplate(name: "Do Yoga", category: "Fitness"),
    TaskTemplate(name: "Stretch", category: "Fitness"),
    TaskTemplate(name: "Go for a run", category: "Fitness"),
    TaskTemplate(name: "Go for a walk", category: "Fitness"),
    TaskTemplate(name: "Do body weight exersices", category: "Fitness"),
    TaskTemplate(name: "Buy Groceries", category: "Chores"),
    TaskTemplate(name: "Clean the apartment", category: "Chores"),
    TaskTemplate(name: "Clean your room", category: "Chores"),
    TaskTemplate(name: "Clean the house", category: "Chores"),
    TaskTemplate(name: "Do the laundry", category: "Chores"),
    TaskTemplate(name: "Wash the car", category: "Chores"),
    TaskTemplate(name: "Take out the trash", category: "Chores"),
    TaskTemplate(name: "Pay the bills", category: "Chores"),
    TaskTemplate(name: "Walk the dog", category: "Health"),
    TaskTemplate(name: "Go for a walk", category: "Health"),
    TaskTemplate(name: "Call someone important", category: "Health"),
    TaskTemplate(name: "Write in your gratitude journal", category: "Health"),
    TaskTemplate(name: "Meditate", category: "Health"),
    TaskTemplate(name: "Eat a fruit", category: "Health"),
    TaskTemplate(name: "Cook a meal", category: "Cooking"),
    TaskTemplate(name: "Meal prep", category: "Cooking"),
    TaskTemplate(name: "Bake bread", category: "Cooking"),
    TaskTemplate(name: "Make dessert", category: "Cooking"),
    TaskTemplate(name: "Read", category: "Study"),
    TaskTemplate(name: "Study one hour", category: "Study"),
    TaskTemplate(name: "Study for a test", category: "Study"),
    TaskTemplate(name: "Go to School", category: "Study"),
    TaskTemplate(name: "Watch a movie", category: "Recreational"),
    TaskTemplate(name: "Watch an episode of a show", category: "Recreational"),
    TaskTemplate(name: "Play a video game", category: "Recreational"),
    TaskTemplate(name: "Play a board game", category: "Recreational"),
    TaskTemplate(name: "Listen to music", category: "Recreational"),
    TaskTemplate(name: "Play music", category: "Recreational"),
    ]
    
    let categories = ["Fitness", "Chores", "Cooking", "Study", "Recreational"]
    
    let achievements = [
        Achievement(title: "Level 1", category: "Progress", description: "Reach level 1", level: 1),
        Achievement(title: "Level 2", category: "Progress", description: "Reach level 2", level: 2),
        Achievement(title: "Level 3", category: "Progress", description: "Reach level 3", level: 3),
        Achievement(title: "Level 4", category: "Progress", description: "Reach level 4", level: 4),
        Achievement(title: "Level 5", category: "Progress", description: "Reach level 5", level: 5),
        Achievement(title: "Level 6", category: "Progress", description: "Reach level 6", level: 6),
        Achievement(title: "Level 7", category: "Progress", description: "Reach level 7", level: 7),
        Achievement(title: "Level 8", category: "Progress", description: "Reach level 8", level: 8),
        Achievement(title: "Level 9", category: "Progress", description: "Reach level 9", level: 9),
        Achievement(title: "Level 10", category: "Progress", description: "Reach level 10", level: 10)
    ]
    
    let titles = [
           Title(title: "Level 2", isAchieved: true, category: "Progress", description: "Reach level 2"),
           Title(title: "Level 3", isAchieved: false, category: "Progress", description: "Reach level 3")
           ]
}

struct TaskTemplate: Identifiable {
    var id = UUID()
    
    var name: String
    var category: String
}

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let description: String
    let level: Int
}

struct Title: Identifiable {
    let id = UUID()
    let title: String
    let isAchieved:Bool
    let category: String
    let description: String
}
