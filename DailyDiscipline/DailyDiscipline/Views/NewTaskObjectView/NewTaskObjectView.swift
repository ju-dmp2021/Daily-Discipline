//
//  NewTaskObjectView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct NewTaskObjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    var coreDataManager = CoreDataManagerTaskObject.shared
    @State var taskObjectText: String = ""
    @State var selectedPriority: FrequencyPicker = .daily
    @State var selectedCategory = "Fitness"
    
    @State var selectedPresetCategory = ""
    @State var showPresetTasks = false
    @State var showPresetTasksCategories = false
    @State var selectedPresetItem = "Go to the gym"
    
    @State var categoryToImage = CategoryToImage()
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundImageView(color: .black)
                VStack(spacing: 20) {
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    if !showPresetTasksCategories {
                        TextFieldView(taskObjectText: $taskObjectText, selectedCategory: $selectedCategory)
                    }
                    if showPresetTasksCategories {
                        PresetCategoryView(showPresetTasks: $showPresetTasks, selectedPresetCategory: $selectedPresetCategory)
                    }
                    
                    if showPresetTasks {
                        PresetTasksView(selectedPresetCategory: $selectedPresetCategory, selectedPresetItem: $selectedPresetItem)
                    }
                    
                    Spacer()
                    ChoosePresetCategoryButton(showPresetTasks: $showPresetTasks, showPresetTasksCategories: $showPresetTasksCategories)
                    SubmitButton(showPresetTasks: $showPresetTasks, showPresetTasksCategories: $showPresetTasksCategories, selectedPriority: $selectedPriority, selectedCategory: $selectedCategory, selectedPresetItem: $selectedPresetItem, selectedPresetCategory: $selectedPresetCategory, taskObjectText: $taskObjectText)
                }
                .padding(.top)
                .toolBarViewOneButton(leftButton: "backButton", bgColor: .black)
                .foregroundColor(.white)
                .accentColor(.white)
            }
        }
    }
}

struct NewTaskObjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskObjectView()
    }
}
