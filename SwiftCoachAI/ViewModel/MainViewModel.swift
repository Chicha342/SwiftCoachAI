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
}

@MainActor
final class MainViewModel: ObservableObject{
    @Published var userName: String = ""
    @Published var currentUserLevel: UserLevel = .new
    
}
