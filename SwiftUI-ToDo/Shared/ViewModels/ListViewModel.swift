//
//  ListViewModel.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import Foundation




class ListViewModel: ObservableObject {
    
    
    @Published var Items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems()
    {
        let newItems = [
            
            ItemModel(title: "First Item", isCompleted: false)
            
        
        ]
        Items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        Items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        Items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        
        Items.append(newItem)
        
    }
}
