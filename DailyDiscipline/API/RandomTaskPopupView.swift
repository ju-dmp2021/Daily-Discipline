//
//  RandomTaskPopup.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-12-02.
//

import SwiftUI

struct RandomTaskPopupView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataModel = DataModel()
    @Binding var textInput: String
    @Binding var hasPressedRandomTask: Bool
    
    var body: some View{
        ZStack(){
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button {
                    dataModel.getTaskFromCategory(type: "recreational")
                } label: {
                    Text("Recreational")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "busywork")
                } label: {
                    Text("Busywork")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "relaxation")
                } label: {
                    Text("Relaxation")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "cooking")
                } label: {
                    Text("Cooking")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "")
                } label: {
                    Text("Random")
                }.foregroundColor(.white)
                    .padding()
            }
        }
        .onChange(of: dataModel.activity) { newValue in
            textInput = dataModel.activity ?? ""
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct RandomTaskPopup_Previews: PreviewProvider {
    @State static var textInput: String = ""
    @State static var hasPressedRandomTask: Bool = false
    static var previews: some View {
        RandomTaskPopupView(textInput: $textInput, hasPressedRandomTask: $hasPressedRandomTask)
    }
}
