//
//  TextFieldView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var taskObjectText: String
    @Binding var selectedCategory: String
    
    @State var storedTasksAndCategories = StoredData()
    
    var body: some View {
        HStack {
            TextField("Add taskobject here...", text: $taskObjectText)
            Picker("", selection: $selectedCategory) {
                ForEach(storedTasksAndCategories.categories, id: \.self) {
                    Text($0)
                }
            }
            .tint(.black)
        }
        .font(.headline)
        .padding(.leading)
        .frame(height: 55)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(10)
        .padding(.horizontal, 30)
    }
}
