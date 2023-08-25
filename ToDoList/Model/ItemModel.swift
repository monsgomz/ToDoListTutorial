//
//  ItemModel.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-22.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplited: Bool
}
