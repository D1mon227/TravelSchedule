import SwiftUI

struct ProgressBarView: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: UIConstants.StoriesScreenView.progressBarCornerRadius)
                    .frame(width: geometry.size.width,
                           height: UIConstants.StoriesScreenView.progressBarHeight)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: UIConstants.StoriesScreenView.progressBarCornerRadius)
                    .frame(width: min(progress * geometry.size.width,
                                      geometry.size.width),
                           height: UIConstants.StoriesScreenView.progressBarHeight)
                    .foregroundStyle(.blueUniversal)
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
    }
}

private struct MaskView: View {
    var numberOfSections: Int
    var body: some View {
        HStack(spacing: UIConstants.StoriesScreenView.progressBarSpacing) {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: UIConstants.StoriesScreenView.progressBarCornerRadius)
            .frame(height: UIConstants.StoriesScreenView.progressBarHeight)
            .foregroundStyle(.white)
    }
}

#Preview {
    Color.redUniversal
        .ignoresSafeArea()
        .overlay {
            ProgressBarView(numberOfSections: 3, progress: 0.6)
        }
}
