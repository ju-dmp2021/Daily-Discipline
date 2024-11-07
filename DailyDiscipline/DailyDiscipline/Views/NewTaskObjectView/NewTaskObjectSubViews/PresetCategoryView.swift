//
//  PresetCategoryView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct PresetCategoryView: View {
    
    @Binding var showPresetTasks: Bool
    @Binding var selectedPresetCategory: String
    @State var categoryToImage = CategoryToImage()
    @State var storedData = StoredData()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(spacing: 14) {
                ForEach(storedData.categories, id: \.self) { category in
                    Button {
                        showPresetTasks = true
                        selectedPresetCategory = category
                    } label: {
                        VStack{
                            Text(category)
                            Image(systemName: "\(categoryToImage.getCategoryImage(category: category))")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                        }
                        .frame(width:130, height: 130)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 2))
                    }
                }
            }
            .padding(.leading)
        })
    }
}
