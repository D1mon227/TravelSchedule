import SwiftUI

struct PreviewStoriesView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    @State private var storyToShow: Story?
    @State var currentStoryIndex: Int = 0
    @State var currentProgress: CGFloat = 0
    
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: viewModel.stories.count) }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: UIConstants.StoriesScreenView.storyPreviewSpacing) {
                ForEach(viewModel.stories) { story in
                    PreviewStoryRowView(story: story)
                        .onTapGesture {
                            currentStoryIndex = story.id
                            viewModel.stories[story.id].isViewed = true
                            storyToShow = story
                        }
                }
            }
            .padding(.horizontal, UIConstants.baseInset)
        }
        .frame(maxWidth: .infinity, maxHeight: 188)
        .scrollIndicators(.hidden)
        .fullScreenCover(item: $storyToShow) { story in
            ZStack(alignment: .topTrailing) {
                StoriesTabView(stories: viewModel.stories,
                               currentStoryIndex: $currentStoryIndex)
                StoriesProgressBar(storiesCount: viewModel.stories.count,
                                   timerConfiguration: timerConfiguration,
                                   currentProgress: $currentProgress)
                .padding(.init(top: 28, leading: 0, bottom: 12, trailing: 0))
            }
        }
        .onChange(of: currentStoryIndex) { [currentStoryIndex] newValue in
            viewModel.stories[newValue].isViewed = true
            didChangeCurrentIndex(oldIndex: currentStoryIndex, newIndex: newValue)
        }
        .onChange(of: currentProgress) { newValue in
            didChangeCurrentProgress(newProgress: newValue)
        }
    }
    
    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
    }
    
    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
    }
}

#Preview {
    PreviewStoriesView(viewModel: MainScreenViewModel())
}
