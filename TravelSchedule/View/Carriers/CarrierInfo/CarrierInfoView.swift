import SwiftUI

struct CarrierInfoView: View {
    @EnvironmentObject var router: ScheduleRouter
    
    var body: some View {
        VStack(spacing: UIConstants.baseInset) {
            Image(.rzhdFull)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: UIConstants.CarrierInfoView.width,
                       minHeight: UIConstants.CarrierInfoView.height)
                .padding(.horizontal, UIConstants.baseInset)
            HStack {
                VStack(alignment: .leading) {
                    Text("ОАО «РЖД»")
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                    VStack(alignment: .leading) {
                        Text(LocalizableConstants.Carrier.email)
                            .font(.regular17)
                            .foregroundStyle(.blackUniversal)
                        Text("i.lozgkina@yandex.ru")
                            .font(.regular12)
                            .foregroundStyle(.blueUniversal)
                    }
                    .frame(maxHeight: UIConstants.baseHeight)
                    VStack(alignment: .leading) {
                        Text(LocalizableConstants.Carrier.phone)
                            .font(.regular17)
                            .foregroundStyle(.blackUniversal)
                        Text("+7 (904) 329-27-71")
                            .font(.regular12)
                            .foregroundStyle(.blueUniversal)
                    }
                    .frame(maxHeight: UIConstants.baseHeight)
                }
                Spacer()
            }
            .padding(.horizontal, UIConstants.baseInset)
            Spacer()
        }
        .padding(.top, UIConstants.baseInset)
        .navigationTitle(LocalizableConstants.Carrier.title)
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

#Preview {
    CarrierInfoView()
}
