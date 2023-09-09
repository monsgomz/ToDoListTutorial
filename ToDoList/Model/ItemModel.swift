//
//  ItemModel.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-22.
//

import Foundation

//Inmutable Struct, todas sus variables son let para eviatr errores, codable para poder transformar la informacion

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplited: Bool
	
	init(id:String = UUID().uuidString, title: String, isComplited: Bool) {
		self.title = title
		self.isComplited = isComplited
		self.id = id
	}
	
	func updateCompletion() -> ItemModel{
		return ItemModel(id: id, title: title, isComplited: !isComplited)
	} //solo mediante esta funcion se pueden cambiar las variables
	
}

