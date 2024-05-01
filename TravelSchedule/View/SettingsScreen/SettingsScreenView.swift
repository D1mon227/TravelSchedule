import SwiftUI

struct SettingsScreenView: View {
    @EnvironmentObject var router: ScheduleRouter
    @State private var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizableConstants.Settings.darkMode)
                    .foregroundStyle(.blackUniversal)
                    .font(.regular17)
                Toggle(isOn: $isToggleOn) {}
                    .tint(.blueUniversal)
            }
            .frame(height: UIConstants.baseHeight)
            
            HStack {
                Text(LocalizableConstants.Settings.userAgreement)
                    .foregroundStyle(.blackUniversal)
                    .font(.regular17)
                    .onTapGesture {
                        router.path.append(ScheduleRouter.Settings.agreement)
                    }
                Spacer()
                Image(.chevronForward)
                    .frame(width: UIConstants.SettingsScreenView.imageWidth,
                           height: UIConstants.SettingsScreenView.imageWidth)
            }
            .frame(height: UIConstants.baseHeight)
            
            Spacer()
            
            VStack(alignment: .center, spacing: UIConstants.baseInset) {
                Text(LocalizableConstants.Settings.apiYandexSchedule)
                Text(LocalizableConstants.Settings.version)
            }
            .foregroundStyle(.blackUniversal)
            .font(.regular12)
            .padding(.bottom, UIConstants.SettingsScreenView.bottomTopPadding)
        }
        .padding(.top, UIConstants.SettingsScreenView.bottomTopPadding)
        .padding(.horizontal, UIConstants.baseInset)
        .padding(.bottom)
        .preferredColorScheme(isToggleOn ? .dark : .light)
        .navigationDestination(for: ScheduleRouter.Settings.self) { id in
            switch id {
            case .agreement:
                AgreementView(urlString: Resources.agreementLink)
            }
        }
    }
}

#Preview {
    SettingsScreenView()
}
