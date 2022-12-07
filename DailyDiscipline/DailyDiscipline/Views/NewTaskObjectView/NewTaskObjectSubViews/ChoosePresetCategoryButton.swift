//
//  ChoosePresetCategoryButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct ChoosePresetCategoryButton: View {
    
    @Binding var showPresetTasks: Bool
    @Binding var showPresetTasksCategories: Bool
    
    var body: some View {
        Button {
            showPresetTasksCategories.toggle()
            showPresetTasks = false
        } label: {
            Text("Choose a preset category!")
        }
        .font(.headline)
        .foregroundColor(.white)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 4)
        )
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
}
