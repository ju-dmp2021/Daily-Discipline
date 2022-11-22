//
//  NewTaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct NewTaskView: View {
    
    @State private var textInput: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var singleTaskListViewModel: SingleTaskListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
               //     Navbar(leftIcon: "chevron.left", text: "Add new task!", rightIcon: "gearshape.fill")
                    
                    
                    // Testing this solution instead of code above. Starts here
                    HStack {
                        backButton
                        Spacer()
                        Text("Profile")
                            .font(.title)
                        Spacer()
                        backButton
                    }
                    .foregroundColor(.white)
                    .frame(height: 80)
                    .background(Color("NavbarBlue"))
                    // ends here
                    
                    
                    Spacer()
                    
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
                        FrequencyCategoryButtons()
                        HStack {
                            Spacer()
                            Button {
                                singleTaskListViewModel.addSingleTask(title: textInput)
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Add task!")
                                    .frame(width: 304)
                                    .padding(12)
                                    .background(Color("NavbarBlue"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }

                    }
                    .padding()
                    
                    Spacer()
                    WaveBottom(isAtMyTasks: false)
                }
            }
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
}
