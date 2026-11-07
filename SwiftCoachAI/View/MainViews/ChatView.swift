import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Header(typeOfHeader: .chat, action: { })
                ScrollView{
                    
                }
            }
        }
    }
}

#Preview {
    ChatView()
        .environmentObject(MainViewModel())
}
