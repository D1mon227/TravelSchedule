import SwiftUI

final class ScheduleRouter: ObservableObject {
    
    enum NavigationFlow: Hashable {
        case cities(Direction)
        case stations(Direction)
        case carriers
    }
    
    enum CarrierFlow: Hashable {
        case carrierInfo
    }
    
    @Published var path = NavigationPath()
    
    func returnBack() {
        path.removeLast()
    }
    
    func returnToRoot() {
        path.removeLast(path.count)
    }
}
