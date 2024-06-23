import Foundation

final class MainScreenViewModel: ObservableObject {
    @Published var fromDirection: String = ""
    @Published var toDirection: String = ""
    @Published var stories: [Story] = MockStories.stories
    
    var isDirectionsFilled: Bool {
        fromDirection != "" && toDirection != ""
    }
    
    func switchDirection() {
        let from = fromDirection
        fromDirection = toDirection
        toDirection = from
    }
}
