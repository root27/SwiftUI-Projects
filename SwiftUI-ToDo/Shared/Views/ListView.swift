//
//  ListView.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        List{
            ForEach(listViewModel.Items){ item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem
            )
            .onMove(perform: listViewModel.moveItem )
        
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📋")
        .navigationBarItems(leading: EditButton(), trailing:
                                NavigationLink("Add", destination: AddView())
        )
    }
    
    
    
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
        .environmentObject(ListViewModel())
    }
}


