import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var router: ScheduleRouter
    @StateObject var viewModel = MainScreenViewModel()
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView(selection: $selectedTab) {
                VStack(spacing: 0) {
                    PreviewStoriesView(viewModel: viewModel)
                    DirectionView()
                        .padding(.top, 20)
                    
                    if viewModel.isDirectionsFilled {
                        Button {
                            router.path.append(ScheduleRouter.NavigationFlow.carriers)
                        } label: {
                            Text(LocalizableConstants.MainScreen.find)
                                .font(.bold17)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: UIConstants.MainScreenView.findButtonWidth,
                               maxHeight: UIConstants.baseHeight)
                        .background(.blueUniversal)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: UIConstants.MainScreenView.cornerRadius))
                        .padding(.top, UIConstants.baseInset)
                    }
                    
                    Spacer()
                    Divider()
                }
                .tabItem {
                    Image(selectedTab == 0 ? .selectedTabBarItem1 : .tabBarItem1)
                }
                .tag(0)
                .padding(.bottom, UIConstants.MainScreenView.bottomInset)
                
                VStack {
                    SettingsScreenView()
                    Divider()
                }
                .tabItem {
                    Image(selectedTab == 1 ? .selectedTabBarItem2 : .tabBarItem2)
                }
                .tag(1)
                .padding(.bottom, UIConstants.MainScreenView.bottomInset)
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
                    CarriersView(viewModel: CarrierViewModel(),
                                 title: (viewModel.fromDirection, viewModel.toDirection))
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}

