//
//  ItemModel.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
