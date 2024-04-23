import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var fromDirection: String = ""
    @Published var toDirection: String = ""
    
    func switchDirection() {
        fromDirection = toDirection
        toDirection = fromDirection
    }
}
