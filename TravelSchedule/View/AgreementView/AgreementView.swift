import SwiftUI

struct AgreementView: View {
    @EnvironmentObject var router: ScheduleRouter
    @StateObject var viewModel = WebView.ProgressViewModel(progress: 0.0)
    let urlString: String
    
    var body: some View {
        VStack {
            if viewModel.progress < 1.0 {
                ProgressView(value: viewModel.progress)
            }
            WebView(urlString: urlString,
                    viewModel: viewModel)
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle(LocalizableConstants.Settings.userAgreement).navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        router.returnBack()
                    } label: {
                        Image(.chevronBack)
                    }

                }
            }
        }
    }
}

#Preview {
    AgreementView(urlString: "https://www.rzhd.ru")
}
