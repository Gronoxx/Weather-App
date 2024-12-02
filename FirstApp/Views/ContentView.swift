//
//  ContentView.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var temperatureToday: Double
    var temperatureSensation: Double
    var temperatureMin: Double
    var temperatureMax: Double
    var cityName: String
    var weatherCode: String?
    var description: String?
    
    
    var body: some View {
                
        let weatherDictionary: [String: String] = [
            "01d": "sun.max.fill",
            "01n": "moon.stars.fill",
            "02d": "cloud.sun.fill",
            "02n": "cloud.moon.fill",
            "03d": "cloud.fill",
            "03n": "cloud.fill",
            "04d": "cloud.fill",
            "04n": "cloud.fill",
            "09d": "cloud.sun.rain.filll",
            "09n": "cloud.moon.rain.fill",
            "10d": "cloud.heavyrain.fill",
            "10n": "cloud.heavyrain.fill",
            "11d": "cloud.sun.bolt.fill",
            "11n": "cloud.moon.bolt.fill",
            "13d": "snowflake",
            "13n": "snowflake",
            "50d": "cloud.fog",
            "50n": "cloud.fog",
        ]
        
        
                ZStack {
                    
                    let isNight = SetDayTime(code: weatherCode ?? "d")
                    
                    BackgroundView(isNight: isNight)
                    
                    VStack{
                        CityTextView(cityName: cityName)

                        VStack (spacing: 8){
                            if let weatherCode = weatherCode{
                                TodayWeatherView(imageName: weatherDictionary[weatherCode] ?? "exclamationmark.warninglight.fill", temperature: Int(round(temperatureToday)),description: description ?? "Error getting description",maxTemp: Int(round(temperatureMax)), minTemp: Int(round( temperatureMin)), senstationTemp: Int(round(temperatureSensation)))
                            }
                        }
                         
                         HStack{
                            Spacer()
                            WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 19)
                            Spacer()
                            WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 24)
                            Spacer()
                            WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 16)
                            Spacer()
                            WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 20)
                            Spacer()
                            WeatherDayView(dayOfWeek: "SAT", imageName: "moon.stars.fill", temperature: 12)
                            Spacer()
                        }
                        
                        Spacer()
                        
                    }.padding(.top, 10)
                }
            }
        }
    

#Preview {
    ContentView(temperatureToday: 21.0, temperatureSensation: 22.0, temperatureMin: 18.0, temperatureMax: 26.0, cityName: "Belo Horizonte", weatherCode: "10n", description: "heavy rain")
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .padding([.top], 30)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text("\(temperature)°")
                .font(.system(size: 35, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,isNight ? .gray : .lightBlue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32 ,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(30)
    }
}

struct TodayWeatherView: View {
    
    var imageName: String
    var temperature: Int
    var description: String
    var maxTemp: Int
    var minTemp: Int
    var senstationTemp: Int
    
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(description.capitalized)")
            .font(.system(size: 30,weight: .medium))
            .foregroundStyle(.white)
            .padding(.top, 10)
        
        
        Text("\(temperature)°")
            .font(.system(size: 80,weight: .medium))
            .foregroundStyle(.white)
        
        Text("Max: \(maxTemp)°   Min: \(minTemp)°")
            .font(.system(size: 18,weight: .light))
            .foregroundStyle(.white)
        Text("\("Sensation: \(senstationTemp)°")")
            .font(.system(size: 10,weight: .light))
            .foregroundStyle(.white)

        
    }
}

func SetDayTime(code: String) -> Bool{
    if code.last == "n"
    {return true}
    else
    {return false}
}




