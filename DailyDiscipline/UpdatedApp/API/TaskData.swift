//
//  TaskData.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-28.
//

import Foundation

struct TaskData: Decodable {
    let activity: String
    let type: String
    let key: Int
}
