//
//  ListView.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import SwiftUI

struct ListView: View {
    
    
    @State var Items: [String] = [
        "First Title",
        "Second Title",
        "Third Title"
    ]
    
    var body: some View {
        List{
            ForEach(Items, id: \.self){ item in
                ListRowView(title:item)
            }
        
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
    }
}


