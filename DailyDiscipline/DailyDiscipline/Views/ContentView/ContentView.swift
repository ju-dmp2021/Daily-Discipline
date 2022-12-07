//
//  ContentView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct ContentView: View {
    
    var taskObjectManager = CoreDataManagerTaskObject.shared
    var userLevelManager = CoreDataManagerUserLevel.shared
    @State var taskObjectText: String = ""
    @State private var showNewTaskSheet = false
    @StateObject var taskObjectViewModel = TaskObjectViewModel()
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    @State var selectedPriority: FrequencyPicker = .daily
    
    @State var categoryToImage = CategoryToImage()
    
    init(){
            UISegmentedControl.appearance().selectedSegmentTintColor = .white
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
            UISegmentedControl.appearance().backgroundColor = .black
        }
    
    var body: some View {
        
        NavigationStack{
            
            ZStack(alignment: .top){
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    DateView()
                    
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    
                    if taskObjectViewModel.dataArr.count != 0 {
                        List {
                            ForEach(taskObjectViewModel.dataArr) { task in
                                HStack {
                                    Button {
                                        task.isComplete.toggle()
                                        userLevelViewModel.addUserExperience(points: task.points)
                                    } label: {
                                        if task.isComplete == true {
                                            Image(systemName: "circle.fill")
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                    }
                                    Text(task.name ?? "No name")
                                    Text(task.frequency ?? "No frequency")
                                    Spacer()
                                    Image(systemName:categoryToImage.getCategoryImage(category: task.category ?? ""))
                                }
                            }
                            .onDelete(perform: taskObjectManager.deleteTaskObject)
                            .listRowBackground(Color.clear)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    Spacer()
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
                .sheet(isPresented: $showNewTaskSheet) {
                    NewTaskObjectView()
                }
            }
            .toolBarViewTwoButtons(leftButton: "ProfileView", rightButton: "SettingsView")
            .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
