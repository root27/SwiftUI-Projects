//
//  ContentView.swift
//  SwiftUI_APICall
//
//  Created by OGUZHAN DOGAN on 23.01.2023.
//

import SwiftUI




struct Quote: Codable {
    var postId: Int
    var name: String
    var email: String
    var body: String
}


struct ContentView: View {
    
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.postId){quote in
                
                VStack(alignment: .leading){
                    Text(quote.name)
                        .font(.headline)
                    Text(quote.email)
                        .font(.body)
                  
                }
                
            }
            
            .navigationTitle("Comments")
        }
       
            .task {
                await loadData()
                }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            print("Invalid url")
            return
        }
 
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodedResponse
            }
        }
        catch {
            print("Invalid data")
        }
            
    }
    
    func postData(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            print("Invalid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "userId": 1,
            "title": "Hello World",
            "body": "API Test"
        
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _ ,error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Success:\(response)")
            }
            
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
