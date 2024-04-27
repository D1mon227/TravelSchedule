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
        .frame(height: 60)
    }
}

#Preview {
    StationRowView(station: Station(name: "Курский вокзал"))
}
