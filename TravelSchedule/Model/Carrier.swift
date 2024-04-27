import Foundation

struct Carrier: Hashable, Identifiable {
    let id = UUID()
    let logo: String
    let name: String
    let date: String
    let departureTime: String
    let arrivalTime: String
    let travelTime: String
    let transfer: String?
}
