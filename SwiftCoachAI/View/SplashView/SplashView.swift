import SwiftUI

struct SplashView: View {
    @State private var showIcon = false
    @State private var showText = false
    
    let service = NewsService()
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                HStack{
                    Image(systemName: "swift")
                        .foregroundStyle(.orange)
                        .font(.system(size: 40))
                        .padding()
                        .frame(width: 60, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading){
                        Text("SwiftCoachAI")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Bold", size: 20))
                        
                        Text("Make your learning easier")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Light", size: 15))
                    }
                }
                .opacity(showText ? 1 : 0)
                .offset(x: showText ? 0 : 20)
            }
        }
        .onAppear{
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                showIcon = true
            }
            
            withAnimation(.easeOut(duration: 0.6).delay(0.25)) {
                showText = true
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
    SplashView()
}
