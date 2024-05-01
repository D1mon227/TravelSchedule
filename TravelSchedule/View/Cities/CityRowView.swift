import SwiftUI

struct CityRowView: View {
    var city: City
    
    var body: some View {
        HStack {
            Text(city.name)
                .font(.regular17)
            Spacer()
            Image(.chevronForward)
        }
        .frame(height: UIConstants.baseHeight)
    }
}

#Preview {
    CityRowView(city: City(name: "Москва"))
}
