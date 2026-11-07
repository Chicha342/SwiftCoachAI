import SwiftUI

struct TipContainerView: View {
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: "lightbulb.max")
                .font(.system(size: 18, weight: .black))
                .foregroundStyle(.orange)
                .padding(5)
                .background(.white.opacity(0.22))
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text("Tip of the day".uppercased())
                    .monospaced()

                    .foregroundStyle(.orange)
                    .font(.custom("Outfit-Bold", size: 18))
                    
                
                Text("guard let exits early when it is nil")
                    .foregroundStyle(.white)
                    .font(.custom("Outfit-Regular", size: 16))
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.black.opacity(0.28))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    TipContainerView()
}
