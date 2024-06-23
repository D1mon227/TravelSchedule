import SwiftUI

struct CloseButton: View {
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("CloseButton")
        }
        .frame(width: UIConstants.StoriesScreenView.closeButtonWidth,
               height: UIConstants.StoriesScreenView.closeButtonWidth)
        .clipShape(
            RoundedRectangle(
                cornerRadius: UIConstants.StoriesScreenView.closeButtonCornerRadius))
        .contentShape(
            RoundedRectangle(
                cornerRadius: UIConstants.StoriesScreenView.closeButtonCornerRadius))
    }
}

#Preview {
    CloseButton()
}
