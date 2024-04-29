import SwiftUI

struct ErrorView: View {
    
    var error: ErrorType
    
    var body: some View {
        VStack(spacing: 16) {
            Image(error == .noInternet ? .noInternet : .server)
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            Text(error == .noInternet ? LocalizableConstants.Error.noInternet : LocalizableConstants.Error.server)
                .font(.bold24)
                .foregroundStyle(.blackUniversal)
        }
    }
}

#Preview {
    ErrorView(error: .noInternet)
}
