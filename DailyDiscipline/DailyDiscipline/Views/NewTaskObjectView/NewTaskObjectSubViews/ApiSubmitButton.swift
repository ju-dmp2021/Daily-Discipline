//
//  ApiSubmitButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-08.
//

import SwiftUI

struct ApiSubmitButton: View {
    
    @Environment(\.dismiss) private var dismiss
    var coreDataManager = CoreDataManagerTaskObject.shared
    @Binding var selectedApiCategory: String
    @Binding var randomTaskText: String
    @Binding var selectedPriority: FrequencyPicker
    
    var body: some View {
        Button {
            if selectedApiCategory != "" {
                coreDataManager.addTaskObject(name: randomTaskText, category: selectedApiCategory, frequency: selectedPriority.rawValue)
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
