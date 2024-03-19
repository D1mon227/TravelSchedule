import Foundation
import OpenAPIRuntime

protocol NetworkClientProtocol: AnyObject {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetweenStations
    func getStationSchedule(station: String) async throws -> StationSchedule
    func getThreadList(uid: String) async throws -> ThreadList
    func getNearestSettlement(lat: Double, lng: Double) async throws -> Settlement
    func getCarrierInformation(code: String, system: String) async throws -> Carriers
    func getAllStations() async throws -> HTTPBody
    func getYandexCopyright() async throws -> Copyrights
}
