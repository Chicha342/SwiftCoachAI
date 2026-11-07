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
        
        loadNews()
    }
    
    private let newsKey = "cachedNews"
    @Published var news: [NewsArticle] = [] {
        didSet {
            saveNews()
        }
    }
    
    func loadNews() {
        guard
            let data = UserDefaults.standard.data(forKey: newsKey),
            let savedNews = try? JSONDecoder().decode(
                [NewsArticle].self,
                from: data
            )
        else {
            return
        }

        news = savedNews
    }

    private func saveNews() {
        guard let data = try? JSONEncoder().encode(news) else {
            return
        }

        UserDefaults.standard.set(data, forKey: newsKey)
    }
    
    
    //MARK: -- Active day
    
    let key = "activeDays"

    var activeDays: Set<String> {
        let saved = UserDefaults.standard.stringArray(forKey: key) ?? []
        return Set(saved)
    }

    func markTodayAsActive() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        var days = activeDays
        days.insert(formatter.string(from: .now))

        UserDefaults.standard.set(Array(days), forKey: key)
    }
}
