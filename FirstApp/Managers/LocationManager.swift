
import Foundation
import CoreLocation //Apple Framework to get location
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{ //Observable object: it makes this class be observable by other views, so they can
    // readjust themselves based on what they see happens here. It allows Published to work
    
    let manager = CLLocationManager()
    
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined // We need to track the status so we can change the views
    @Published var isLoading = false
    @Published var location: CLLocationCoordinate2D? // Published: when the var suffers a change it emmits an announcement so orders can reload themselves. So it tells fot those observing this object that they need to change
    
    override init(){ // we are creating and overriding the parent class initializer
        super.init() // we are calling the initializer of the parent class before adding more features to the init
        manager.delegate = self // delegate is the "person" responsible to do a job that another "person" asks to. So, in this case, CLLocationManager() is our boss and we want to do the jobs he asks us when necessary. So, the CLLocation has inside of him a position open (var delegate: protocol?) to a delegate, and we are saying in this line: LocationManager(self) is going to be your delegate and he knows how to do what you ass him to.
        authorizationStatus = manager.authorizationStatus
        manager.startUpdatingLocation()
    }
    
    //A function that calls the request Location, we can add more lines to domore things before actually calling it
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //now we are describing how the delegate (LocationManager is going to do his job)
        location = locations.first?.coordinate // getting the first value of the array of CLLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            // Update the published property when authorization status changes
            authorizationStatus = status
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
    }
    
    
}



