import SwiftUI

struct FilterScheduleOptionView: View {
    @State var isSelected = false
    @Binding var options: [FilterSchedule]
    
    var option: FilterSchedule
    
    var body: some View {
        HStack {
            let schedule = switch option {
            case .morning:
                LocalizableConstants.Filter.morning
            case .afternoon:
                LocalizableConstants.Filter.afternoon
            case .evening:
                LocalizableConstants.Filter.evening
            case .night:
                LocalizableConstants.Filter.night
            }
            
            Text(schedule)
                .font(.regular17)
                .foregroundStyle(.blackUniversal)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: UIConstants.FilterScheduleOptionView.rectangleWidth,
                           height: UIConstants.FilterScheduleOptionView.rectangleWidth)
                    .foregroundStyle(isSelected ? .blackUniversal : .whiteUniversal)
                    .border(.blackUniversal, width: UIConstants.FilterScheduleOptionView.borderWidth)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: UIConstants.FilterScheduleOptionView.rectangleCornerRadius))
                
                if isSelected {
                    Text("✓")
                        .font(.bold17)
                        .foregroundStyle(.whiteUniversal)
                }
            }
        }
        .frame(maxWidth: .infinity,
               minHeight: UIConstants.baseHeight)
        .padding(.leading, UIConstants.baseInset)
        .padding(.trailing, UIConstants.FilterScheduleOptionView.trailingPadding)
        .onTapGesture {
            withAnimation {
                changeScheduleOption()
            }
        }
        .onAppear {
            isSelected = options.contains(option)
        }
    }
    
    private func changeScheduleOption() {
        isSelected.toggle()
        
        if isSelected {
            options.append(option)
        } else if let index = options.firstIndex(of: option) {
            options.remove(at: index)
        }
    }
}

#Preview {
    FilterScheduleOptionView(options: .constant([]),
                             option: .morning)
}
