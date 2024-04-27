import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var fromDirection: String = ""
    @Published var toDirection: String = ""
    
    var isDirectionsFilled: Bool {
        fromDirection != "" && toDirection != ""
    }
    
    func switchDirection() {
        let from = fromDirection
        fromDirection = toDirection
        toDirection = from
    }
}
