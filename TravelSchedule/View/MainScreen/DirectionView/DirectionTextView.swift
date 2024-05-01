import SwiftUI

enum Direction {
    case from
    case to
}

struct DirectionTextView: View {
    @EnvironmentObject var router: ScheduleRouter
    @EnvironmentObject var viewModel: MainScreenViewModel
    
    var direction: Direction
    
    var body: some View {
        let placeholder = direction == .from ? LocalizableConstants.MainScreen.from : LocalizableConstants.MainScreen.to
        let directionText = direction == .from ? viewModel.fromDirection : viewModel.toDirection
        
        Text(directionText == "" ? placeholder : directionText)
            .frame(maxWidth: .infinity,
                   minHeight: UIConstants.DirectionView.textHeight,
                   alignment: .leading)
            .padding(.leading, UIConstants.baseInset)
            .foregroundStyle(directionText == "" ? .grayUniversal : .black)
            .lineLimit(1)
            .font(.regular17)
            .onTapGesture {
                router.path.append(ScheduleRouter.NavigationFlow.cities(direction))
            }
    }
}

#Preview {
    DirectionTextView(direction: .from)
}
