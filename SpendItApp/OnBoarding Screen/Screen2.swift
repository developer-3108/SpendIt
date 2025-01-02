import SwiftUI

struct Screen2: View {
    @StateObject var onboardingManager = OnboardingManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundManager()
                    .blur(radius: 20, opaque: true)
                
                VStack(alignment: .leading){
                    Text("Quick Setup")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .font(.custom("Poppins-Regular", size: 45))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Let's setup your Dashboard")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        Text("Main Currency")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        HStack {
                            Text(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))
                            .font(.custom("Poppins-Regular", size: 25))
                            .foregroundStyle(Color.black)
                            .padding(.trailing, 5)
                            
                            Spacer()
                            
                            
                            Picker("Select Currency", selection: $financeManager.selectedCurrency) {
                                ForEach(financeManager.allCurrencies, id: \.self) { currency in
                                    Text(currency)
                                        .font(.custom("Poppins-Regular", size: 35))
                                        .tag(currency)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Total Money")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            if !accountPageManager.accountName.isEmpty || !accountPageManager.accountBalance.isEmpty || !accountPageManager.accountIconName.isEmpty{
                                
                                Button{
                                    onboardingManager.accountPageState.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "\(accountPageManager.accountIconName)")
                                            .foregroundStyle(
                                                accountPageManager.accountIconColor
                                            )
                                            .font(.title)
                                        Text("\(accountPageManager.accountName)")
                                            .font(.custom("Poppins-Regular", size: 18))
                                        Spacer()
                                        
                                        Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency)) \(Int(accountPageManager.accountBalance) ?? 0)")
                                            .font(.custom("Poppins-Regular", size: 18))
                                    }
                                    .foregroundStyle(Color.black)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                }
                                .sheet(isPresented: $onboardingManager.accountPageState, content: {
                                    AccountPage(onboardingManager: onboardingManager, accountPageManager: accountPageManager,
                                        backgroundPageManager: backgroundPageManager
                                    )
                                })
                            }
                            
                            Button{
                                onboardingManager.accountPageState.toggle()
                            } label:{
                                Text("Edit Account")
                                    .foregroundStyle(Color.black)
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                financeManager.selectedCurrency = financeManager
                                    .selectedCurrencySymbol(
                                        selectedSymbol: financeManager
                                            .selectedCurrency)
                                print("Selected Currency: \(financeManager.selectedCurrency)")
                            } label: {
                                NavigationLink(
                                    destination: Screen3(
                                        financeManager: financeManager,
                                        onboardingManager: onboardingManager,
                                        backgroundPageManager: backgroundPageManager,
                                        accountPageManager: accountPageManager,
                                        expensePageManager: expensePageManager,
                                        incomePageManager: incomePageManager,
                                        transactionManager: transactionManager
                                    )
                                ) {
                                    HStack {
                                        Image(systemName: "arrow.right")
                                            .font(.largeTitle)
                                    }
                                }
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        .sheet(
isPresented: $onboardingManager.accountPageState,
content: {
    AccountPage(
        onboardingManager: onboardingManager,
        accountPageManager: accountPageManager,
        backgroundPageManager: backgroundPageManager
    )
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .foregroundStyle(Color.white)
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    Screen2()
}
