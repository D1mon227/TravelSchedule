import SwiftUI

enum Direction: Hashable {
    case from
    case to
}

struct DirectionTextView: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    var direction: Direction
    
    var body: some View {
        let placeholder = direction == .from ? "Откуда" : "Куда"
        let directionText = direction == .from ? viewModel.fromDirection : viewModel.toDirection
        
        Text(directionText == "" ? placeholder : directionText)
            .frame(maxWidth: .infinity,
                   minHeight: 48,
                   alignment: .leading)
            .padding(.leading, 16)
            .foregroundStyle(directionText == "" ? .grayUniversal : .blackUniversal)
            .lineLimit(1)
            .font(.regular17)
    }
}

#Preview {
    DirectionTextView(direction: .from)
}
