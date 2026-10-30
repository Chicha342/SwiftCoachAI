import SwiftUI

struct SkillsPickerView: View {
    @Binding var isCompleted: Bool
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                
                Spacer()
                
                Text("Write you name:")
                    .foregroundStyle(.white)
                    .font(.custom("Nohemi-Medium", size: 23))
                
                ZStack{
                    TextField("", text: $viewModel.userName)
                        .foregroundStyle(.orange)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    
                    if viewModel.userName.isEmpty {
                        HStack{
                            Text("Name...")
                                .foregroundStyle(.orange)
                                .font(.custom("Nohemi-Regular", size: 18))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                
                
                Text("Select you skill level:")
                    .foregroundStyle(.white)
                    .font(.custom("Nohemi-Medium", size: 23))
                    .padding(.top)
                
                ForEach(UserLevel.allCases, id: \.self) { level in
                    Button(action: {
                        withAnimation {
                            viewModel.currentUserLevel = level
                        }
                    }, label: {
                        Text(level.title)
                            .font(.custom("Nohemi-Medium", size: 18))
                            .foregroundStyle(viewModel.currentUserLevel == level ? .white : .orange)
                            .padding()
                            .frame(width: 200)
                            .background(viewModel.currentUserLevel == level ? .orange : .white)
                            .cornerRadius(10)
                    })
                }
                .padding(.top)
                
                Spacer()
                
                Button(action: {
                    isCompleted = true
                }, label: {
                    Text("Go learn")
                        .font(.custom("Nohemi-Medium", size: 18))
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
            }
        }
    }
}

#Preview {
    SkillsPickerView(isCompleted: .constant(false), viewModel: MainViewModel())
}
