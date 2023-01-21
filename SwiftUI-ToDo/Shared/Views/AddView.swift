//
//  AddView.swift
//  SwiftUI-ToDo List (iOS)
//
//  Created by OGUZHAN DOGAN on 21.01.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textString: String = ""
    
    var body: some View {
        ScrollView{
        
            VStack{
                TextField("Type something here", text: $textString )
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                    
            }
            .padding(14)
        }
        .navigationTitle("Add Item 🪄")
    }
    
    func saveButtonPressed(){
        listViewModel.addItem(title: textString)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddView()
        }
        .environmentObject(ListViewModel())
    }
}
