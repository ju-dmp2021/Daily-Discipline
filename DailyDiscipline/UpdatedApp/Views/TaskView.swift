//
//  TaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-30.
//

import SwiftUI

struct CoreDataRelationships: View {
    
    @State var selectedPriority: FrequencyPicker = .daily
    @StateObject var vm = CoreDataRelationshipViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            HStack {
                profileButton
                    .padding()
                Spacer()
                Text("My tasks!")
                    .font(.title)
                Spacer()
                settingButton
                    .padding()
            } 
            .foregroundColor(.white)
            .frame(height: 80)
            .background(Color("NavbarBlue"))
            ScrollView {
                VStack {
                    NavigationLink {
                        AddNewTaskView()
                    } label: {
                        Text("Add new task")
                    }
                    
                    PickerFrequency(selectedFrequency: $selectedPriority)
                    
                    VStack(alignment: .leading){
                       // List {
                            if selectedPriority == .daily {
                            Text("Today's tasks!")
                                ForEach(vm.taskObjects) { object in
                                    if object.frequency?.name == "Daily" {
                                        TaskObjectViews(entity: object)
                                        
                                    }
                                }
                                .onDelete(perform: vm.deleteTask)
                            } else if selectedPriority == .weekly {
                                Text("Weekly tasks!")
                                ForEach(vm.taskObjects) { object in
                                    if object.frequency?.name == "Weekly" {
                                        TaskObjectViews(entity: object)
                                    }
                                }
                                .onDelete(perform: vm.deleteTask)
                            } else if selectedPriority == .monthly {
                                Text("Monthly tasks!")
                                ForEach(vm.taskObjects) { object in
                                    if object.frequency?.name == "Monthly" {
                                        TaskObjectViews(entity: object)
                                    }
                                }
                                .onDelete(perform: vm.deleteTask)
                            }
                       // }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear(){
                        vm.getTaskObjects()
                    }
                }
            }
        }
    }
}

struct CoreDataRelationships_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationships()
    }
}

struct TaskObjectViews: View {
    
    let entity: TaskObject
    @StateObject var vm = CoreDataRelationshipViewModel()
    @State private var isPresentingConfirm: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button {
                    if !entity.isComplete {
                        isPresentingConfirm = true
                    }
                } label: {
                    if entity.isComplete {
                        Image(systemName: "checkmark.circle")
                    } else {
                        Image(systemName: "circle")
                    }
                }
                .confirmationDialog("Are you sure?",
                isPresented: $isPresentingConfirm) {
                    Button("Confirm") {
                        entity.isComplete = true
                        vm.updateUserLevel(points: entity.points)
                   //     level.addPoints(points: Int(entity.points))
                        vm.save()
                    }
                } message: {
                    Text("You cannot undo this action")
                }
                Text("\(entity.mainTask ?? "")")
                    .bold()
            }
            if let subTasks = entity.subTasks?.allObjects as? [SubTask] {
                ForEach(subTasks) { subTask in
                    HStack {
                        Button {
                            subTask.isComplete.toggle()
                            vm.save()
                        } label: {
                            if subTask.isComplete {
                                Image(systemName: "checkmark.circle")
                            } else {
                                Image(systemName: "circle")
                            }
                        }
                        Text(subTask.name ?? "")
                    }
                    .padding(.leading)
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


extension CoreDataRelationships {
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
    
    private var profileButton: some View {
        NavigationLink {
            ProfileView()
        } label: {
            Image(systemName: "person.crop.circle.fill")
        }

    }
}
