import SwiftUI

struct ProgressBarView: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: geometry.size.width,
                           height: 6)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: min(progress * geometry.size.width,
                                      geometry.size.width),
                           height: 6)
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
        HStack(spacing: 6) {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(height: 6)
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
