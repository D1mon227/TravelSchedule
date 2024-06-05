import SwiftUI

struct PreviewStoryRowView: View {
    var story: Story
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let image = story.previewImage {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .opacity(story.isViewed ? 0.5 : 1)
                    .overlay(
                        !story.isViewed ? RoundedRectangle(cornerRadius: 16).strokeBorder(.blueUniversal, lineWidth: 4) : nil
                    )
            }
            
            if let title = story.title {
                Text(title)
                    .font(.regular12)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 12)
                    .lineLimit(3)
            }
        }
        .frame(width: 92, height: 140)
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
