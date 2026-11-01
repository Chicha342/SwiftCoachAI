import Foundation
import SwiftUI
import Combine

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

@MainActor
final class MainViewModel: ObservableObject{
    @Published var userName: String = "User1444"
    @Published var currentUserLevel: UserLevel = .new
    @Published var daysOfStreak: Int = 0
}
