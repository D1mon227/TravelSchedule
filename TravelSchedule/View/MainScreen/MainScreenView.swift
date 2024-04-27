import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var router: ScheduleRouter
    @StateObject var viewModel = MainScreenViewModel()
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView(selection: $selectedTab) {
                VStack(spacing: 0) {
                    DirectionView()
                    
                    if viewModel.isDirectionsFilled {
                        Button {
                            router.path.append(ScheduleRouter.NavigationFlow.carriers)
                        } label: {
                            Text("Найти")
                                .font(.bold17)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: 150, maxHeight: 60)
                        .background(Color.blueUniversal)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.top, 16)
                    }
                    
                    Spacer()
                    Divider()
                }
                .tabItem {
                    Image(selectedTab == 0 ? .selectedTabBarItem1 : .tabBarItem1)
                }
                .tag(0)
                .padding(.bottom, 10)
                
                VStack {
                    SettingsScreenView()
                    Divider()
                }
                .tabItem {
                    Image(selectedTab == 1 ? .selectedTabBarItem2 : .tabBarItem2)
                }
                .tag(1)
                .padding(.bottom, 10)
            }
            .environmentObject(viewModel)
            .navigationDestination(for: ScheduleRouter.NavigationFlow.self) { id in
                switch id {
                case .cities(let direction):
                    CitiesView(viewModel: CityViewModel(),
                               cityName: direction == .from ? $viewModel.fromDirection : $viewModel.toDirection,
                               direction: direction)
                case .stations(let direction):
                    StationsView(viewModel: StationViewModel(),
                                 stationName: direction == .from ? $viewModel.fromDirection : $viewModel.toDirection,
                                 direction: direction)
                case .carriers:
                    CarriersView(viewModel: CarrierViewModel())
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}

