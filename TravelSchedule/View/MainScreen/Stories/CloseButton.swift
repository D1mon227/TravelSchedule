import SwiftUI

struct CloseButton: View {
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("CloseButton")
        }
        .frame(width: 30, height: 30)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 15))
        .contentShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CloseButton()
}
