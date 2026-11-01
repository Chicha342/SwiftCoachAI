import SwiftUI

struct OnboardingView: View {
    @Binding var isShowOnboarding: Bool
    
    @State private var currentTab: Int = 0
    
    let onboardingData: [OnboardingTab] = [
        OnboardingTab(image: "OnboardingTab1", text: "Learn Swift Your Way", semiText: "Learn Swift from the basics to advanced concepts with a personalized learning experience."),
        OnboardingTab(image: "OnboardingTab2", text: "Your AI Coding Mentor", semiText: "Ask questions, explore complex topics, and get instant explanations from your personal AI mentor."),
        OnboardingTab(image: "OnboardingTab3", text: "Build Real Skills", semiText: "Solve coding challenges, write real code, and turn your knowledge into practical iOS development skills.")
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack{
                    Image(systemName: "swift")
                        .foregroundStyle(.orange)
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading){
                        Text("SwiftCoachAI")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Bold", size: 17))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            isShowOnboarding = true
                        }
                    }, label: {
                        Text("Skip")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Bold", size: 17))
                            .padding()
                            .background(Color.black.opacity(0.24))
                            .cornerRadius(20)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white.opacity(0.24))
                            }
                    })
                }
                .padding(.horizontal)
                
                Spacer()
                
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
                        RoundedRectangle(cornerRadius: 100)
                            .fill(index == currentTab ? Color.white : Color.white.opacity(0.4))
                            .frame(width:index == currentTab ? 16 : 8, height: 8)
                    }
                }
                .padding(.top)
                
                Spacer()
                
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
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                })
                .padding(.top, 6)
            }
        }
    }
}

#Preview {
    OnboardingView(isShowOnboarding: .constant(true))
}
