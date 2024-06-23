import SwiftUI

struct SwitchDirectionButton: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    @State private var isRotated = false
    
    var body: some View {
        Button {
            withAnimation {
                isRotated.toggle()
//                viewModel.switchDirection()
            }
        } label: {
            Image(.switchDirection)
                .rotationEffect(.degrees(isRotated ? 180 : 0))
        }
        .frame(width: UIConstants.DirectionView.buttonWidth,
               height: UIConstants.DirectionView.buttonWidth)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UIConstants.DirectionView.buttonCornerRadius))
        .contentShape(RoundedRectangle(cornerRadius: UIConstants.DirectionView.buttonCornerRadius))
    }
}

#Preview {
    SwitchDirectionButton()
}
