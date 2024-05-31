import Foundation

enum FilterHeader: CaseIterable, Identifiable {
    case departureTime
    case showOptionWithTransfer
    
    var id: Self {
        self
    }
}

enum FilterSchedule: CaseIterable, Identifiable {
    case morning
    case afternoon
    case evening
    case night
    
    var id: Self {
        self
    }
}

struct FilterOptions {
    let options: [FilterSchedule]
    let isShowTransfer: Bool
}
