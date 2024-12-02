//
//  Denied View.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 02/11/24.
//

import SwiftUI

struct DeniedView: View {
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
                
                Text("Ligue sua localização para te informamos melhor.")
                    .font(.system(size: 20,weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top,10)
                    .padding(.bottom, 50)
                
                Text("Passo a Passo para permitir Localização após negar permissão:")
                    .font(.system(size: 20,weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top,10)
                StepView(text: "1.Abra o App Ajustes")
                StepView(text: "2. Selecione Privacidade e Segurança")
                StepView(text: "3. Entre em Serviços de Localização")
                StepView(text: "4. Selecione Weather App")
                StepView(text: "5. Altere para Durante o Uso do App")
                
               
                Spacer()
            }
        }
    }
}

struct StepView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.system(size: 20,weight: .semibold, design: .rounded))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding(.top,10)
    }
}

#Preview {
    DeniedView()
}
