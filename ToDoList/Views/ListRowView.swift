//
//  ListRowView.swift
//  ToDoList
//
//  Created by Montserrat Gomez on 2023-08-17.
//

import SwiftUI

struct ListRowView: View {
    
    //lo que le vamos a pasar cuadno lo llamemos
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isComplited ? "checkmark.circle.fill": "circle").foregroundColor(Color("ActiveColor")).bold()
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)    }
}
struct ListRowView_Previews: PreviewProvider {
    static var  item1 = ItemModel(title: "Firts Item", isComplited: true)
    static var  item2 = ItemModel(title: "Firts Item", isComplited: false)

    static var previews: some View {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
