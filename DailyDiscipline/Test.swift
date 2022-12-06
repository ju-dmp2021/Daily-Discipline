//
//  Test.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct Test: View {
    
    var userLevelManager = CoreDataManagerUserLevel.shared
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    
    let titless = [
           Titles(title: "Level 1", isAchieved: false, category: "Progress", description: "Reach level 1", level: 1),
           Titles(title: "Level 2", isAchieved: false, category: "Progress", description: "Reach level 2", level: 2),
           Titles(title: "Level 3", isAchieved: false, category: "Progress", description: "Reach level 3", level: 3),
           Titles(title: "Level 4", isAchieved: false, category: "Progress", description: "Reach level 4", level: 4)
//           Titles(title: "Level 5", isAchieved: false, category: "Progress", description: "Reach level 5"),
//           Titles(title: "Level 6", isAchieved: false, category: "Progress", description: "Reach level 6"),
//           Titles(title: "Level 7", isAchieved: false, category: "Progress", description: "Reach level 7"),
//           Titles(title: "Level 8", isAchieved: false, category: "Progress", description: "Reach level 8"),
//           Titles(title: "Level 9", isAchieved: false, category: "Progress", description: "Reach level 9"),
//           Titles(title: "Level 10", isAchieved: false, category: "Progress", description: "Reach level 10")
           ]
    
    var body: some View {
        VStack {
            Text("Level: \(userLevelViewModel.getCalculatedLevel())")
            ForEach(titless) { title in
                if title.level <= userLevelViewModel.getCalculatedLevel() {
                    Text("JAO")
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

struct Titles: Identifiable {
    let id = UUID()
    let title: String
    let isAchieved: Bool
    let category: String
    let description: String
    let level: Int
    
}
