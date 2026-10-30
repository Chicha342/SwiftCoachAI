import SwiftUI

struct OnboardingView: View {
    @Binding var isShowOnboarding: Bool
    
    @State private var currentTab: Int = 0
    
    let onboardingData: [OnboardingTab] = [
        OnboardingTab(image: "swift", text: "Learn Swift Your Way", semiText: "Learn Swift from the basics to advanced concepts with a personalized learning experience."),
        OnboardingTab(image: "chevron.left.forwardslash.chevron.right", text: "Your AI Coding Mentor", semiText: "Ask questions, explore complex topics, and get instant explanations from your personal AI mentor."),
        OnboardingTab(image: "dumbbell", text: "Build Real Skills", semiText: "Solve coding challenges, write real code, and turn your knowledge into practical iOS development skills.")
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                onboardingData[currentTab]
                    .id(currentTab)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)
                        )
                    )
                
                HStack {
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentTab ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        if currentTab < onboardingData.count - 1 {
                            currentTab += 1
                        } else {
                            isShowOnboarding = true
                        }
                    }
                }, label: {
                    Text(currentTab == onboardingData.count - 1 ? "Get Started" : "Next")
                        .foregroundStyle(.orange)
                        .font(.custom("Nohemi-SemiBold", size: 16))
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                })
                .padding(.top, 6)
            }
        }
    }
}
