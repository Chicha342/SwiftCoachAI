import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [
                Color(red: 1.0, green: 0.76, blue: 0.55),
                Color(red: 1.0, green: 0.56, blue: 0.36),
                Color(red: 1.0, green: 0.34, blue: 0.22),
                Color(red: 0.78, green: 0.12, blue: 0.16)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image("BackGroundImage")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}


