import SwiftUI

struct StationsView: View {
    @EnvironmentObject var router: ScheduleRouter
    @ObservedObject var viewModel: StationViewModel
    @State var searchText: String = ""
    
    @Binding var stationName: String
    var direction: Direction
    
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
            
            ScrollView() {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.filteredStations) { station in
                        StationRowView(station: station)
                            .onTapGesture {
                                proceedWithStationName(station)
                            }
                    }
                }
                if viewModel.filteredStations.isEmpty {
                    Text("Станция не найдена")
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                        .padding(.top, 192)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 16)
        .navigationTitle("Выбор станции").navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(
                    action: {
                        router.returnBack()
                    }, label: {
                        Image(.chevronBack)
                    }
                )
            }
        }
    }
    
    private func proceedWithStationName(_ station: Station) {
        switch direction {
        case .from:
            stationName += " (\(station.name))"
        case .to:
            stationName += " (\(station.name))"
        }
        router.returnToRoot()
    }
}

#Preview {
    StationsView(
        viewModel: StationViewModel(),
        stationName: .constant(""),
        direction: .from)
}
