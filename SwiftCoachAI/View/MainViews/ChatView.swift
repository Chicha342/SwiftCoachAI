import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Header(typeOfHeader: .chat)
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
