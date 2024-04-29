import Foundation

enum LocalizableConstants {
    
    enum MainScreen {
        static let from = NSLocalizedString("mainscreen.from", comment: "")
        static let to = NSLocalizedString("mainscreen.to", comment: "")
        static let find = NSLocalizedString("mainscreen.find", comment: "")
    }
    
    enum City {
        static let title = NSLocalizedString("city.title", comment: "")
        static let request = NSLocalizedString("city.request", comment: "")
        static let notFound = NSLocalizedString("city.notFound", comment: "")
    }
    
    enum Station {
        static let title = NSLocalizedString("station.title", comment: "")
        static let request = NSLocalizedString("city.request", comment: "")
        static let notFound = NSLocalizedString("station.notFound", comment: "")
    }
    
    enum Schedule {
        static let time = NSLocalizedString("schedule.time", comment: "")
        static let noOptions = NSLocalizedString("schedule.noOptions", comment: "")
    }
    
    enum Filter {
        static let departureTime = NSLocalizedString("filter.departureTime", comment: "")
        static let morning = NSLocalizedString("filter.morning", comment: "")
        static let afternoon = NSLocalizedString("filter.afternoon", comment: "")
        static let evening = NSLocalizedString("filter.evening", comment: "")
        static let night = NSLocalizedString("filter.night", comment: "")
        static let showOptionsWithLayovers = NSLocalizedString("filter.isShowOptionsWithLayovers", comment: "")
        static let yes = NSLocalizedString("filter.yes", comment: "")
        static let no = NSLocalizedString("filter.no", comment: "")
        static let apply = NSLocalizedString("filter.apply", comment: "")
    }
    
    enum Carrier {
        static let title = NSLocalizedString("carrier.title", comment: "")
        static let email = NSLocalizedString("carrier.email", comment: "")
        static let phone = NSLocalizedString("carrier.phone", comment: "")
    }
    
    enum Settings {
        static let darkMode = NSLocalizedString("settings.darkMode", comment: "")
        static let userAgreement = NSLocalizedString("settings.userAgreement", comment: "")
        static let apiYandexSchedule = NSLocalizedString("settings.apiYandexSchedule", comment: "")
        static let version = NSLocalizedString("settings.version", comment: "")
    }
    
    enum Agreement {
        static let title = NSLocalizedString("settings.userAgreement", comment: "")
    }
}
