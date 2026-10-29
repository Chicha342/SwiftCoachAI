import SwiftUI

struct RootView: View {
    @State private var isShowSplash = true
    
    var body: some View {
        VStack{
            if isShowSplash{
                SplashView()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                withAnimation {
                    isShowSplash = false
                }
            }
        }
    }
}

#Preview {
    RootView()
}
