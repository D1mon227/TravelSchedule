import SwiftUI

struct SplashView: View {
    @State private var showSplash = false
    
    var body: some View {
        ZStack {
            if showSplash {
                ContentView()
            } else {
                Image("SplashScreen")
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
    SplashView()
}
