import SwiftUI

struct CarrierInfoView: View {
    @EnvironmentObject var router: ScheduleRouter
    
    var body: some View {
        VStack(spacing: 16) {
            Image(.rzhdFull)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 343, height: 104)
            HStack {
                VStack(alignment: .leading) {
                    Text("ОАО «РЖД»")
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.regular17)
                            .foregroundStyle(.blackUniversal)
                        Text("i.lozgkina@yandex.ru")
                            .font(.regular12)
                            .foregroundStyle(.blueUniversal)
                    }
                    .frame(maxHeight: 60)
                    VStack(alignment: .leading) {
                        Text("Телефон")
                            .font(.regular17)
                            .foregroundStyle(.blackUniversal)
                        Text("+7 (904) 329-27-71")
                            .font(.regular12)
                            .foregroundStyle(.blueUniversal)
                    }
                    .frame(maxHeight: 60)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
        }
        .padding(.top, 16)
        .navigationTitle("Информация о перевозчике")
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
