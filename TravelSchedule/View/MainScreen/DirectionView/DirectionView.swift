import SwiftUI

struct DirectionView: View {
    var body: some View {
        ZStack {
            Color.blueUniversal
            HStack(spacing: UIConstants.DirectionView.spacing) {
                VStack(spacing: 0) {
                    DirectionTextView(direction: .from)
                    DirectionTextView(direction: .to)
                }
                .frame(maxWidth: .infinity,
                       minHeight: UIConstants.DirectionView.vStackHeight)
                .background(.white)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: UIConstants.DirectionView.stackCornerRadius))
                SwitchDirectionButton()
            }
            .frame(maxWidth: .infinity)
            .padding(UIConstants.baseInset)
        }
        .frame(height: UIConstants.DirectionView.zStackHeight)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UIConstants.DirectionView.stackCornerRadius))
        .padding(.horizontal, UIConstants.baseInset)
    }
}

#Preview {
    DirectionView()
}
