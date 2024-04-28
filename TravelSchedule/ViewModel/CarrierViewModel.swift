import Foundation

final class CarrierViewModel: ObservableObject {
    @Published var filteredOptions: [FilterSchedule] = []
    @Published var isShowTransferOptions: Bool?
    
    private var carriers: [Carrier] = []
    var filteredCarriers: [Carrier] = []
    
    init() {
        self.carriers = getCarriers()
        self.filteredCarriers = carriers
    }
    
    func apply(_ options: [FilterSchedule]) {
        filteredOptions = options
    }
    
    private func getCarriers() -> [Carrier] {
        return [
            Carrier(logo: "Rzhd", name: "РЖД", date: "14 января", departureTime: "22:30", arrivalTime: "08:15", travelTime: "20 часов", transfer: "С пересадкой в Костроме"),
            Carrier(logo: "Fgk", name: "ФГК", date: "15 января", departureTime: "01:15", arrivalTime: "09:00", travelTime: "9 часов", transfer: nil),
            Carrier(logo: "UralLogistic", name: "Урал логистика", date: "16 января", departureTime: "12:30", arrivalTime: "21:00", travelTime: "9 часов", transfer: nil),
            Carrier(logo: "Rzhd", name: "РЖД", date: "17 января", departureTime: "22:30", arrivalTime: "08:15", travelTime: "20 часов", transfer: "С пересадкой в Костроме"),
            Carrier(logo: "Rzhd", name: "РЖД", date: "17 января", departureTime: "22:30", arrivalTime: "10:15", travelTime: "22 часа", transfer: "С пересадкой в Костроме"),
        ]
    }
}
