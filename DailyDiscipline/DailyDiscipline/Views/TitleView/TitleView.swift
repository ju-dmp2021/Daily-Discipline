//
//  TitleView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct TitleView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var storedData = StoredData()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                BackgroundImageView(color: .black)
                VStack{
                    Text("Titles!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            ForEach(storedData.titles) { title in
                                TitleListView(title: title)
                            }
                        }
                    }
                }
                .toolBarViewOneButton(leftButton: "backButton", bgColor: .black)
                .foregroundColor(.white)
                .accentColor(.white)
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
