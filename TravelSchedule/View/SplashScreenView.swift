import SwiftUI

struct SplashScreenView: View {
    @State private var showSplash = false
    
    var body: some View {
        ZStack {
            if showSplash {
                ContentView()
            } else {
                Image(.splashScreen)
                    .resizable()
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.showSplash = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
