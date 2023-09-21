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
						.frame(width: animate ? 250 : 300, height: 55)
						.font(.headline)
						.foregroundColor(.white)
						.background(animate ? Color("ActiveColor") : Color("Secondary") )
						.cornerRadius(10)
				})
				.padding(20)
				.shadow(color: animate ? Color("ActiveColor") : Color("Secondary"), radius: 10, x: 0.0, y: animate ? 50 : 0.0)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
			}
			.padding(40)
			.onAppear(perform: addAnimation) //cada que la pagina aparezca
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	func addAnimation(){
		guard !animate else { return } //para que no se ejecute cuando sea true
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
