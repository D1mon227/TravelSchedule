import SwiftUI

struct StationsView: View {
    @StateObject var viewModel = StationViewModel()
    @State var searchText: String = ""
    @Binding var path: [NavigationFlow]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(searchText.isEmpty ? .grayUniversal : .blackUniversal)
                    .padding(.leading, 8)
                TextField("Введите запрос",
                          text: $searchText).onChange(of: searchText) { newValue in
                    viewModel.onTextChanged(newValue)
                }
                          .padding(.vertical, 8)
                if !searchText.isEmpty {
                    Button(
                        action: {
                            searchText = ""
                            viewModel.onTextChanged(searchText)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.grayUniversal)
                        }
                        .padding(.trailing, 6)
                }
            }
            .frame(height: 36)
            .background(Color.lightGrayUniversal)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.filteredStations) { station in
                        StationRowView(station: station)
                    }
                }
                if viewModel.filteredStations.isEmpty {
                    Text("Станция не найдена")
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                        .padding(.top, 192)
                }
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Выбор станции").navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(
                    action: {
                        path.removeLast()
                    }, label: {
                        Image(.chevronBack)
                    }
                )
            }
        }
    }
}

#Preview {
    StationsView(path: .constant([]))
}
