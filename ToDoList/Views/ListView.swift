//
//  ListView.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-17.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
		ZStack{
			if listViewModel.items.isEmpty {
				NoItemsView()
					.transition(AnyTransition.opacity.animation(.easeIn))
			} else{
				List {
					ForEach(listViewModel.items) { item in
						ListRowView(item: item)
							.onTapGesture {
								withAnimation(.linear){
									listViewModel.updateItem(item: item)
								}
							}
					}.onDelete(perform: listViewModel.deleteItem)
						.onMove(perform: listViewModel.moveItem)
				}.listStyle(.plain)
			}
		}
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading,
                        content: {
                            EditButton()}
            )
                        
            ToolbarItem(placement: .navigationBarTrailing,
                        content: {
                NavigationLink("Add", destination: AddView())
                
            })
        }
        .listStyle(.sidebar)
            
        }
//        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: Text("Destination"))
//        )
    
    
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


