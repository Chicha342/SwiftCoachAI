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
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(MainViewModel())
}
