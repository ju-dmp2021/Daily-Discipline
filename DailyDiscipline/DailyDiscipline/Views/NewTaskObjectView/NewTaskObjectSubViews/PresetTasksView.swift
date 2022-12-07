//
//  PresetTasksView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct PresetTasksView: View {
    
    @Binding var selectedPresetCategory: String
    @Binding var selectedPresetItem: String
    @State var storedTasksAndCategories = StoredData()
    
    var body: some View {
        Picker("", selection: $selectedPresetItem) {
            ForEach(storedTasksAndCategories.presetTasks) { task in
                if task.category == selectedPresetCategory{
                    Text(task.name)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .tag(task.name)
                }
            }
        }
        .pickerStyle(.wheel)
    }
}
