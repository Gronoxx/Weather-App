//
//  Location Request View.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 02/11/24.
//

import SwiftUI

struct LocationRequestView: View {

    @EnvironmentObject var locationManager: LocationManager // for the LocationRequestView be able to use the locationManager we need to create an EnviromentObject, so we close the chain of ObservableObject
    
    var body: some View{

            ZStack{
                LinearGradient(colors: [.blue, .golfGreen], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack{
                    Image(systemName: "globe.americas.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height:200)
                        .padding(.bottom,40)
                        .padding(.top,150)
                    
                    Text("Quer saber como está o clima na sua área?")
                        .font(.system(size: 34,weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Ligue sua localização para te informamos melhor.")
                        .font(.system(size: 20,weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                        .padding(.bottom, 50)
                    
                    
                    Button{
                        locationManager.requestLocation()
                    }label: {
                        ButtonLabelView(text: "Compartilhar Localização", backgroundColor: .white, textColor: .blue)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
    }


#Preview {
    LocationRequestView()
}
