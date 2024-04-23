import SwiftUI

struct DirectionView: View {
    var body: some View {
        ZStack {
            Color.blueUniversal
            HStack(spacing: 16) {
                VStack(spacing: 0) {
                    DirectionTextView(direction: .from)
                    DirectionTextView(direction: .to)
                }
                .frame(maxWidth: .infinity,
                       minHeight: 96)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                SwitchDirectionButton()
            }
            .frame(maxWidth: .infinity)
            .padding(16)
        }
        .frame(height: 128)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 16)
        .padding(.top, 208)
    }
}

#Preview {
    DirectionView()
}
