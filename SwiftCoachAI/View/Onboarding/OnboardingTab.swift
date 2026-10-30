import SwiftUI

struct OnboardingTab: View {
    let image: String
    let text: String
    let semiText: String
    
    var body: some View {
        VStack{
            Image(systemName: image)
                .foregroundStyle(.orange)
                .font(.system(size: 100))
                .padding()
                .frame(width: 140, height: 140)
                .background(.white)
                .cornerRadius(20)
            
            Text(text)
                .foregroundStyle(.white)
                .font(.custom("Nohemi-Bold", size: 20))
                .padding(.top)
            
            Text(semiText)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.custom("Nohemi-Regilar", size: 14))
                .padding(.top, 6)
                
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        OnboardingTab(image: "swift", text: "Learn Swift Your Way", semiText: "Learn Swift from the basics to advanced concepts with a personalized learning experience.")
    }
}
