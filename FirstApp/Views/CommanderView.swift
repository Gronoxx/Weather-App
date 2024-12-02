//
//  CommanderView.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 02/11/24.
//

import SwiftUI

struct CommanderView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        Group {
            switch locationManager.manager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                if let location = locationManager.location {
                    if  let weather = weather{
                        ContentView(temperatureToday: weather.main.temp, temperatureSensation: weather.main.feels_like, temperatureMin: weather.main.temp_min, temperatureMax: weather.main.temp_max, cityName: weather.name, weatherCode: weather.weather.last?.icon,description: weather.weather.last?.description)
                    }
                    else{
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                            }
                    }
                }
                else{
                    Text("Something wrong with the Location Manager") //this case should not happen, becuase we are inside authorizedwheninuse if it does, it means the location manager is not working
                }
            case .denied, .restricted:
                // Show a view explaining that permission is required
                DeniedView() // Replace with a custom view for denied access

            case .notDetermined:
                // Show the location request prompt
                LocationRequestView()
            @unknown default:
                LocationRequestView()
            }
        }
        .animation(.easeInOut, value: locationManager.manager.authorizationStatus)
    }
}


