import SwiftUI

struct LoadingScreen: View {
    @ObservedObject var accountPageManager = AccountPageManager()
    @State private var animationState = false
    @State private var shouldNavigate = false
    @State private var percentage = 0
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var transactionManager = TransactionManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager =  IncomePageManager()
    
    var body: some View {
        NavigationStack {
            if shouldNavigate {
                TabView {
                    HomePage(
                        accountPageManager: accountPageManager,
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(backgroundPageManager.isDarkMode == false ? Color.white : Color.black, for: .tabBar)
                    
                    AnalyticsPage(
                        accountPageManager: accountPageManager,
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    .tabItem {
                        Label("Analytics", systemImage: "chart.pie.fill")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(backgroundPageManager.isDarkMode == false ? Color.white : Color.black, for: .tabBar)
                    
                    
                    RecentTransactionsPage(
                        transactionManager: transactionManager,
                        expensePageManager: expensePageManager,
                        financeManager: financeManager,
                        accountPageManager: accountPageManager,
                        incomePageManager: incomePageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    .tabItem {
                        Label("Transactions", systemImage: "list.bullet.rectangle.portrait.fill")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(backgroundPageManager.isDarkMode == false ? Color.white : Color.black, for: .tabBar)
                    
                    
                    SettingsPage(
                        accountPageManager: accountPageManager,
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(backgroundPageManager.isDarkMode == false ? Color.white : Color.black, for: .tabBar)
                    
                }
                .accentColor(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.9) : Color.yellow)
                
            } else {
                ZStack {
                    BackgroundManager()
                        .blur(radius: 20, opaque: true)
                    
                    VStack{
                        Text("Setting up things for you...")
                            .frame(maxHeight: .infinity, alignment: .top)
                            .font(.custom("Poppins-Regular", size: 45))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    Circle()
                        .strokeBorder(Color.white.opacity(0.8), lineWidth: 8)
                        .frame(width: 200, height: 200)
                        .scaleEffect(animationState ? 1.5 : 1)
                        .opacity(animationState ? 0.3 : 1)
                        .onAppear {
                            withAnimation(
                                Animation.easeInOut(duration: 0.8)
                                    .repeatForever(autoreverses: true)
                            ) {
                                animationState.toggle()
                            }
                            
                            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                                    if percentage < 100 {
                                        percentage += 1
                                    } else {
                                            timer.invalidate()
                                        shouldNavigate = true
                                        accountPageManager.loginStatus = true
                                }
                            }
                        }
                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 150, height: 150)
                        
                        Text("\(percentage)%")
                            .font(.custom("Poppins-Regular", size: 40))
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoadingScreen(accountPageManager: AccountPageManager())
}
