import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @AppStorage("HasCompletedOnboarding") private var hasCompletedOnboarding = true
    @AppStorage("HasCompletedSkills") private var hasCompletedSkills = true
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Header(typeOfHeader: .home)
                ScrollView{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            hasCompletedOnboarding = false
                            hasCompletedSkills = false
                        }
                    }, label: {
                        Text("Reset")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Bold", size: 20))
                            .padding()
                            .background(.orange)
                            .cornerRadius(20)
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(MainViewModel())
}
