//
//  ListViewModel.swift
//  ToDoList
// Clase para datos dinamicos donde el arrgelo que se va a ir modificando va a ser actualizado

//  Created by Montserrat Gomez on 2023-08-22.
//

import Foundation

class ListViewModel: ObservableObject {
    
	@Published var items: [ItemModel] = []{ //Para que toda la aplicacion este atenta a la variable
		didSet{ //cada vez que se cambie el valor del arreglo
			saveItems()
		}
	}
	let itemsKey: String = "items_list"
	
    init(){
        getItems()
    }
    
	//METODOS CRUD
	
    func getItems() {
        
//        let newItems = [
//            ItemModel(title: "First Item", isComplited: false),
//                        ItemModel(title: "Second Item", isComplited: true),
//                        ItemModel(title: "Third Item", isComplited: false),
//        ]
//        items.append(contentsOf: newItems)
		
		guard
			let data = UserDefaults.standard.data(forKey: itemsKey),
			let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
		else { return}
		
		self.items = saveItems
		
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
	
	func updateItem(item: ItemModel){
		//primero hay que encontrarlo en el array
		
		// if let index = items.firstIndex { (existingItem) -> Bool in
		//	return existingItem.id == item.id
		//}{ es lo mismo pero version larga
		
		if let index = items.firstIndex(where: {$0.id == item.id}){
			items[index] = item.updateCompletion() //llama al metodo para actualizar
		}
	}
	
	func saveItems(){
		if let encodedData = try? JSONEncoder().encode(items){
			UserDefaults.standard.set(encodedData, forKey:itemsKey) //para guardar los datos en el celular, pero solo para pocos datos
			
		}
	}
}
	
