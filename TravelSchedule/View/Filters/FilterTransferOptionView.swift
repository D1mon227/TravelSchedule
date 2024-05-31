import SwiftUI

struct FilterTransferOptionView: View {
    var isShowTitle: Bool
    
    @Binding var isShowTransferOptions: Bool?
    
    var body: some View {
        HStack {
            Text(isShowTitle ? LocalizableConstants.Filter.yes : LocalizableConstants.Filter.no)
                .font(.regular17)
                .foregroundStyle(.blackUniversal)
            
            Spacer()
            
            ZStack {
                Circle()
                    .strokeBorder(.blackUniversal, lineWidth: UIConstants.FilterTransferOptionView.strokeBorder)
                    .frame(width: UIConstants.FilterTransferOptionView.circleWidth,
                           height: UIConstants.FilterTransferOptionView.circleWidth)
                    .foregroundStyle(.whiteUniversal)
                
                Circle()
                    .frame(width: UIConstants.FilterView.inSideRectangleCircleWidth,
                           height: UIConstants.FilterView.inSideRectangleCircleWidth)
                    .foregroundStyle(isShowTransferOptions == nil || isShowTransferOptions != isShowTitle ? .whiteUniversal : .blackUniversal)
                
            }
        }
        .frame(maxWidth: .infinity,
               minHeight: UIConstants.baseHeight)
        .padding(.leading, UIConstants.baseInset)
        .padding(.trailing, UIConstants.FilterTransferOptionView.trailingPadding)
        .onTapGesture {
            withAnimation {
                changeTransferOption()
            }
        }
    }
    
    private func changeTransferOption() {
        if isShowTitle != isShowTransferOptions {
            isShowTransferOptions = isShowTitle
        } else {
            isShowTransferOptions = nil
        }
    }
}

#Preview {
    FilterTransferOptionView(isShowTitle: true,
                             isShowTransferOptions: .constant(true))
}
