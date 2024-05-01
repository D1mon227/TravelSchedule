import SwiftUI

struct SwitchDirectionButton: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    var body: some View {
        Button {
            viewModel.switchDirection()
        } label: {
            Image(.switchDirection)
        }
        .frame(width: UIConstants.DirectionView.buttonWidth,
               height: UIConstants.DirectionView.buttonWidth)
        .background(.white)
        .foregroundStyle(.blueUniversal)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UIConstants.DirectionView.buttonCornerRadius))
    }
}

#Preview {
    SwitchDirectionButton()
}
