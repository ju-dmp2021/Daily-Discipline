//
//  File.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct GetRandomTaskButton: View {
    
    @Binding var showPresetTasksCategories: Bool
    @Binding var showRandomTasksCategories: Bool
    @Binding var showPresetTasks: Bool

    var body: some View {
        Button {
            showRandomTasksCategories.toggle()
            showPresetTasksCategories = false
            showPresetTasks = false
        } label: {
            Text("Get a random task!")
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
