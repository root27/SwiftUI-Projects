//
//  SwiftUI_ToDo_ListApp.swift
//  Shared
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import SwiftUI

@main
struct SwiftUI_ToDo_ListApp: App {
    
    
  @StateObject  var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
