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
    
    @State var selectedPresetCategory = "Test"
    @State var showPresetTasks = false
    @State var showPresetTasksCategories = false
    @State var selectedPresetItem = "Go to the gym"
    
    @State var categoryToImage = CategoryToImage()
    @State var randomTaskText = "Choose a category"
    
    @State var showRandomTasksCategories = false
    @StateObject var dataModel = DataModel()
    
    let presetTasks: [TaskTemplate] = [
    TaskTemplate(name: "Go to the gym", category: "Fitness"),
    TaskTemplate(name: "Do Yoga", category: "Fitness"),
    TaskTemplate(name: "Stretch", category: "Fitness"),
    TaskTemplate(name: "Go for a run", category: "Fitness"),
    TaskTemplate(name: "Go for a walk", category: "Fitness"),
    TaskTemplate(name: "Do body weight exersices", category: "Fitness"),
    TaskTemplate(name: "Buy Groceries", category: "Chores"),
    TaskTemplate(name: "Clean the apartment", category: "Chores"),
    TaskTemplate(name: "Clean your room", category: "Chores"),
    TaskTemplate(name: "Clean the house", category: "Chores"),
    TaskTemplate(name: "Do the laundry", category: "Chores"),
    TaskTemplate(name: "Wash the car", category: "Chores"),
    TaskTemplate(name: "Take out the trash", category: "Chores"),
    TaskTemplate(name: "Pay the bills", category: "Chores"),
    TaskTemplate(name: "Walk the dog", category: "Health"),
    TaskTemplate(name: "Go for a walk", category: "Health"),
    TaskTemplate(name: "Call someone important", category: "Health"),
    TaskTemplate(name: "Write in your gratitude journal", category: "Health"),
    TaskTemplate(name: "Meditate", category: "Health"),
    TaskTemplate(name: "Eat a fruit", category: "Health"),
    TaskTemplate(name: "Cook a meal", category: "Cooking"),
    TaskTemplate(name: "Meal prep", category: "Cooking"),
    TaskTemplate(name: "Bake bread", category: "Cooking"),
    TaskTemplate(name: "Make dessert", category: "Cooking"),
    TaskTemplate(name: "Read", category: "Study"),
    TaskTemplate(name: "Study one hour", category: "Study"),
    TaskTemplate(name: "Study for a test", category: "Study"),
    TaskTemplate(name: "Go to School", category: "Study"),
    TaskTemplate(name: "Watch a movie", category: "Recreational"),
    TaskTemplate(name: "Watch an episode of a show", category: "Recreational"),
    TaskTemplate(name: "Play a video game", category: "Recreational"),
    TaskTemplate(name: "Play a board game", category: "Recreational"),
    TaskTemplate(name: "Listen to music", category: "Recreational"),
    TaskTemplate(name: "Play music", category: "Recreational"),
    ]

    let categories = ["Fitness", "Chores", "Cooking", "Study", "Recreational"]
    let randomTaskCategories = ["Busywork", "Cooking","Relaxation", "Recreational", "Random"]
    
    
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
                Image("bgBlack")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    if !showPresetTasksCategories && !showRandomTasksCategories {
                        HStack {
                            TextField("Add taskobject here...", text: $taskObjectText)
                            
                            Picker("", selection: $selectedCategory) {
                                ForEach(categories, id: \.self) {
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
                    
                    
                    
                    if showPresetTasksCategories {
                        ScrollView(.horizontal, showsIndicators: true, content: {
                            HStack(spacing: 14) {
                                ForEach(categories, id: \.self) { category in
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
                    
                    if showRandomTasksCategories {
                        ScrollView(.horizontal, showsIndicators: true, content: {
                            HStack(spacing: 14) {
                                ForEach(randomTaskCategories, id: \.self) { category in
                                    Button {
                                        dataModel.getTaskFromCategory(type: category)
                                        
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
                        .onChange(of: dataModel.activity) { newValue in
                            randomTaskText = dataModel.activity ?? ""
                                }
                        Text(randomTaskText)
                    }
                    
                    if showPresetTasks {
                        Picker("", selection: $selectedPresetItem) {
                            ForEach(presetTasks) { task in
                                if task.category == selectedPresetCategory{
                                    Text(task.name)
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                        .tag(task.name)
                                }
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Spacer()
                    Button {
                        showPresetTasksCategories.toggle()
                        showRandomTasksCategories = false
                        showPresetTasks = false
                    } label: {
                        Text("Choose a preset category!")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 4)
                        )
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    
                    Button {
                        showRandomTasksCategories.toggle()
                        showPresetTasksCategories = false
                        showPresetTasks = false
                    } label: {
                        Text("Get a random task!")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 4)
                        )
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    
                    Button {
                        if showPresetTasks {
                            coreDataManager.addPresetTaskObject(name: selectedPresetItem, category: selectedPresetCategory, frequency: selectedPriority.rawValue)
                        } else if showRandomTasksCategories{
                            coreDataManager.addTaskObject(name: dataModel.activity ?? "Error", category: dataModel.type ?? "Error", frequency: selectedPriority.rawValue)
                    } else if !showPresetTasksCategories {
                            guard !taskObjectText.isEmpty else { return }
                            coreDataManager.addTaskObject(name: taskObjectText, category: selectedCategory, frequency: selectedPriority.rawValue)
                        } else { return }
                        dismiss()
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.top)
                .toolBarViewOneButton(leftButton: "backButton")
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


struct TaskTemplate: Identifiable {
    var id = UUID()
    
    var name: String
    var category: String
}
