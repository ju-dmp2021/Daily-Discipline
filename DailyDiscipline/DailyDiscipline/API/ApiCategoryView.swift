//
//  ApiCategoryView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct ApiCategoryView: View {
    
    @StateObject var apiDataModel = ApiDataModel()
    @State var categoryToImage = CategoryToImage()
    @State var storedData = StoredData()
    @Binding var randomTaskText: String
    @Binding var selectedApiCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(spacing: 14) {
                ForEach(storedData.randomTaskCategories, id: \.self) { category in
                    Button {
                        apiDataModel.getTaskFromCategory(type: category)
                        selectedApiCategory = category
                    } label: {
                        VStack{
                            Text(category)
                            Image(systemName: "\(categoryToImage.getCategoryImage(category: category))")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                        }
                        .frame(width: 130, height: 130)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 2))
                    }
                }
            }
            .padding(.leading)
        })
        .onChange(of: apiDataModel.activity) { newValue in
            randomTaskText = apiDataModel.activity ?? ""
        }
        Spacer()
        Text(randomTaskText)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(.headline)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 3))
            .background(
                LinearGradient(
                    colors: [.white, .black, .white],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(20)
                .opacity(0.8)
            )
            .padding(.horizontal, 30)
    }
}
