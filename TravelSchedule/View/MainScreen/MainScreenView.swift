import SwiftUI

struct MainScreenView: View {
    @Binding var path: [NavigationFlow]
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    var body: some View {
        DirectionView()
            .onTapGesture {
                self.path.append(.cities)
            }
    }
}

#Preview {
    MainScreenView(path: .constant([]))
        .environmentObject(MainScreenViewModel())
}

