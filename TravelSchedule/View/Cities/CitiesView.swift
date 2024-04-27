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
                    ForEach(viewModel.filteredCities) { city in
                        CityRowView(city: city)
                            .onTapGesture {
                                proceedWithCityName(city)
                            }
                    }
                }
                if viewModel.filteredCities.isEmpty {
                    Text("Город не найден")
                        .font(.bold24)
                        .foregroundStyle(.blackUniversal)
                        .padding(.top, 192)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 16)
        .navigationTitle("Выбор города").navigationBarTitleDisplayMode(.inline)
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
