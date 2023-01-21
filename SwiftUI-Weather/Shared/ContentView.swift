//
//  ContentView.swift
//  Shared
//
//  Created by OGUZHAN DOGAN on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var isNight=false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : .white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Izmir")
                    .font(.system(size:32,weight: .medium,design:.default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing:8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:180,height:180)
                    Text("30°")
                        .foregroundColor(.white)
                        .font(.system(size:60,weight:.medium))
                    
                        .padding(.bottom,40)
                    
                    HStack(spacing:20){
                        WeatherofDay(dayofweek: "TUE", imageName: "cloud.sun.fill", degree: 25)
                        
                        WeatherofDay(dayofweek: "WED", imageName: "cloud.sun.rain.fill", degree: 20)
                        
                        WeatherofDay(dayofweek: "THU", imageName: "cloud.sun.bolt.fill", degree: 18)
                        
                        WeatherofDay(dayofweek: "FR", imageName: "cloud.rain.fill", degree: 15)
                        
                        WeatherofDay(dayofweek: "SAT", imageName: "cloud.bolt.rain.fill", degree: 16)
                    }
                    Spacer()
                    
                    Button{
                        isNight.toggle()
                    } label: {
                        Text("Change Day Time")
                            .frame(width:280, height:50)
                            .background(.white)
                            .font(.system(size:20,weight:.bold, design: .default))
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherofDay: View {
    
    var dayofweek: String
    var imageName: String
    var degree: Int
    
    var body: some View {
        
       
        
        VStack{
            Text(dayofweek)
                .foregroundColor(.white)
                .font(.system(size:16,weight:.medium))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40)
            
            Text("\(degree)°")
                .foregroundColor(.white)
                .font(.system(size:28,weight:.medium))
        }
    }
}
