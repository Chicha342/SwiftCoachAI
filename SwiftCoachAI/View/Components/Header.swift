import SwiftUI

struct Header: View {
    var body: some View {
        HStack{
            Image(systemName: "gear")
            
            Spacer()
        }
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        Header()
    }
}
