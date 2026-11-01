import SwiftUI

struct RootView: View {
    @State private var isShowSplash = true
    @AppStorage("HasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("HasCompletedSkills") private var hasCompletedSkills = false
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            if !hasCompletedOnboarding {
                OnboardingView(isShowOnboarding: $hasCompletedOnboarding)
                    .id("Onboarding")
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            } else if !hasCompletedSkills {
                SkillsPickerView(isCompleted: $hasCompletedSkills, viewModel: MainViewModel())
                    .id("SkillsPicker")
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            } else {
                HomeView()
                    .environmentObject(MainViewModel())
                    .transition(.opacity)
            }
            
            if isShowSplash{
                SplashView()
                    .transition(.opacity.combined(with: .scale(scale: 1.05)))
                    .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: hasCompletedOnboarding)
        .animation(.easeInOut(duration: 0.4), value: hasCompletedSkills)
        .animation(.easeInOut(duration: 0.5), value: isShowSplash)
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
