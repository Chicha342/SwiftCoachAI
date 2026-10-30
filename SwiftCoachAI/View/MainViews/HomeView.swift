import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Text("Your skill level: \(viewModel.currentUserLevel.title)")
                    .foregroundStyle(.white)
                    .font(.custom("Nohemi-Bold", size: 20))
                
                Text("Your Username: \(viewModel.userName)")
                    .foregroundStyle(.white)
                    .font(.custom("Nohemi-Bold", size: 20))
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(MainViewModel())
}
