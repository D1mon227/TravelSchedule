import SwiftUI

struct CarriersView: View {
    @EnvironmentObject var router: ScheduleRouter
    @StateObject var viewModel: CarrierViewModel
    
    var title: (String, String)
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text("\(title.0) → \(title.1)")
                    .font(.bold24)
                    .padding(.horizontal, UIConstants.baseInset)
                    .padding(.bottom, UIConstants.CarriersView.vStackPadding)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                ScrollView {
                    LazyVStack(spacing: UIConstants.CarriersView.vStackSpacing) {
                        ForEach(viewModel.filteredCarriers) { carrier in
                            CarrierRowView(carrier: carrier)
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: UIConstants.CarriersView.cornerRadius))
                                .onTapGesture {
                                    router.path.append(ScheduleRouter.CarrierFlow.carrierInfo)
                                }
                        }
                    }
                    .padding([.horizontal, .bottom], UIConstants.baseInset)
                    .padding(.top, UIConstants.CarriersView.vStackPadding)
                }
                .scrollIndicators(.hidden)
            }
            
            ZStack {
                VStack {
                    Spacer()
                    Button {
                        router.path.append(ScheduleRouter.CarrierFlow.filters)
                    } label: {
                        if !viewModel.filteredOptions.isEmpty || viewModel.isShowTransferOptions != nil {
                            HStack(spacing: UIConstants.CarriersView.hStackSpacing) {
                                Text(LocalizableConstants.Schedule.time)
                                    .font(.bold17)
                                    .foregroundStyle(.white)
                                Text("●")
                                    .font(.system(size: UIConstants.CarriersView.textHeight))
                                    .foregroundStyle(.redUniversal)
                            }
                        } else {
                            Text(LocalizableConstants.Schedule.time)
                                .font(.bold17)
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: UIConstants.baseHeight)
                    .background(.blueUniversal)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: UIConstants.CarriersView.buttonCornerRadius))
                    .padding(.horizontal, UIConstants.baseInset)
                    .padding(.bottom, UIConstants.CarriersView.bottomPadding)
                }
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
            case .filters:
                FiltersView(viewModel: viewModel,
                            isShowTransferOptions: $viewModel.isShowTransferOptions)
            }
        }
    }
}

#Preview {
    CarriersView(viewModel: CarrierViewModel(), title: ("Москва", "Питер"))
}
