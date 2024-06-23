import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    @Binding var currentStoryIndex: Int
    
    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(stories) { story in
                FullScreenStoryView(currentStory: story)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    private func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
}
