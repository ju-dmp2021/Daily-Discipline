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
    @StateObject var taskObjectViewModel = TaskObjectViewModel()
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    
    @State var taskObjectText: String = ""
    @State private var showNewTaskSheet = false
    @State var selectedPriority: FrequencyPicker = .daily
    @State var categoryToImage = CategoryToImage()
    @State var newDateModel = NewDateModel()
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                BackgroundImageView(color: .white)
                VStack{
                    DateView()
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    List {
                        ForEach(selectedPriority.rawValue == "Daily" ? taskObjectViewModel.dailyArray : selectedPriority.rawValue == "Weekly" ? taskObjectViewModel.weeklyArray : selectedPriority.rawValue == "Monthly" ? taskObjectViewModel.monthlyArray : []) { task in
                            TaskObjectView(taskObject: task)
                        }
                        .onDelete { indexSet in
                            taskObjectManager.deleteTaskObject(indexSet: indexSet, frequency: selectedPriority.rawValue)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .opacity(selectedPriority.rawValue == "Daily" && taskObjectViewModel.dailyArray.count != 0 ? 1 : selectedPriority.rawValue == "Weekly" && taskObjectViewModel.weeklyArray.count != 0 ? 1 : selectedPriority.rawValue == "Monthly" && taskObjectViewModel.monthlyArray.count != 0 ? 1 : 0)
                    .scrollContentBackground(.hidden)
                    Spacer()
                    AddNewTaskButton(showNewTaskSheet: $showNewTaskSheet)
                }
                .sheet(isPresented: $showNewTaskSheet) {
                    NewTaskObjectView()
                }
            }
            .toolBarViewTwoButtons(leftButton: "ProfileView", rightButton: "SettingsView", bgColor: .white)
            .foregroundColor(.black)
            .onChange(of: selectedPriority) { newValue in
                if newDateModel.monthHasChanged() {
                    print("Yes")
                    for task in taskObjectViewModel.monthlyArray{
                        task.isComplete = false
                        taskObjectManager.saveData()
                    }
                }
                if newDateModel.weekHasChanged() {
                    for task in taskObjectViewModel.weeklyArray{
                        task.isComplete = false
                        taskObjectManager.saveData()
                    }
                }
                if newDateModel.dayHasChanged() {
                    print("Yes")
                    for task in taskObjectViewModel.dailyArray{
                        task.isComplete = false
                        taskObjectManager.saveData()
                    }
                    newDateModel.saveDate()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
