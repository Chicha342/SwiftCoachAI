import Foundation

final class NewsService {
    
    func fetchNews(tag: String) async throws -> [NewsArticle] {
        var mainUrl = URLComponents(string: "https://dev.to/api/articles")!
        
        mainUrl.queryItems = [
            URLQueryItem(name: tag, value: tag),
            URLQueryItem(name: "per_page", value: "10")
        ]
        
        let url = mainUrl.url!
        
        var request = URLRequest(url: url)
        
        request.setValue(
            "SwiftNewsApp/1.0",
            forHTTPHeaderField: "User-Agent"
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode([NewsArticle].self, from: data)
    }
}
