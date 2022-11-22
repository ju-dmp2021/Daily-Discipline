//
//  DailyDisciplineApp.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

@main

struct DailyDisciplineApp: App {
    
    @StateObject var singleTaskListViewModel: SingleTaskListViewModel = SingleTaskListViewModel()
    @StateObject var multipleTaskListViewModel: MultipleTaskListViewModel = MultipleTaskListViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(singleTaskListViewModel)
                    .environmentObject(multipleTaskListViewModel)
                
                GeometryReader { reader in
                    Color("NavbarTopBlue")
                        .frame(height: reader.safeAreaInsets.top, alignment: .top)
                        .ignoresSafeArea()
                }
            }
        }
    }
}
