//
//  AddNewTaskButton.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct AddNewTaskButton: View {
    
    @Binding var showNewTaskSheet: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                showNewTaskSheet.toggle()
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 50))
                    .padding(.trailing, 40)
            }
        }
    }
}


struct AddNewTaskButton_Previews: PreviewProvider {
    @State static var showNewTaskSheet: Bool = false
    static var previews: some View {
        AddNewTaskButton(showNewTaskSheet: $showNewTaskSheet)
    }
}
