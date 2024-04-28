import SwiftUI

struct FilterTransferOptionView: View {
    var isShowTitle: Bool
    
    @Binding var isShowTransferOptions: Bool?
    
    var body: some View {
        HStack {
            Text(isShowTitle ? "Да" : "Нет")
                .font(.regular17)
                .foregroundStyle(.blackUniversal)
            
            Spacer()
            
            ZStack {
                Circle()
                    .strokeBorder(.blackUniversal, lineWidth: 2.5)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.whiteUniversal)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(isShowTransferOptions == nil || isShowTransferOptions != isShowTitle ? .whiteUniversal : .blackUniversal)
                
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .padding(.leading, 16)
        .padding(.trailing, 18)
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
