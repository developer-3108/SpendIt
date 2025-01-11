import SwiftUI

struct RecentTransactionsPage: View {
    @ObservedObject var transactionManager = TransactionManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var incomePageManager =  IncomePageManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack{
            BackgroundManager(backgroundPageManager: backgroundPageManager)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Transactions")
                        .padding(.leading)
                        .font(.custom("Poppins-SemiBold", size: 40))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                    
                    RecentTransactions(
                        transactionManager: transactionManager,
                        expensePageManager: expensePageManager,
                        financeManager: financeManager,
                        accountPageManager: accountPageManager,
                        incomePageManager: incomePageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    
                }
            }
        }
    }
}

struct RecentTransactions: View {
    @State private var isAllSelected: Bool = true
    @State private var isExpenseSelected: Bool = false
    @State private var isIncomeSelected: Bool = false
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20){
            VStack{
                HStack(spacing: 20) {
                    
                    Button {
                        isAllSelected = true
                        isExpenseSelected = false
                        isIncomeSelected = false
                    } label: {
                        if isAllSelected == true {
                            Text("All")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                            
                        } else if isAllSelected == false {
                            Text("All")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(50)
                        }
                    }
                    
                    
                    Button {
                        isAllSelected = false
                        isExpenseSelected = true
                        isIncomeSelected = false
                    } label: {
                        if isExpenseSelected == true {
                            Text("Expense")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                            
                        } else if isExpenseSelected == false {
                            Text("Expense")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(50)
                        }
                    }
                    
                    Button {
                        isAllSelected = false
                        isIncomeSelected = true
                        isExpenseSelected = false
                    } label: {
                        if isIncomeSelected == true {
                            Text("Income")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(50)
                            
                        } else if isIncomeSelected == false{
                            Text("Income")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(50)
                            
                        }
                    }
                    
                }
            }
                if isExpenseSelected == true && isIncomeSelected == false && isAllSelected == false{
                    RecentExpenseTransaction(
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        accountPageManager: accountPageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                } else if isExpenseSelected == false && isIncomeSelected == true && isAllSelected == false{
                    RecentIncomeTransaction(
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        accountPageManager: accountPageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                } else if isAllSelected == true && isExpenseSelected == false && isIncomeSelected == false{
                    RecentAllTransaction(
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        accountPageManager: accountPageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                }
            }.frame(maxHeight: .infinity, alignment: .top)
                .padding()
        }
    }
}

struct RecentAllTransaction: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        
        if !transactionManager.transactionDetailsArray.isEmpty {
            VStack(alignment: .leading) {
                ForEach(
                    transactionManager.transactionDetailsArray
                        .sorted(by: { $0.expenseDate < $1.expenseDate }).reversed(),
                    id: \.expenseDate
                ) { transaction in
                    VStack{
                        HStack{
                            Image(systemName: "\(transaction.expenseLogo)")
                                .frame(width: 50, height: 50)
                                .font(.largeTitle)
                                .padding(10)
                                .cornerRadius(60)
                                .foregroundStyle(
                                    backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.yellow
                                )
                            
                            VStack(alignment: .leading){
                                if transaction.transactionType == "Expense" {
                                    Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(Int(transaction.expenseAmount) ?? 0)")
                                        .font(.custom("Poppins-SemiBold", size: 25))
                                        .foregroundStyle(Color.red)
                                } else if transaction.transactionType == "Income" {
                                    Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(Int(transaction.expenseAmount) ?? 0)")
                                        .font(.custom("Poppins-SemiBold", size: 25))
                                        .foregroundStyle(Color.green)
                                }
                                
                                if !transaction.expenseTitle.isEmpty{
                                    Text("\(transaction.expenseTitle)")
                                        .font(.custom("Poppins-Regular", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                } else {
                                    Text("Untitled Expense")
                                        .font(.custom("Poppins-LightItalic", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                }
                                
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("\(transaction.expenseDate.formattedDate())")
                                    .font(.custom("Poppins-Regular", size: 10))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                Spacer()
                                Image(systemName: "\(accountPageManager.accountIconName)")
                                    .font(.title)
                                    .foregroundStyle(
                                        accountPageManager.accountIconColor
                                    )
                            }
                        }
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                    .cornerRadius(20)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        } else {
            Text("No recent transactions")
        }
    }
}

struct RecentExpenseTransaction: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        
        if !expensePageManager.expenseDetailsArray.isEmpty {
            VStack(alignment: .leading) {
                
                ForEach(
                    expensePageManager.expenseDetailsArray
                        .sorted(by: { $0.expenseDate < $1.expenseDate }).reversed(),
                    id: \.expenseDate
                ) { transaction in
                    VStack{
                        HStack{
                            Image(systemName: "\(transaction.expenseLogo)")
                                .frame(width: 50, height: 50)
                                .font(.largeTitle)
                                .padding(10)
                                .cornerRadius(60)
                                .foregroundStyle(
                                    backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.yellow
                                )
                            
                            VStack(alignment: .leading){
                                Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(Int(transaction.expenseAmount) ?? 0)")
                                    .font(.custom("Poppins-SemiBold", size: 25))
                                    .foregroundStyle(Color.red)
                                
                                if !transaction.expenseTitle.isEmpty{
                                    Text("\(transaction.expenseTitle)")
                                        .font(.custom("Poppins-Regular", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                } else {
                                    Text("Untitled Expense")
                                        .font(.custom("Poppins-LightItalic", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                }
                                
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("\(transaction.expenseDate.formattedDate())")
                                    .font(.custom("Poppins-Regular", size: 10))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                Spacer()
                                Image(systemName: "\(accountPageManager.accountIconName)")
                                    .font(.title)
                                    .foregroundStyle(
                                        accountPageManager.accountIconColor
                                    )
                            }
                        }
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                    .cornerRadius(20)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        } else {
            Text("No recent transactions")
        }
    }
}

struct RecentIncomeTransaction: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        
        
        if !incomePageManager.incomeDetailsArray.isEmpty {
            VStack(alignment: .leading) {
                ForEach(
                    incomePageManager.incomeDetailsArray
                        .sorted(by: { $0.incomeDate < $1.incomeDate }).reversed(),
                    id: \.incomeDate
                ) { transaction in
                    VStack{
                        HStack{
                            Image(systemName: "\(transaction.incomeLogo)")
                                .frame(width: 50, height: 50)
                                .font(.largeTitle)
                                .padding(10)
                                .cornerRadius(60)
                                .foregroundStyle(
                                    backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.yellow
                                )
                            
                            VStack(alignment: .leading){
                                Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(Int(transaction.incomeAmount) ?? 0)")
                                    .font(.custom("Poppins-SemiBold", size: 25))
                                    .foregroundStyle(Color.green)
                                
                                if !transaction.incomeTitle.isEmpty{
                                    Text("\(transaction.incomeTitle)")
                                        .font(.custom("Poppins-Regular", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                } else {
                                    Text("Untitled Expense")
                                        .font(.custom("Poppins-LightItalic", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("\(transaction.incomeDate.formattedDate())")
                                    .font(.custom("Poppins-Regular", size: 10))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                Spacer()
                                Image(systemName: "\(accountPageManager.accountIconName)")
                                    .font(.title)
                                    .foregroundStyle(
                                        accountPageManager.accountIconColor
                                    )
                            }
                        }
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                    .cornerRadius(20)
                }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
        } else {
            Text("No recent transactions")
        }
    }
}

#Preview {
    RecentTransactionsPage()
}
