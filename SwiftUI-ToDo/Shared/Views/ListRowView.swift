//
//  ListRowView.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import SwiftUI

struct ListRowView: View {
    
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    
    static var item1 = ItemModel(title: "First title", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
