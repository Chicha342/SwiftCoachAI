import SwiftUI

struct NewsContainer: View {
    let newsItem: NewsArticle
    
    @State private var isShowingArticle = false
    
    var body: some View {
        VStack(){
            ZStack(alignment: .topLeading){
                AsyncImage(url: URL(string: newsItem.cover_image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(width: 343, height: 188)
                .clipped()
                
                    Text(formattedDate(newsItem.published_at))
                        .font(.custom("Outfit-SemiBold", size: 12))
                        .foregroundStyle(.white)
                        .padding(6)
                        .background(.black.opacity(0.51))
                        .cornerRadius(10)
                        .padding()
            }
            
            VStack(alignment: .leading){
                Text(newsItem.title)
                    .font(.custom("Outfit-SemiBold", size: 17))
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                HStack{
                    Text("\(newsItem.reading_time_minutes) min to read")
                        .font(.custom("Outfit-SemiBold", size: 17))
                        .foregroundStyle(.orange)
                    
                    Spacer()
                    
                    Image(systemName: "link")
                        .foregroundStyle(.orange)
                        .padding(5)
                        .background(.orange.opacity(0.18))
                        .cornerRadius(100)
                }
                .padding(.vertical, 6)
            }
            .padding(.horizontal)
        }
        .background(.white)
        .frame(width: 343)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black.opacity(0.32), lineWidth: 1)
        }
        .onTapGesture {
            withAnimation {
                isShowingArticle = true
            }
        }
        .sheet(isPresented: $isShowingArticle) {
            if let url = URL(string: newsItem.url) {
                WebView(url: url)
                    .ignoresSafeArea()
            }
        }
        
    }
    
    func formattedDate(_ string: String) -> String {
        let isoFormatter = ISO8601DateFormatter()

        guard let date = isoFormatter.date(from: string) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "eng_ENG")
        outputFormatter.dateFormat = "d MMMM yyyy HH:mm"

        return outputFormatter.string(from: date)
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        NewsContainer(newsItem: NewsArticle(
            id: 1,
            title: "Getting Started with SwiftUI",
            description: "Learn how to build iOS apps...",
            cover_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFRhqBxf9DhdcMjwXnpoXFeeCNPBl0cbOqqus-TEJvgA&s=10",
            url: "https://dev.to/article",
            published_at: "2026-11-05T10:00:00Z",
            tag_list: ["swift", "ios", "swiftui"],
            reading_time_minutes: 5)
        )
    }
}
