import SwiftUI

struct CarriersView: View {
    @EnvironmentObject var router: ScheduleRouter
    @ObservedObject var viewModel: CarrierViewModel
    
    var title: (String, String)
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text("\(title.0) → \(title.1))")
                    .font(.bold24)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.filteredCarriers) { carrier in
                            CarrierRowView(carrier: carrier)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .onTapGesture {
                                    router.path.append(ScheduleRouter.CarrierFlow.carrierInfo)
                                }
                        }
                    }
                    .padding([.horizontal, .bottom], 16)
                    .padding(.top, 8)
                }
                .scrollIndicators(.hidden)
            }
            
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("Уточнить время")
                        .font(.bold17)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.blueUniversal)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
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
        .navigationDestination(for: ScheduleRouter.CarrierFlow.self) { id in
            switch id {
            case .carrierInfo:
                CarrierInfoView()
            }
        }
    }
}

#Preview {
    CarriersView(viewModel: CarrierViewModel(), title: ("Москва", "Питер"))
}
