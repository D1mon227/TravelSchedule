import SwiftUI

struct Story: Identifiable {
    let id: Int
    let previewImage: String?
    let fullImage: String?
    let title: String?
    let description: String?
    var isViewed: Bool
}

struct MockStories {
    static var stories: [Story] = [
        Story(id: 0, previewImage: "StoryPreview1", fullImage: "StoryDemo1", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 1, previewImage: "StoryPreview2", fullImage: "StoryDemo2", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 2, previewImage: "StoryPreview3", fullImage: "StoryDemo3", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 3, previewImage: "StoryPreview4", fullImage: "StoryDemo4", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 4, previewImage: "StoryPreview5", fullImage: "StoryDemo5", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 5, previewImage: "StoryPreview6", fullImage: "StoryDemo6", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 6, previewImage: "StoryPreview7", fullImage: "StoryDemo7", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 7, previewImage: "StoryPreview8", fullImage: "StoryDemo8", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false),
        Story(id: 8, previewImage: "StoryPreview9", fullImage: "StoryDemo9", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text", isViewed: false)
    ]
}
