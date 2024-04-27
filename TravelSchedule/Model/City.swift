import Foundation

struct City: Hashable, Identifiable {
    let id = UUID()
    let name: String
}
