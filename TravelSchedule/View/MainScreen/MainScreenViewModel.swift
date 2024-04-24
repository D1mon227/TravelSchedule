import SwiftUI

enum Direction: Hashable {
    case from
    case to
}

final class MainScreenViewModel: ObservableObject {
    @Published var fromDirection: String = ""
    @Published var toDirection: String = ""
    
    var isDirectionsFilled: Bool {
        fromDirection != "" && toDirection != ""
    }
    
    func switchDirection() {
        fromDirection = toDirection
        toDirection = fromDirection
    }
}
