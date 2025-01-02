import SwiftUI

struct ExpensePage: View {
    
    @State private var isExpenseSelected: Bool = true
    @State private var isIncomeSelected: Bool = false
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
                BackgroundManager(backgroundPageManager: backgroundPageManager)
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        VStack {
                            HStack(spacing: 20){
                                Button {
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
                                        
                                    } else if isExpenseSelected == false{
                                        Text("Expense")
                                            .font(.custom("Poppins-Regular", size: 20))
                                            .foregroundStyle(Color.white)
                                            .padding()
                                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                            .cornerRadius(50)
                                    }
                                    
                                }
                                
                                
                                Button {
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
                                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                                            .cornerRadius(50)
                                        
                                    }
                                }
                            }
                        }
                        
                        if isExpenseSelected == true && isIncomeSelected == false {
                            ExpensePageForm(
                                expensePageManager: expensePageManager,
                                financeManager: financeManager,
                                backgroundPageManager: backgroundPageManager
                            )
                        } else {
                            IncomePageForm(financeManager: financeManager,
                                           incomePageManager: incomePageManager,
                                           backgroundPageManager: backgroundPageManager
                            )
                        }
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding()
                }
                
                if isExpenseSelected == true && isIncomeSelected == false{
                    saveExpenseButton(incomePageManager: incomePageManager,
                                      expensePageManager: expensePageManager,
                                      transactionManager: transactionManager)
                } else if isExpenseSelected == false && isIncomeSelected == true{
                    saveIncomeButton(incomePageManager: incomePageManager,
                                     expensePageManager: expensePageManager,
                                     transactionManager: transactionManager)
                }
            }
        }
    }
}

struct ExpensePageForm: View {
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            
            DatePicker(
                "Date",
                selection: $expensePageManager.selectedDate,
                displayedComponents: .date
            )
                .font(.custom("Poppins-Regular", size: 20))
                .foregroundStyle(
                    backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                )
                .padding()
                .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text("Title")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                TextField("Enter Title", text: $expensePageManager.expenseTitle)
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text("Amount")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                HStack {
                    Text("\((financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency)))")
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    
                    TextField(
                        "Enter Amount",
                        text: $expensePageManager.expenseAmount
                    )
                }
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .keyboardType(.decimalPad)
            }
            
            VStack(alignment: .leading){
                Text("Categories")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                
                Button {
                    expensePageManager.ExpensePageCategory.toggle()
                } label: {
                    HStack{
                        Image(systemName: "\(expensePageManager.selectedExpenseCategoryLogo)")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.yellow)
                        
                        Text("\(expensePageManager.selectedExpenseCategory)")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                    .cornerRadius(10)
                }
                
            }.sheet(
                isPresented: $expensePageManager.ExpensePageCategory) {
                    ExpensePageCategory(
                        expensePageManager: expensePageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct IncomePageForm: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            DatePicker(
                "Date",
                selection: $incomePageManager.selectedDate,
                displayedComponents: .date
            )
            .font(.custom("Poppins-Regular", size: 20))
            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
            .padding()
            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
            .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text("Title")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                TextField("Enter Title", text: $incomePageManager.incomeTitle)
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text("Amount")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                HStack {
                    Text("\((financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency)))")
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    
                    TextField(
                        "Enter Amount",
                        text: $incomePageManager.incomeAmount
                    )
                }
                .font(.custom("Poppins-Regular", size: 20))
                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                .padding()
                .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.decimalPad)
            }
            
            VStack(alignment: .leading){
                Text("Categories")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                
                Button {
                    incomePageManager.IncomePageCategory.toggle()
                } label: {
                    HStack{
                        Image(systemName: "\(incomePageManager.selectedIncomeCategoryLogo)")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.yellow)
                        
                        Text("\(incomePageManager.selectedIncomeCategory)")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                    .cornerRadius(10)
                }
                
            }.sheet(
                isPresented: $incomePageManager.IncomePageCategory) {
                    IncomePageCategory(
                        incomePageManager: incomePageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct saveExpenseButton: View {
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var transactionManager: TransactionManager
    @State var showAlert: Bool = false
    var body: some View {
        Button {
            
            if !expensePageManager.expenseAmount.isEmpty {
                let newExpense = ExpenseDetails(
                    expenseDate: expensePageManager.selectedDate,
                    expenseTitle: expensePageManager.expenseTitle,
                    expenseAmount: expensePageManager.expenseAmount,
                    expenseCategory: expensePageManager.selectedExpenseCategory,
                    expenseLogo: expensePageManager.selectedExpenseCategoryLogo
                )
                let allTransactions = TransactionDetails(
                    expenseDate: expensePageManager.selectedDate,
                    transactionType: "Expense",
                    expenseTitle: expensePageManager.expenseTitle,
                    expenseAmount: expensePageManager.expenseAmount,
                    expenseCategory: expensePageManager.selectedExpenseCategory,
                    expenseLogo: expensePageManager.selectedExpenseCategoryLogo
                )
                
                expensePageManager.expenseDetailsArray.append(newExpense)
                transactionManager.transactionDetailsArray.append(allTransactions)
                
                expensePageManager.selectedDate = Date()
                expensePageManager.expenseTitle = ""
                expensePageManager.expenseAmount = ""
                expensePageManager.selectedExpenseCategory = "Other"
                expensePageManager.selectedExpenseCategoryLogo = "ellipsis.circle.fill"
                
                showAlert = false
                
            } else {
                showAlert = true
            }
            
            
        } label: {
            Image(systemName: "square.and.arrow.down.fill")
                .foregroundStyle(Color.black)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .padding()
                .shadow(radius: 20)
        }
        .alert("Please enter the ammount.", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

struct saveIncomeButton: View {
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var transactionManager: TransactionManager
    @State var showAlert: Bool = false
    
    var body: some View {
        Button {
            
            if !incomePageManager.incomeAmount.isEmpty {
                let newIncome = IncomeDetails(
                    incomeDate: incomePageManager.selectedDate,
                    incomeTitle: incomePageManager.incomeTitle,
                    incomeAmount: incomePageManager.incomeAmount,
                    incomeCategory: incomePageManager.selectedIncomeCategory,
                    incomeLogo: incomePageManager.selectedIncomeCategoryLogo
                )
                
                let allTransactions = TransactionDetails(
                    expenseDate: incomePageManager.selectedDate,
                    transactionType: "Income",
                    expenseTitle: incomePageManager.incomeTitle,
                    expenseAmount: incomePageManager.incomeAmount,
                    expenseCategory: incomePageManager.selectedIncomeCategory,
                    expenseLogo: incomePageManager.selectedIncomeCategoryLogo
                )
                
                incomePageManager.incomeDetailsArray.append(newIncome)
                transactionManager.transactionDetailsArray.append(allTransactions)
                
                incomePageManager.selectedDate = Date()
                incomePageManager.incomeTitle = ""
                incomePageManager.incomeAmount = ""
                incomePageManager.selectedIncomeCategory = "Other"
                incomePageManager.selectedIncomeCategoryLogo = "ellipsis.circle.fill"
                
                showAlert = false
                
            } else {
                showAlert = true
            }
            
            
        } label: {
            Image(systemName: "square.and.arrow.down.fill")
                .foregroundStyle(Color.black)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .padding()
                .shadow(radius: 20)
        }
        .alert("Please enter the ammount.", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ExpensePage(
        expensePageManager: ExpensePageManager(),
        incomePageManager: IncomePageManager(),
        transactionManager: TransactionManager()
    )
}
