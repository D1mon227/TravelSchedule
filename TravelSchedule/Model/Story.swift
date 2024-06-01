import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let image: String
    let text: String
    let description: String
    
    static let story1 = Story(image: "StoryDemo5", text: "Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1", description: "Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1")
    
    static let story2 = Story(image: "StoryDemo3", text: "Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2", description: "Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2")
    
    static let story3 = Story(image: "StoryDemo8", text: "Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3", description: "Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3")
}
