import SwiftUI

struct CloseButton: View {
    var body: some View {
        Button {
            print("CLose story")
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
