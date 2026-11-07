import SwiftUI

struct SettingsView: View {
    @AppStorage("HasCompletedOnboarding") private var hasCompletedOnboarding = true
    @AppStorage("HasCompletedSkills") private var hasCompletedSkills = true
    
    @Binding var isOpenSettings: Bool
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                HStack{
                    Button(action: {
                        withAnimation {
                            isOpenSettings = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(.headline, weight: .semibold))
                            .foregroundStyle(.orange)
                            .padding(6)
                            .background(.white)
                            .cornerRadius(100)
                    })
                    
                    Spacer()
                }
                
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
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(40)
        .padding()
        .padding(.bottom, 67)
    }
}

#Preview {
    SettingsView(isOpenSettings: .constant(true))
}
