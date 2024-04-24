import Foundation

final class CityViewModel: ObservableObject {
    private var cities: [City] = []
    @Published var filteredCities: [City] = []
    
    init() {
        self.cities = getCities()
        self.filteredCities = cities
    }
    
    func onTextChanged(_ text: String) {
        if text.isEmpty {
            filteredCities = cities
        } else {
            filteredCities = cities.filter { $0.name.lowercased().contains(text.lowercased()) }
        }
    }
    
    private func getCities() -> [City] {
        return [
        City(name: "Москва"),
        City(name: "Санкт-Петербург"),
        City(name: "Сочи"),
        City(name: "Горный воздух"),
        City(name: "Краснодар"),
        City(name: "Казань"),
        City(name: "Омск"),
        ]
    }
}
