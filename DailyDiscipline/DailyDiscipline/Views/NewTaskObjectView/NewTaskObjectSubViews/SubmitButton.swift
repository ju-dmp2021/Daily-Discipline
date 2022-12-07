//
//  SubmitButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct SubmitButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showPresetTasks: Bool
    @Binding var showPresetTasksCategories: Bool
    @Binding var selectedPriority: FrequencyPicker
    @Binding var selectedCategory: String
    @Binding var selectedPresetItem: String
    @Binding var selectedPresetCategory: String
    @Binding var taskObjectText: String
    @Binding var showRandomTasksCategories: Bool
    @Binding var randomTaskText: String
    @Binding var selectedApiCategory: String
    
    var coreDataManager = CoreDataManagerTaskObject.shared
    
    var body: some View {
        Button {
            if showPresetTasks {
                coreDataManager.addPresetTaskObject(name: selectedPresetItem, category: selectedPresetCategory, frequency: selectedPriority.rawValue)
            } else if showRandomTasksCategories {
                coreDataManager.addTaskObject(name: randomTaskText, category: selectedApiCategory, frequency: selectedPriority.rawValue)
            } else if !showPresetTasksCategories {
                guard !taskObjectText.isEmpty else { return }
                coreDataManager.addTaskObject(name: taskObjectText, category: selectedCategory, frequency: selectedPriority.rawValue)
            } else { return }
            dismiss()
        } label: {
            Text("Submit")
                .font(.headline)
                .foregroundColor(.black)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)

        }
        .padding(.horizontal, 30)
    }
}
