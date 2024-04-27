import SwiftUI

enum Direction {
    case from
    case to
}

struct DirectionTextView: View {
    @EnvironmentObject var router: ScheduleRouter
    @EnvironmentObject var viewModel: MainScreenViewModel
    
//    @Binding var directionText: String
    
    var direction: Direction
    
    var body: some View {
        let placeholder = direction == .from ? "Откуда" : "Куда"
        let directionText = direction == .from ? viewModel.fromDirection : viewModel.toDirection
        
        Text(directionText == "" ? placeholder : directionText)
            .frame(maxWidth: .infinity,
                   minHeight: 48,
                   alignment: .leading)
            .padding(.leading, 16)
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
