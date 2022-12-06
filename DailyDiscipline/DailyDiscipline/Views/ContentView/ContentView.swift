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
    @StateObject var taskObjectViewModel = ViewModel()
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    @State var selectedPriority: FrequencyPicker = .daily
    
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
                                    VStack {
                                        Text(task.name ?? "No name")
                                        Text(task.frequency ?? "No frequency")
                                        Text("Points: \(task.points)")
                                        Text(task.category ?? "No category")
                                        if task.isComplete {
                                            Text("Complete")
                                        } else {
                                            Text("Not Complete")
                                        }
                                    }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person.fill")
                    }
                }
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                }
            }
            .navigationTitle("Daily Discipline")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
