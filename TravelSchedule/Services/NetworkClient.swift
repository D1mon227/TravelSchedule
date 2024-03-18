import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations
typealias ScheduleBetweenStations = Components.Schemas.ScheduleBetweenStations
typealias StationSchedule = Components.Schemas.StationSchedule
typealias ThreadList = Components.Schemas.ThreadList
typealias Settlement = Components.Schemas.Settlement
typealias Carriers = Components.Schemas.Carriers
typealias AllStations = Components.Schemas.AllStations
typealias Copyrights = Components.Schemas.Copyrights

final class NetworkClient: NetworkClientProtocol {
    private let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    private let apikey = Resources.apiKey.apiKey
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apikey,
                lat: lat,
                lng: lng,
                distance: distance
            )
        )
        return try response.ok.body.json
    }
    
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetweenStations {
        let responce = try await client.getScheduleBetweenStations(
            query: .init(
                apikey: apikey,
                from: from,
                to: to
            )
        )
        return try responce.ok.body.json
    }
    
    func getStationSchedule(station: String) async throws -> StationSchedule {
        let responce = try await client.getStationSchedule(
            query: .init(
                apikey: apikey,
                station: station
            )
        )
        return try responce.ok.body.json
    }
    
    func getThreadList(uid: String) async throws -> ThreadList {
        let responce = try await client.getThreadList(
            query: .init(
                apikey: apikey,
                uid: uid
            )
        )
        return try responce.ok.body.json
    }
    
    func getNearestSettlement(lat: Double, lng: Double) async throws -> Settlement {
        let responce = try await client.getNearestSettlement(
            query: .init(
                apikey: apikey,
                lat: lat,
                lng: lng
            )
        )
        return try responce.ok.body.json
    }
    
    func getCarrierInformation(code: String, system: String) async throws -> Carriers {
        let responce = try await client.getCarrierInformation(
            query: .init(
                apikey: apikey,
                code: code,
                system: .iata
            )
        )
        return try responce.ok.body.json
    }
    
    func getAllStations() async throws -> HTTPBody {
        let responce = try await client.getAllStations(
            query: .init(
                apikey: apikey
            )
        )
        return try responce.ok.body.html
    }
    
    func getYandexCopyright() async throws -> Copyrights {
        let responce = try await client.getYandexCopyright(
            query: .init(
                apikey: apikey
            )
        )
        return try responce.ok.body.json
    }
}
