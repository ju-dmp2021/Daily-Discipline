//
//  ToolBarView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct ToolBarView: ViewModifier {
    
    var leftButton: String = ""
    var bgColor: Color = .white
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if leftButton == "ProfileView" {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                    } else if leftButton == "backButton" {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
            .foregroundColor(bgColor == .white ? .black : .white)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Daily Discipline")
            .navigationBarTitleDisplayMode(.inline)
    }
}

extension View {
    func toolBarView(leftButton: String, bgColor: Color) -> some View {
        modifier(ToolBarView(leftButton: leftButton, bgColor: bgColor))
    }
}
