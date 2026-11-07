import Foundation


enum headerType {
    case home
    case chat
    case notes
}

enum ScreensTabbarEnum: CaseIterable {
    case home, chat, notes
    
    var names: String {
        switch self {
        case .home:
            return "Home"
        case .chat:
            return "Chat"
        case .notes:
            return "Notes"
        }
    }
    
    var images: String {
        switch self {
        case .home:
            return "house"
        case .chat:
            return "bubble"
        case .notes:
            return "document"
        }
    }
}


enum UserLevel: String, CaseIterable, Hashable, Identifiable {
    case new
    case junior
    case middle
    case senior
    
    var id: String { rawValue }
    var title: String {
        switch self {
        case .new: return "New"
        case .junior: return "Junior"
        case .middle: return "Middle"
        case .senior: return "Senior"
        }
    }
    
    var subtitle: String{
        switch self {
        case .new:
            return "Just getting started"
        case .junior:
            return "Know the basics"
        case .middle:
            return "Comfortable with SwiftUI"
        case .senior:
            return "Architecture and performance"
        }
    }
    
    var icon: String{
        switch self {
        case .new:
            return "newLevelIcon"
        case .junior:
            return "JuniorLevelIcon"
        case .middle:
            return "middleLevelIcon"
        case .senior:
            return "SeniorLevelIcon"
        }
    }
}

struct NewsArticle: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let cover_image: String?
    let url: String
    let published_at: String
    let tag_list: [String]
    let reading_time_minutes: Int
}
