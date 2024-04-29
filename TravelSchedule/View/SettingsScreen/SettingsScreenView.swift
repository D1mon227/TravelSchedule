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
            .frame(height: 60)
            
            HStack {
                Text(LocalizableConstants.Settings.userAgreement)
                    .foregroundStyle(.blackUniversal)
                    .font(.regular17)
                    .onTapGesture {
                        router.path.append(ScheduleRouter.Settings.agreement)
                    }
                Spacer()
                Image(.chevronForward)
                    .frame(width: 24, height: 24)
            }
            .frame(height: 60)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 16) {
                Text(LocalizableConstants.Settings.apiYandexSchedule)
                Text(LocalizableConstants.Settings.version)
            }
            .foregroundStyle(.blackUniversal)
            .font(.regular12)
            .padding(.bottom, 24)
        }
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .padding(.bottom)
        .preferredColorScheme(isToggleOn ? .dark : .light)
        .navigationDestination(for: ScheduleRouter.Settings.self) { id in
            switch id {
            case .agreement:
                AgreementView(urlString: "https://yandex.ru/legal/practicum_offer")
            }
        }
    }
}

#Preview {
    SettingsScreenView()
}
