import SwiftUI

struct SkillsPickerView: View {
    @Binding var isCompleted: Bool
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                HStack{
                    Image(systemName: "swift")
                        .foregroundStyle(.orange)
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading){
                        Text("SwiftCoachAI")
                            .foregroundStyle(.white)
                            .font(.custom("Nohemi-Bold", size: 17))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack{
                    HStack{
                        Text("Let's get to\nKnow you")
                            .font(.custom("Nohemi-Bold", size: 38))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    HStack{
                        Text("Tell us your name and level, and your AI coach will tailor every lesson to you.")
                            .font(.custom("Nohemi-Medium", size: 16))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.top, 2)
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                
                
                HStack(){
                    Text("YOUR NAME:")
                        .foregroundStyle(.white)
                        .font(.custom("Outfit-Bold", size: 18))
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
                
                ZStack{
                    TextField("", text: $viewModel.userName)
                        .foregroundStyle(.black)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white.opacity(0.6), lineWidth: 10)
                        }
                    
                    
                    if viewModel.userName.isEmpty {
                        HStack(alignment: .center){
                            Image("personIcon")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .padding(.leading, 6)
                            
                            Text("Name...")
                                .foregroundStyle(.black)
                                .font(.custom("Outfit-Medium", size: 18))
                            
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                
                HStack{
                    Text("Your skill level:")
                        .foregroundStyle(.white)
                        .font(.custom("Outfit-Bold", size: 18))
                        .padding(.top)
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ForEach(UserLevel.allCases, id: \.self) { level in
                    Button(action: {
                        withAnimation {
                            viewModel.currentUserLevel = level
                        }
                    }, label: {
                        HStack{
                            Image(level.icon)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(viewModel.currentUserLevel == level ? .brown : .white)
                            
                            
                            VStack(alignment: .leading){
                                Text(level.title)
                                    .font(.custom("Nohemi-Medium", size: 18))
                                    .foregroundStyle(viewModel.currentUserLevel == level ? .brown : .white)
                                
                                
                                Text(level.subtitle)
                                    .font(.custom("Nohemi-Medium", size: 14))
                                    .foregroundStyle(viewModel.currentUserLevel == level ? .brown : .white)
                            }
                            
                            Spacer()
                            
                            ZStack{
                                Circle()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.clear)
                                    .overlay {
                                        Circle()
                                            .stroke(Color.gray)
                                    }
                                
                                if viewModel.currentUserLevel == level{
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 13, weight: .bold))
                                        .padding()
                                        .frame(width: 25, height: 25)
                                        .background(Color.orange)
                                        .cornerRadius(100)
                                    
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.currentUserLevel == level ? .white : .black.opacity(0.28))
                        .cornerRadius(20)
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white.opacity(0.17), lineWidth: 2)
                        }
                        .padding(.horizontal)
                    })
                }
                .padding(.top)
                
                Spacer()
                
                Button(action: {
                    isCompleted = true
                }, label: {
                    HStack{
                        Text("Go learn")
                            .font(.custom("Nohemi-Medium", size: 18))
                            .foregroundStyle(.orange)
                        
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.orange)
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                })
                
            }
        }
    }
}

#Preview {
    SkillsPickerView(isCompleted: .constant(false), viewModel: MainViewModel())
}
