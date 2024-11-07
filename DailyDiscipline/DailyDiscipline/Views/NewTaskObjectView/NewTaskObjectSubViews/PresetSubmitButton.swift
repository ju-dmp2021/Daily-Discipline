//
//  PresetSubmitButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-08.
//

import SwiftUI

struct PresetSubmitButton: View {
    
    var coreDataManager = CoreDataManagerTaskObject.shared
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedPriority: FrequencyPicker
    @Binding var selectedPresetItem: String
    @Binding var selectedPresetCategory: String
    
    var body: some View {
        Button {
            if selectedPresetCategory != "" {
                coreDataManager.addPresetTaskObject(name: selectedPresetItem, category: selectedPresetCategory, frequency: selectedPriority.rawValue)
                dismiss()
            }
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
