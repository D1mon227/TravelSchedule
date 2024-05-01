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
                    .padding(.leading, UIConstants.StationView.leadingPadding)
                TextField(LocalizableConstants.City.request,
                          text: $searchText).onChange(of: searchText) { newValue in
                    viewModel.onTextChanged(newValue)
                }
                          .padding(.vertical, UIConstants.StationView.leadingPadding)
                if !searchText.isEmpty {
                    Button(
                        action: {
                            searchText = ""
                            viewModel.onTextChanged(searchText)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.grayUniversal)
                        }
                        .padding(.trailing, UIConstants.StationView.trailingPadding)
                }
            }
            .frame(height: UIConstants.StationView.textFieldHeight)
            .background(.lightGrayUniversal)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: UIConstants.StationView.cornerRadius))
            
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
                    Text(LocalizableConstants.Station.notFound)
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                        .padding(.top, UIConstants.StationView.topPadding)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, UIConstants.baseInset)
        .navigationTitle(LocalizableConstants.Station.title).navigationBarTitleDisplayMode(.inline)
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
