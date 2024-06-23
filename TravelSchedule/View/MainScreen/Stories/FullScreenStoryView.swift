import SwiftUI
import Combine

struct FullScreenStoryView: View {
    var currentStory: Story
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: currentStory)
            CloseButton()
                .padding(.trailing, 12)
                .padding(.top, 57)
        }
    }
}

#Preview {
    FullScreenStoryView(currentStory: Story(id: 1,
                                            previewImage: "StoryPreview1",
                                            fullImage: "StoryDemo3",
                                            title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                            description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                            isViewed: false))
}
