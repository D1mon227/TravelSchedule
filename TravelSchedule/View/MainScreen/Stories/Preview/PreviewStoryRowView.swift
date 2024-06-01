import SwiftUI

struct PreviewStoryRowView: View {
    var story: Story
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(story.image)
                .resizable()
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(.blueUniversal, lineWidth: 4))
            Text(story.text)
                .font(.regular12)
                .foregroundStyle(.white)
                .frame(width: 76, height: 45)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
                .lineLimit(3)
        }
    }
}

#Preview {
    PreviewStoryRowView(story: Story(image: "StoryPreview5",
                              text: "Text Text Text Text Text Text Text",
                              description: "Text Text Text"))
}
