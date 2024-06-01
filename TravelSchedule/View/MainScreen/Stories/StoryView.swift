import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        ZStack {
            Color.storyBackground
                .ignoresSafeArea()
            
            Image(story.image)
                .resizable()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 40))
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text(story.text)
                    .font(.bold34)
                    .lineLimit(2)
                Text(story.description)
                    .font(.regular20)
                    .lineLimit(3)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, UIConstants.baseInset)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    StoryView(story: Story(image: "StoryDemo5",
                           text: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                           description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"))
}
