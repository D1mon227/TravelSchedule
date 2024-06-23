import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        ZStack {
            Color.storyBackground
                .ignoresSafeArea()
            
            if let image = story.fullImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: UIConstants.StoriesScreenView.storyImageCornerRadius))
            }
        }
        .overlay(
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: UIConstants.StoriesScreenView.storyTitleSpacing) {
                    if let title = story.title {
                        Text(title)
                            .font(.bold34)
                            .lineLimit(2)
                    }
                    
                    if let description = story.description {
                        Text(description)
                            .font(.regular20)
                            .lineLimit(3)
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, UIConstants.baseInset)
                .padding(.bottom, UIConstants.StoriesScreenView.imageBottomInset)
            }
        )
    }
}

#Preview {
    StoryView(story: Story(id: 1,
                           previewImage: "StoryPreview5",
                           fullImage: "StoryDemo5",
                           title: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text ",
                           description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                           isViewed: false))
}
