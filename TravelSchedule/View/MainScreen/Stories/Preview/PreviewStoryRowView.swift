import SwiftUI

struct PreviewStoryRowView: View {
    var story: Story
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let image = story.previewImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: UIConstants.StoriesScreenView.storyPreviewCornerRadius))
                    .opacity(story.isViewed ? 0.5 : 1)
                    .overlay(
                        !story.isViewed ? RoundedRectangle(cornerRadius: UIConstants.StoriesScreenView.storyPreviewCornerRadius).strokeBorder(.blueUniversal, lineWidth: UIConstants.StoriesScreenView.storyPreviewBorderWidth) : nil
                    )
            }
            
            if let title = story.title {
                Text(title)
                    .font(.regular12)
                    .foregroundStyle(.white)
                    .padding(.horizontal, UIConstants.StoriesScreenView.storyPreviewLeadingInset)
                    .padding(.bottom, UIConstants.StoriesScreenView.storyPreviewBottomInset)
                    .lineLimit(3)
            }
        }
        .frame(width: UIConstants.StoriesScreenView.storyPreviewWidth,
               height: UIConstants.StoriesScreenView.storyPreviewHeight)
    }
}

#Preview {
    PreviewStoryRowView(story: Story(id: 1,
                                     previewImage: "StoryPreview5",
                                     fullImage: "StoryDemo5",
                                     title: "Text Text Text Text Text Text Text",
                                     description: "Text Text Text",
                                     isViewed: false))
}
