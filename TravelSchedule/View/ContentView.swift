import SwiftUI

struct ContentView: View {
    private let networkClient = NetworkClient()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainScreenView()
                .tabItem {
                    Image(selectedTab == 0 ? .selectedTabBarItem1 : .tabBarItem1)
                }
                .tag(0)
            SettingsScreenView()
                .tabItem {
                    Image(selectedTab == 1 ? .selectedTabBarItem2 : .tabBarItem2)
                }
                .tag(1)
        }
        .background(Color.whiteUniversal)
        
//        VStack {
//            CustomButton(action: getNearestStations,
//                         text: "Получить ближайшие станции")
//            CustomButton(action: getScheduleBetweenStations,
//                         text: "Показать расписание между станциями")
//            CustomButton(action: getStationSchedule,
//                         text: "Показать расписание по станции")
//            CustomButton(action: getThreadList,
//                         text: "Показать список станций следования")
//            CustomButton(action: getNearestSettlement,
//                         text: "Показать ближайший город")
//            CustomButton(action: getCarrierInformation,
//                         text: "Показать информацию о перевозчике")
//            CustomButton(action: getAllStations,
//                         text: "Показать все станции")
//            CustomButton(action: getCopyright,
//                         text: "Показать Копирайт")
//        }
//        .padding()
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
