import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var router: ScheduleRouter
    @ObservedObject var viewModel: CarrierViewModel
    
    @Binding var isShowTransferOptions: Bool?
    
    var body: some View {
        
        ZStack {
            VStack {
                ForEach(FilterHeader.allCases) { header in
                    Section {
                        if header == .departureTime {
                            ForEach(FilterSchedule.allCases) { option in
                                FilterScheduleOptionView(options: $viewModel.filteredOptions,
                                                         option: option)
                            }
                        } else {
                            FilterTransferOptionView(isShowTitle: true,
                                                     isShowTransferOptions: $viewModel.isShowTransferOptions)
                            FilterTransferOptionView(isShowTitle: false,
                                                     isShowTransferOptions: $viewModel.isShowTransferOptions)
                        }
                    } header: {
                        FilterHeaderView(header: header)
                    }
                }
                Spacer()
            }
            .padding(.top, UIConstants.baseInset)
            
            if isShowTransferOptions != nil {
                VStack {
                    Spacer()
                    Button {
                        viewModel.apply(viewModel.filteredOptions)
                        router.returnBack()
                    } label: {
                        Text(LocalizableConstants.Filter.apply)
                            .font(.bold17)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: UIConstants.baseHeight)
                    .background(.blueUniversal)
                    .clipShape(RoundedRectangle(cornerRadius: UIConstants.FilterView.cornerRadius))
                    .padding(.horizontal, UIConstants.baseInset)
                    .padding(.bottom, UIConstants.FilterView.bottomPadding)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.isShowTransferOptions = nil
                    router.returnBack()
                } label: {
                    Image(.chevronBack)
                }
                
            }
        }
    }
}

#Preview {
    FiltersView(viewModel: CarrierViewModel(), isShowTransferOptions: .constant(true))
}
