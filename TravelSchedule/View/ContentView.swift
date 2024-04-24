import SwiftUI

enum NavigationFlow: String {
    case cities = "Cities"
}

struct ContentView: View {
    private let networkClient = NetworkClient()
    
    @StateObject var viewModel = MainScreenViewModel()
    @State private var selectedTab = 0
    @State private var path: [NavigationFlow] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView(selection: $selectedTab) {
                VStack(spacing: 0) {
                    MainScreenView(path: $path)
                        .environmentObject(viewModel)
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
            .navigationDestination(for: NavigationFlow.self) { id in
                switch (id) {
                case .cities:
                    CitiesView(path: $path)
                        .environmentObject(viewModel)
                }
            }
        }
    }
    
    func getNearestStations() {
        Task {
            let nearestStations = try await networkClient.getNearestStations(lat: 50.440046,
                                                                             lng: 40.4882367,
                                                                             distance: 50)
            print(nearestStations)
        }
    }
    
    func getScheduleBetweenStations() {
        Task {
            let scheduleBetweenStations = try await networkClient.getScheduleBetweenStations(from: "c146",
                                                                                             to: "c213")
            print(scheduleBetweenStations)
        }
    }
    
    func getStationSchedule() {
        Task {
            let stationSchedule = try await networkClient.getStationSchedule(station: "s9600213")
            print(stationSchedule)
        }
    }
    
    func getThreadList() {
        Task {
            let threadList = try await networkClient.getThreadList(uid: "126YE_10_2")
            print(threadList)
            
        }
    }
    
    func getNearestSettlement() {
        Task {
            let settlement = try await networkClient.getNearestSettlement(lat: 59.864177,
                                                                          lng: 30.319163)
            print(settlement)
        }
    }
    
    func getCarrierInformation() {
        Task {
            let carrier = try await networkClient.getCarrierInformation(code: "SU",
                                                                        system: "iata")
            print(carrier)
        }
    }
    
    func getAllStations() {
        Task {
            let responce = try await networkClient.getAllStations()
            let data = try await Data(collecting: responce,
                                      upTo: 50 * 1024 * 1024)
            let stationsList = try JSONDecoder().decode(AllStations.self,
                                                        from: data)
            guard let countOfStations = stationsList.countries?.count else { return }
            print(countOfStations)
        }
    }
    
    func getCopyright() {
        Task {
            let copyright = try await networkClient.getYandexCopyright()
            print(copyright)
        }
    }
}

#Preview {
    ContentView()
}

struct CustomButton: View {
    var action: () -> Void
    var text: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .frame(width: 350, height: 50)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
