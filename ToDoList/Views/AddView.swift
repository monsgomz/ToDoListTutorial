//
//  AddView.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldItem: String = ""
	
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false
    
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
				})
			}.padding(10)
		}
		.navigationTitle("Add item 🍃")
		.alert(isPresented: $showAlert, content: getAlert)
			
		
	}
    
    func saveButton() {
		if textIsAppropiaded() {
			listViewModel.addItem(title: textFieldItem)
			presentationMode.wrappedValue.dismiss()
		}
		
		
    }
	
	func textIsAppropiaded() -> Bool {
		if(textFieldItem.count < 3) {
			alertTitle = "Texto muy corto 🙃"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
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
