//
//  ContentView.swift
//  WeatherApp
//
//  Created by Apple on 30.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                WeatherToday(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temp: 76)
          
                HStack(spacing: 12){
                    WeatherDailyView(dayOfWeek: "MON",
                                     imageName: "cloud.sun.fill",
                                     temp: 70)
                    WeatherDailyView(dayOfWeek: "TUE",
                                     imageName: "sun.max.fill",
                                     temp: 78)
                    WeatherDailyView(dayOfWeek: "WED",
                                     imageName: "snow",
                                     temp: 50)
                    WeatherDailyView(dayOfWeek: "THUR",
                                     imageName: "cloud.sun.fill",
                                     temp: 72)
                    WeatherDailyView(dayOfWeek: "FRI",
                                     imageName: "wind",
                                     temp: 60)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "change day time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDailyView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size:26, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 60, height: 60)
            Text("\(temp)°")
                .font(.system(size:28, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray: Color("lightBlue")]),                   startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct WeatherToday: View {
    
    var imageName: String
    var temp: Int

    
    var body: some View {
        VStack(spacing:16){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:240, height:180)
            
            Text("\(temp)°")
                .font(.system(size:70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 70)
    }
}



