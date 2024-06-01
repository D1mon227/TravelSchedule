import SwiftUI

struct FullScreenStoryView: View {
    private let stories: [Story]
    private var currentStory: Story {
        stories[currentStoryIndex]
    }
    
    init(stories: [Story] = [.story1, .story2, .story3]) {
        self.stories = stories
    }
    
    private var currentStoryIndex: Int {
        Int(progress * CGFloat(stories.count))
    }
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: currentStory)
            ProgressBarView(numberOfSections: 3, progress: 0.5)
                .padding(.top, 35)
                .padding(.horizontal, 12)
            CloseButton()
                .padding(.trailing, 12)
                .padding(.top, 57)
        }
    }
}

#Preview {
    FullScreenStoryView()
}
