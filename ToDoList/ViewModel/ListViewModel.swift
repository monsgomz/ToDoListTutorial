//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        
        let newItems = [
            ItemModel(title: "First Item", isComplited: false),
                        ItemModel(title: "Second Item", isComplited: true),
                        ItemModel(title: "Third Item", isComplited: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplited: false)
        items.append(newItem)
    }
}
