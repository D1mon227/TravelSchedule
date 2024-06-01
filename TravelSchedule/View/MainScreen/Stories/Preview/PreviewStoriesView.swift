import SwiftUI

struct PreviewStoriesView: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories) { story in
                    PreviewStoryRowView(story: story)
                }
            }
            .padding(.horizontal, UIConstants.baseInset)
        }
        .frame(maxWidth: .infinity, maxHeight: 188)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PreviewStoriesView(viewModel: StoryViewModel())
}
