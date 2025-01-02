import SwiftUI

@main
struct SpendItAppApp: App {
    @StateObject var accountPageManager = AccountPageManager()
    @StateObject var transactionManager = TransactionManager()
    @StateObject var expensePageManager = ExpensePageManager()
    @StateObject var financeManager = FinanceManager()
    @StateObject var incomePageManager =  IncomePageManager()
    @StateObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some Scene {
        WindowGroup {
            if accountPageManager.loginStatus == false {
                Screen1(backgroundPageManager: backgroundPageManager)
            } else if accountPageManager.loginStatus == true {
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
            }
        }
    }
}
