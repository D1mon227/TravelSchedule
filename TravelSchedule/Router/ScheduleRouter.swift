import SwiftUI

final class ScheduleRouter: ObservableObject {
    
    enum NavigationFlow: Hashable {
        case cities(Direction)
        case stations(Direction)
        case carriers
    }
    
    enum CarrierFlow: Hashable {
        case filters
        case carrierInfo
    }
    
    enum Settings: Hashable {
        case agreement
    }
    
    @Published var path = NavigationPath()
    
    func returnBack() {
        path.removeLast()
    }
    
    func returnToRoot() {
        path.removeLast(path.count)
    }
}
