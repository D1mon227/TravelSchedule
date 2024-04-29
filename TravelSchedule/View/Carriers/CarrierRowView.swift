import SwiftUI

struct CarrierRowView: View {
    var carrier: Carrier
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 8) {
                    Image(carrier.logo)
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding([.leading, .top], 14)
                    VStack(alignment: .leading, spacing: 2) {
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
                    .padding(.trailing, 7)
                    .padding(.top, 14)
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
                .padding(14)
            }
            .frame(height: 104)
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
