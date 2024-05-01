import SwiftUI

struct CitiesView: View {
    @EnvironmentObject var router: ScheduleRouter
    @ObservedObject var viewModel: CityViewModel
    @State var searchText: String = ""
    
    @Binding var cityName: String
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
                    ForEach(viewModel.filteredCities) { city in
                        CityRowView(city: city)
                            .onTapGesture {
                                proceedWithCityName(city)
                            }
                    }
                }
                if viewModel.filteredCities.isEmpty {
                    Text(LocalizableConstants.City.notFound)
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                        .padding(.top, UIConstants.StationView.topPadding)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, UIConstants.baseInset)
        .navigationTitle(LocalizableConstants.City.title).navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.returnBack()
                }, label: {
                    Image(.chevronBack)
                })
            }
        }
    }
    
    private func proceedWithCityName(_ city: City) {
        switch direction {
        case .from:
            cityName = city.name
        case .to:
            cityName = city.name
        }
        router.path.append(ScheduleRouter.NavigationFlow.stations(direction))
    }
}

#Preview {
    CitiesView(
        viewModel: CityViewModel(),
        cityName: .constant(""),
        direction: .from)
}
