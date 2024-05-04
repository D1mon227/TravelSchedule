import SwiftUI

struct StationRowView: View {
    var station: Station
    
    var body: some View {
        HStack {
            Text(station.name)
                .font(.regular17)
            Spacer()
            Image(.chevronForward)
        }
        .frame(height: UIConstants.baseHeight)
        .contentShape(Rectangle())
    }
}

#Preview {
    StationRowView(station: Station(name: "Курский вокзал"))
}
