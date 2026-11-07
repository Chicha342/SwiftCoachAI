import SwiftUI

struct LineHomeViewConteiner: View {
    let text: String
    let image: String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 100)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundStyle(.white.opacity(0.36))
            
            HStack(){
                Text(text)
                    .foregroundStyle(.white)
                    .font(.custom("Outfit-Bold", size: 20))
                
                Spacer()
                
                Image(systemName: image)
                    .foregroundStyle(.orange)
                    .padding(6)
                    .background(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    LineHomeViewConteiner(text: "Swift News", image: "swift")
}
