import SwiftUI

final class StoryViewModel: ObservableObject {
    var stories: [Story] = []
    
    init() {
        self.stories = getStories()
    }
    
    private func getStories() -> [Story] {
        return [
            Story(image: "StoryPreview1", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview2", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview3", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview4", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview5", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview6", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview7", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview8", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text"),
            Story(image: "StoryPreview9", text: "Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text")
        ]
    }
}
