import SwiftUI

struct Header: View {
    var typeOfHeader: headerType = .home
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack{
            switch typeOfHeader {
            case .home:
                VStack{
                    HStack{
                        Image(systemName: "swift")
                            .foregroundStyle(.orange)
                            .font(.system(size: 24))
                            .padding(12)
                            .background(.white)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading){
                            Text("Good evening")
                                .foregroundStyle(.white)
                                .font(.custom("Outfit-Semibold", size: 18))
                            
                            Text(viewModel.userName)
                                .foregroundStyle(.white)
                                .font(.custom("Outfit-Bold", size: 21))
                        }
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "flame")
                                .foregroundStyle(.orange)
                            
                            Text("\(viewModel.daysOfStreak) d.")
                                .foregroundStyle(.white)
                                .font(.custom("Outfit-Bold", size: 18))
                                .lineLimit(1)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black.opacity(0.24))
                        .cornerRadius(20)
                        .padding(.leading)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "gear")
                                .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .padding(12)
                                .background(.black.opacity(0.24))
                                .clipShape(.circle)
                        })
                        
                    }
                    .padding(.horizontal)
                    
                    
                }
            case .chat:
                VStack{
                    Text("Chat")
                }
            case .notes:
                VStack{
                    Text("Notes")
                }
            }
        }
    }
}

#Preview {
    ZStack{
        BackgroundView()
        
        VStack{
            Header()
                .environmentObject(MainViewModel())
            
            Spacer()
        }
    }
}
