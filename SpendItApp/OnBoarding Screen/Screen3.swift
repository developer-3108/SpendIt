import SwiftUI

struct Screen3: View {
    @ObservedObject var financeManager = FinanceManager()
    @StateObject var onboardingManager = OnboardingManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    @State private var showErrorAlert = false
    @State private var userFirstName: String = ""
    @State private var userLastName: String  = ""
    @State private var userAge: String = ""
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                BackgroundManager()
                    .blur(radius: 20, opaque: true)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        Text("Quick Details")
                            .frame(maxHeight: .infinity, alignment: .top)
                            .font(.custom("Poppins-Regular", size: 45))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        VStack(alignment: .leading, spacing: 15){
                            
                            Text("Name")
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            HStack{
                                TextField(
                                    "First Name",
                                    text: $accountPageManager.userFirstName
                                )
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                .font(.custom("Poppins-Regular", size: 20))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                                .cornerRadius(10)
                                
                                TextField(
                                    "Last Name",
                                    text: $accountPageManager.userLastName
                                )
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                .font(.custom("Poppins-Regular", size: 20))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                                .cornerRadius(10)
                            }
                            
                            Text("Age")
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            TextField(
                                "Enter Age",
                                text: $accountPageManager.userAge
                            )
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                            .cornerRadius(10)
                            
                            Text("What is your Primary Goal?")
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            VStack(spacing: 10){
                                HStack(spacing: 10) {
                                    Button {
                                        if accountPageManager.budgetingButton == false {
                                            accountPageManager.budgetingButton = true
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                            accountPageManager.userGoal = "Budgeting"
                                        } else{
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                        }
                                    } label: {
                                        VStack {
                                            Image("1")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                            Text("Budgeting")
                                                .font(.custom("Poppins-Regular", size: 16))
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120, height: 140)
                                        .padding()
                                        .background(Color.white.opacity(0.9))
                                        .cornerRadius(20)
                                    }
                                    .shadow(
                                        color: Color.black.opacity(0.8),
                                        radius: accountPageManager.budgetingButton
                                        == true ? 10 : 0
                                    )
                                    .scaleEffect(
                                        accountPageManager.budgetingButton
                                        == true ? 1.1 : 0.9)
                                    .animation(
                                        .easeInOut(duration: 0.3),
                                        value: accountPageManager
                                            .budgetingButton)
                                    
                                    Button {
                                        if accountPageManager.saveMoneyButton  == false {
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = true
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                            accountPageManager.userGoal = "Save Money"
                                        } else{
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                        }
                                    } label: {
                                        VStack {
                                            Image("2")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                            Text("Save money")
                                                .font(.custom("Poppins-Regular", size: 16))
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120, height: 140)
                                        .padding()
                                        .background(Color.white.opacity(0.9))
                                        .cornerRadius(20)
                                    }
                                    .shadow(
                                        color: Color.black.opacity(0.8),
                                        radius: accountPageManager.saveMoneyButton
                                        == true ? 10 : 0
                                    )
                                    .scaleEffect(
                                        accountPageManager.saveMoneyButton
                                        == true ? 1.1 : 0.9)
                                    .animation(
                                        .easeInOut(duration: 0.3),
                                        value: accountPageManager
                                            .saveMoneyButton)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                HStack(spacing: 10) {
                                    Button {
                                        if accountPageManager.trackFinancesButton  == false {
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = true
                                            accountPageManager.manageExpensesButton = false
                                            accountPageManager.userGoal = "Track Finances"
                                        } else{
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                        }
                                    } label: {
                                        VStack {
                                            Image("3")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                            Text("Track finances")
                                                .font(.custom("Poppins-Regular", size: 16))
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120, height: 140)
                                        .padding()
                                        .background(Color.white.opacity(0.9))
                                        .cornerRadius(20)
                                    }
                                    .shadow(
                                        color: Color.black.opacity(0.8),
                                        radius: accountPageManager.trackFinancesButton
                                        == true ? 10 : 0
                                    )
                                    .scaleEffect(
                                        accountPageManager.trackFinancesButton
                                        == true ? 1.1 : 0.9)
                                    .animation(
                                        .easeInOut(duration: 0.3),
                                        value: accountPageManager
                                            .trackFinancesButton)
                                    
                                    Button {
                                        if accountPageManager.manageExpensesButton  == false {
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = true
                                            accountPageManager.userGoal = "Manage Expenses"
                                        } else{
                                            accountPageManager.budgetingButton = false
                                            accountPageManager.saveMoneyButton = false
                                            accountPageManager.trackFinancesButton = false
                                            accountPageManager.manageExpensesButton = false
                                        }
                                    } label: {
                                        VStack {
                                            Image("6")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                            Text("Manage expenses")
                                                .font(.custom("Poppins-Regular", size: 16))
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120, height: 140)
                                        .padding()
                                        .background(Color.white.opacity(0.9))
                                        .cornerRadius(20)
                                    }
                                    .shadow(
                                        color: Color.black.opacity(0.8),
                                        radius: accountPageManager.manageExpensesButton
                                        == true ? 10 : 0
                                    )
                                    .scaleEffect(
                                        accountPageManager.manageExpensesButton
                                        == true ? 1.1 : 0.9)
                                    .animation(
                                        .easeInOut(duration: 0.3),
                                        value: accountPageManager
                                            .manageExpensesButton)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    
                            if !accountPageManager.userFirstName.isEmpty && !accountPageManager.userLastName.isEmpty && !accountPageManager.userAge.isEmpty && !accountPageManager.userGoal.isEmpty{
                                
                                NavigationLink(
                                    destination: LoadingScreen(
                                        accountPageManager: accountPageManager,
                                        financeManager: financeManager,
                                        backgroundPageManager: backgroundPageManager,
                                        transactionManager: transactionManager,
                                        expensePageManager: expensePageManager,
                                        incomePageManager: incomePageManager
                                    )
                                ) {
                                    HStack {
                                        Image(systemName: "checkmark")
                                            .font(.largeTitle)
                                    }
                                }
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                
                            } else {
                                Button {
                                    showErrorAlert = true
                                } label: {
                                    HStack {
                                        Image(systemName: "checkmark")
                                            .font(.largeTitle)
                                    }
                                }
                                .alert(
                                    "Please complete all the required fields.",
                                    isPresented: $showErrorAlert
                                ) {
                                    Button("OK", role: .cancel) { }
                                }
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                
                                
                            }
                        }
                        .font(.custom("Poppins-Regular", size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .foregroundStyle(Color.white)
                    .padding()
                }
            
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Screen3()
}
