import SwiftUI

struct OnboardingTab: View {
    let image: String
    let text: String
    let semiText: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 330)
            
            Text(text)
                .foregroundStyle(.white)
                .font(.custom("Nohemi-Bold", size: 40))
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text(semiText)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.custom("Nohemi-Regilar", size: 16))
                .padding(.top, 6)
                
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        OnboardingTab(image: "OnboardingTab1", text: "Learn Swift Your Way", semiText: "Learn Swift from the basics to advanced concepts with a personalized learning experience.")
    }
}
