import SwiftUI

struct AgreementView: View {
    @State private var progress: Double = 0.0
    let urlString: String
    
    var body: some View {
        VStack {
            if progress < 1.0 {
                ProgressView(value: progress)
            }
            WebView(urlString: urlString,
                    progress: $progress)
        }
    }
}

#Preview {
    AgreementView(urlString: "https://www.rzhd.ru")
}
