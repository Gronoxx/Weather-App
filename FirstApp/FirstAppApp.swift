//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 25/10/24.
//

import SwiftUI

@main
struct FirstAppApp: App {

@StateObject var locationManager = LocationManager()// the StateObject permits the var to notified about the Published changes on the ObservableObject

var body: some Scene {
    WindowGroup {
        CommanderView()
            .environmentObject(locationManager) // Inject the LocationManager
        }
    }
}
