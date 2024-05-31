import SwiftUI

@main
struct TravelScheduleApp: App {
    @ObservedObject var router = ScheduleRouter()
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
                .environmentObject(router)
        }
    }
}
