import SwiftUI

struct NotesView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Header(typeOfHeader: .notes)
                ScrollView{
                    
                }
            }
        }
    }
}

#Preview {
    NotesView()
        .environmentObject(MainViewModel())
}
