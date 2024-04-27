import SwiftUI

struct SwitchDirectionButton: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    var body: some View {
        Button {
            viewModel.switchDirection()
        } label: {
            Image(.switchDirection)
        }
        .frame(width: 36, height: 36)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    SwitchDirectionButton()
}
