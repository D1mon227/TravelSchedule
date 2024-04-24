import Foundation

final class StationViewModel: ObservableObject {
    private var stations: [Station] = []
    @Published var filteredStations: [Station] = []
    
    init() {
        self.stations = getStations()
        self.filteredStations = stations
    }
    
    func onTextChanged(_ text: String) {
        if text.isEmpty {
            filteredStations = stations
        } else {
            filteredStations = stations.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
    
    private func getStations() -> [Station] {
        return [
            Station(name: "Киевский вокзал"),
            Station(name: "Курский вокзал"),
            Station(name: "Ярославский вокзал"),
            Station(name: "Белорусский вокзал"),
            Station(name: "Савеловский вокзал"),
            Station(name: "Ленинградский вокзал")
        ]
    }
}
