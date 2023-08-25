//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-17.
//

import SwiftUI

/*
 MVVM Arquitecture
 
 M- Model data
 V- View (UI)
 VM - View Model, manages the model data
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel) //para que toda la aplicacion pueda ver esa variable
            
        }
    }
}
