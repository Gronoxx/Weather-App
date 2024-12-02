import SwiftUI

struct LoadingView: View {
    
    @State private var imageSize: CGFloat = 200 // Starting size
    @State private var imageOffset: CGFloat = 150 // Starting offset
    @State private var isSpinning = false // State for spinning
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .golfGreen], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe.americas.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .rotationEffect(.degrees(isSpinning ? 360 : 0)) // Rotate based on isSpinning
                    .padding(.top, imageOffset) // Use the offset for vertical position
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isSpinning) // Continuous spinning
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .onAppear {
            // Trigger the animations as soon as the view appears
            withAnimation(.easeInOut(duration: 2)) {
                // Adjust the size and position for the animation
                imageSize = 100 // New size
                imageOffset = 300 // New position (lower)
            }
            
            // Start the spinning effect
            isSpinning = true // Start spinning immediately when the view appears
        }
    }
}

#Preview {
    LoadingView()
}
