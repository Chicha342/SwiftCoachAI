import SwiftUI

struct TabBarView: View {
    @State private var currentTab: ScreensTabbarEnum = .home
    @Namespace private var animation
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            switch currentTab {
            case .home:
                HomeView()
            case .chat:
                ChatView()
            case .notes:
                NotesView()
            }
            
            VStack{
                Spacer()
                
                HStack{
                    ForEach(ScreensTabbarEnum.allCases, id: \.self) {tabbarItem in
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                currentTab = tabbarItem
                            }
                        }, label: {
                            VStack{
                                Image(systemName: tabbarItem.images)
                                    .foregroundStyle(currentTab == tabbarItem ? .orange : .white)
                                    .font(.custom("Outfit-Regular", size: 21))
                                
                                Text("\(tabbarItem.names)")
                                    .foregroundStyle(currentTab == tabbarItem ? .orange : .white)
                                    .font(.custom("Outfit-Bold", size: 14))
                            }
                        })
                        .padding()
                        .transition(.slide)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background {
                            if currentTab == tabbarItem {
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(.white)
                                    .matchedGeometryEffect(
                                        id: "selectedTab",
                                        in: animation
                                    )
                            }
                        }
                        .cornerRadius(100)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 67)
                .background(.black.opacity(0.13))
                .cornerRadius(1000)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 1000)
                        .stroke(.white.opacity(0.22))
                })
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    VStack{
        TabBarView()
            .environmentObject(MainViewModel())
    }
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
