import Foundation
import SwiftUI
import Combine

@MainActor
final class MainViewModel: ObservableObject{
    @Published var userName: String {
        didSet { UserDefaults.standard.set(userName, forKey: "userName") }
    }
    
    @Published var currentUserLevel: UserLevel {
        didSet {
            UserDefaults.standard.setValue(currentUserLevel.rawValue, forKey: "userLevel")
        }
    }
    
    @Published var daysOfStreak: Int {
        didSet { UserDefaults.standard.set(daysOfStreak, forKey: "daysOfStreak") }
    }
    
    
    init() {
        userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        
        let savedLevel = UserDefaults.standard.string(forKey: "userLevel") ?? "new"
        currentUserLevel = UserLevel(rawValue: savedLevel) ?? .new
        
        daysOfStreak = UserDefaults.standard.integer(forKey: "daysOfStreak")
    }
}
