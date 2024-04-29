import SwiftUI

struct FilterHeaderView: View {
    var header: FilterHeader
    
    var body: some View {
        let title = switch header {
        case .departureTime:
            LocalizableConstants.Filter.departureTime
        case .showOptionWithTransfer:
            LocalizableConstants.Filter.showOptionsWithLayovers
        }
        
        HStack {
            Text(title)
                .font(.bold24)
                .foregroundStyle(.blackUniversal)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FilterHeaderView(header: .departureTime)
}
