//
//  NewTaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI
import Combine

class TEST: ObservableObject {
    @Published var daily: [TaskObject] = [TaskObject(mainTask: Task(task: "AA", isComplete: false), subTask: [Task(task: "SS", isComplete: false)])]
    
    
    func addTask(object: TaskObject) {
        daily.append(object)
    }
    
    func getTask(object: TaskObject) {
        // Get task??
    }
}

struct Task {
    var task: String
    var isComplete: Bool = false
  //  var isPreset: Bool = false
    
    init(task: String, isComplete: Bool) {
        self.task = task
        self.isComplete = isComplete
    }
}

struct TaskObject: Identifiable {
    let id = UUID()
    var mainTask: Task
    var subTask: [Task]
}

struct NewTaskView: View {
    
    @State private var textInput: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedPriority: Frequency = .weekly
    
    // Testing Publisher
    @StateObject var stuff = TEST()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {

                    HStack {
                        backButton
                            .padding()
                        Spacer()
                        Text("Add new task!")
                            .font(.title)
                        Spacer()
                        settingButton
                            .padding()
                    }
                    .foregroundColor(.white)
                    .frame(height: 80)
                    .background(Color("NavbarBlue"))
                    
                    Spacer()
                    
                    // Testing Publisher
                    ForEach(stuff.daily) { item in
                        Text("\(item.mainTask.task)")
                    }
                    //
                    
                    VStack (alignment: .leading){
                        Text("Task")
                            .font(.title)
                        TextField(
                          "Describe your task...",
                          text: $textInput
                        )
                        .underline()
                        HStack {
                            
                            Button {
                                stuff.addTask(object: TaskObject(mainTask: Task(task: "YEYE", isComplete: false), subTask: [Task(task: "PFF", isComplete: false)]))
                            } label: {
                                Image(systemName: "plus.circle")
                                    .tint(.black)
                            }
                            Text("Add subtask...")
                                .opacity(0.2)
                        }
                        
                        GetRandomTask()
                        HStack {
                            Spacer()
                            Text("How frequently?")
                            Spacer()
                        }
                        PickerFrequency(selectedFrequency: $selectedPriority)
                        addButton

                    }
                    .padding()
                    
                    Spacer()
                    WaveBottom(isAtMyTasks: false)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {

    static var previews: some View {
        ZStack {
            NewTaskView()
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}

extension NewTaskView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var settingButton: some View {
        Button {
            
        } label: {
            Image(systemName: "gearshape.fill")
        }
    }
    private var addButton: some View {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add task!")
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(Color("NavbarBlue"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
    }
}
