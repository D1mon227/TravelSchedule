import Foundation

struct Station: Hashable, Identifiable {
    let id = UUID()
    let name: String
}
