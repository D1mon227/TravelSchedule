import SwiftUI

struct MainScreenView: View {
    var body: some View {
        ZStack {
            Color.redUniversal
                .ignoresSafeArea(edges: .top)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MainScreenView()
}