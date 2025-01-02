import SwiftUI

struct Screen1: View {
    @State var onboardingState = OnboardingManager()
    @State var isAnimation: Bool = false
    @State var scaleEffectAnimation = false
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundManager()
                    .blur(radius: 20, opaque: true)
                
                VStack(spacing: 80) {
                    ZStack {
                        Image("HEIF Image")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                            .scaleEffect(scaleEffectAnimation ? 1.5 : 1.3)
                            .animation(.easeInOut(duration: 2),
                                       value: scaleEffectAnimation
                            )
                            .onAppear {
                                scaleEffectAnimation = true
                            }
                            .blur(radius: 30)
                        Image("HEIF Image")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                            .scaleEffect(scaleEffectAnimation ? 1.1 : 0.9)
                            .animation(.easeInOut(duration: 1),
                                       value: scaleEffectAnimation
                            )
                            .onAppear {
                                scaleEffectAnimation = true
                            }
                            .shadow(color: Color.black, radius: 5)
                    }
                    
                    VStack(spacing: 10){
                        Text("SpendIt.")
                            .font(.custom("Poppins-Medium", size: 60))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        Text("Know where your money goes")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }
                    .foregroundStyle(Color.white)
                    
                    NavigationLink(
                        destination: Screen2(
                            onboardingManager: onboardingState,
                            backgroundPageManager: backgroundPageManager,
                            accountPageManager: accountPageManager,
                            financeManager: financeManager,
                            expensePageManager: expensePageManager,
                            incomePageManager: incomePageManager,
                            transactionManager: transactionManager
                        )
                    ) {
                        HStack {
                            Text("Let's Setup")
                                .font(.largeTitle)
                            
                            Image(systemName: "arrow.right")
                                .font(.largeTitle)
                                
                        }
                    }
                    .foregroundStyle(Color.black)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(15)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Screen1()
}
