import SwiftUI

struct SettingsScreenView: View {
    @State private var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Темная тема")
                    .foregroundStyle(.blackUniversal)
                    .font(.regular17)
                Toggle(isOn: $isToggleOn) {}
                    .tint(.blueUniversal)
            }
            .frame(height: 60)
            
            HStack {
                Text("Пользовательское соглашение")
                    .foregroundStyle(.blackUniversal)
                    .font(.regular17)
                Spacer()
                Image(.chevron)
                    .frame(width: 24, height: 24)
            }
            .frame(height: 60)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 16) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .foregroundStyle(.blackUniversal)
            .font(.regular12)
            .padding(.bottom, 24)
        }
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .padding(.bottom)
        .preferredColorScheme(isToggleOn ? .dark : .light)
    }
}

#Preview {
    SettingsScreenView()
}
