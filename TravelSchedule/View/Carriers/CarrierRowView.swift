import SwiftUI

struct CarrierRowView: View {
    var carrier: Carrier
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: UIConstants.CarrierRowView.hStackSpacing) {
                    Image(carrier.logo)
                        .resizable()
                        .frame(width: UIConstants.CarrierRowView.imageWidth,
                               height: UIConstants.CarrierRowView.imageWidth)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: UIConstants.CarrierRowView.cornerRadius))
                        .padding([.leading, .top], UIConstants.CarrierRowView.carrierRowTopPadding)
                    VStack(alignment: .leading, spacing: UIConstants.CarrierRowView.vStackSpacing) {
                        HStack {
                            Text(carrier.name)
                                .font(.regular17)
                                .foregroundStyle(.black)
                            Spacer()
                            Text(carrier.date)
                                .font(.regular12)
                                .foregroundStyle(.black)
                            
                        }
                        if let transferInfo = carrier.transfer {
                            Text(transferInfo)
                                .font(.regular12)
                                .foregroundStyle(.redUniversal)
                        }
                    }
                    .padding(.trailing, UIConstants.CarrierRowView.carrierRowTrailingPadding)
                    .padding(.top, UIConstants.CarrierRowView.carrierRowTopPadding)
                    .frame(maxWidth: .infinity)
                }
                Spacer()
                HStack {
                    Text(carrier.departureTime)
                        .font(.regular17)
                        .foregroundStyle(.black)
                    VStack {
                        Divider()
                    }
                    Text(carrier.travelTime)
                        .font(.regular12)
                        .foregroundStyle(.black)
                    VStack {
                        Divider()
                    }
                    Text(carrier.arrivalTime)
                        .font(.regular17)
                        .foregroundStyle(.black)
                }
                .padding(UIConstants.CarrierRowView.carrierRowTopPadding)
            }
            .frame(height: UIConstants.CarrierRowView.vStackHeight)
        }
        .background(.lightGrayDay)
    }
}

#Preview {
    CarrierRowView(carrier: Carrier(logo: "Rzhd",
                                    name: "РЖД",
                                    date: "14 января",
                                    departureTime: "12:30",
                                    arrivalTime: "22:30",
                                    travelTime: "10 часов",
                                    transfer: "С пересадкой в Костроме"))
}
