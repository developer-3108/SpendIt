import SwiftUI

struct IconLogoPage: View {
    
    @ObservedObject var onboardingManager = OnboardingManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some View {
        ZStack{
            BackgroundManager()
            
            ScrollView(showsIndicators: false) {
            VStack{
                Button{
                    onboardingManager.iconPageState.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                
                VStack(spacing: 40) {
                    Button{
                        onboardingManager.iconPageState.toggle()
                    } label: {
                        Image(systemName: "\(accountPageManager.accountIconName)")
                            .foregroundStyle(
                                accountPageManager.accountIconColor
                            )
                            .font(.system(size: 150))
                            .shadow(color: Color.black.opacity(0.7), radius: 20)
                    }
                    
                    VStack(spacing: 30) {
                        Text("Select Icon Color")
                            .foregroundColor(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            .font(.custom("Poppins-Regular", size: 20))
                        
                        
                        ForEach(colorGrid, id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { color in
                                    Button {
                                        accountPageManager.accountIconColor = color
                                    } label: {
                                        Circle()
                                            .fill(color)
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: 3)
                                                    .opacity(accountPageManager.accountIconColor == color ? 1 : 0)
                                            )
                                    }
                                }
                            }
                        }
                    }
                }
                
                Button {
                    onboardingManager.iconPageState.toggle()
                } label: {
                    Text("Done")
                        .foregroundStyle(Color.black)
                        .font(.custom("Poppins-Regular", size: 20))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                }
                
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
        }
            
        }
    }
    private let colorGrid: [[Color]] = [
        [.black, .blue, .brown, .cyan, .gray, .green],
        [.indigo, .mint, .orange, .pink, .purple, .red],
        [.teal, .white, .yellow]
    ]
}

#Preview {
    IconLogoPage(onboardingManager: OnboardingManager(),
    accountPageManager: AccountPageManager())
}
