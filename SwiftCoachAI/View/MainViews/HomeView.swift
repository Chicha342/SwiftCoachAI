import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    @State private var isShowSettingsView = false
    
    let service = NewsService()
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Header(typeOfHeader: .home, action: {
                    withAnimation {
                        isShowSettingsView = true
                    }
                })
                ScrollView{
                    VStack{
                        LineHomeViewConteiner(text: "Activity Calendar", image: "calendar")
                            .padding(.top)
                            .padding(.horizontal)
                        
                        CalendarView()
                        
                        TipContainerView()
                            .padding(.top, 5)
                        
                        LineHomeViewConteiner(text: "Swift News", image: "swift")
                        .padding(.top)
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.news) { article in
                                    NewsContainer(newsItem: article)
                                }
                            }
                            .padding(.horizontal)
                        }

                    }
                    .padding(.bottom, 167)
                }
            }
            
            if isShowSettingsView == true {
                Color.black.opacity(0.30)
                    .ignoresSafeArea()
                
                SettingsView(isOpenSettings: $isShowSettingsView)
            }
        }
        .task {
            do {
                viewModel.news = try await service.fetchNews(tag: "swift")
            } catch {
                print("News error:", error)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(MainViewModel())
}
