//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-31.
//

import SwiftUI

struct NoItemsView: View {
	
	@State var animate: Bool = false
	
    var body: some View {
		ScrollView{
			VStack(spacing: 10){
				Text("No items, sorry!").bold()
					.font(.title)
				Text("Try to add something!")
				NavigationLink(destination: AddView(), label: { Text("Add something 🌝")
						.frame(width: 300, height: 55)
						.font(.headline)
						.foregroundColor(.white)
						.background(Color.blue)
						.cornerRadius(10)

				})
			}
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	func addAnimation(){
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
			withAnimation(.easeInOut){
				animate.toggle()
			}
		}
	}
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView{
			NoItemsView()
				.navigationTitle("Title")
			
		}
    }
}
