//
//  RegulareSubmitButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-08.
//

import SwiftUI

struct RegularSubmitButton: View {
    
    var coreDataManager = CoreDataManagerTaskObject.shared
    @Environment(\.dismiss) private var dismiss
    
    @Binding var taskObjectText: String
    @Binding var showPresetTasksCategories: Bool
    @Binding var showRandomTasksCategories: Bool
    @Binding var selectedPriority: FrequencyPicker
    @Binding var selectedCategory: String
    
    var body: some View {
        Button {
            guard !taskObjectText.isEmpty else { return }
            coreDataManager.addTaskObject(name: taskObjectText, category: selectedCategory, frequency: selectedPriority.rawValue)
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
