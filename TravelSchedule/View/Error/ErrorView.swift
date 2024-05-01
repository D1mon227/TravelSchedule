import SwiftUI

struct ErrorView: View {
    
    var error: ErrorType
    
    var body: some View {
        VStack(spacing: UIConstants.baseInset) {
            Image(error == .noInternet ? .noInternet : .server)
                .resizable()
                .frame(width: UIConstants.ErrorView.imageWidth,
                       height: UIConstants.ErrorView.imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.ErrorView.cornerRadius))
            Text(error == .noInternet ? LocalizableConstants.Error.noInternet : LocalizableConstants.Error.server)
                .font(.bold24)
                .foregroundStyle(.blackUniversal)
        }
    }
}

#Preview {
    ErrorView(error: .noInternet)
}
