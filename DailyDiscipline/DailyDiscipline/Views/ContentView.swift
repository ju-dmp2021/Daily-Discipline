//
//  ContentView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct ContentView: View {
    
    var coreDataManager = CoreDataManager.shared
    @State var taskObjectText: String = ""
    @State private var showNewTaskSheet = false
    @StateObject var viewModel = ViewModel()
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
                    Text(Date.now, format: .dateTime.weekday())
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                        .padding(.top)
                        .textInputAutocapitalization(.words)
                    Text(Date.now, format: .dateTime.day(.defaultDigits))
                        .fontDesign(.serif)
                        .font(.system(size: 75))
                        .underline()
                        .offset(x: 0, y: -5)
                    Text(Date.now, format: .dateTime.month(.wide))
                        .fontDesign(.serif)
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .textInputAutocapitalization(.words)
                    
                    
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    if viewModel.dataArr.count != 0 {
                        List {
                            ForEach(viewModel.dataArr) { task in
                                HStack {
                                    Button {
                                        task.isComplete.toggle()
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
                            .onDelete(perform: coreDataManager.deleteTaskObject)
                            .listRowBackground(Color.clear)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    Spacer()
                    Button {
                        showNewTaskSheet.toggle()
                    } label: {
                        HStack {
                            Spacer()
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
                ToolbarItem {
                    Button {
                                                    } label: {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "person.fill")
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
