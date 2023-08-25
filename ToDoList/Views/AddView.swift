//
//  AddView.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldItem: String = ""
    
    var body: some View {
       
        
        ScrollView {
            VStack{
                TextField("Add something ..", text: $textFieldItem)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color("Primary"))
                    .cornerRadius(6)
                
                Button(action: saveButton, label: {
                    Text("Save".uppercased())
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(Color("Secondary"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(2)
                    }
                )
            }.navigationTitle("Add item 🍃")
            }
        .padding(10)
            
    }
    
    func saveButton() {
        listViewModel.addItem(title: textFieldItem)
            dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
