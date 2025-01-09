import SwiftUI
import Charts

struct HomePage: View {
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
                
                BackgroundManager(backgroundPageManager: backgroundPageManager)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        HStack{
                            VStack(alignment: .leading, spacing: 1){
                                Text("\(greeting())")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundStyle(
                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white.opacity(0.7)
                                    )
                                if !accountPageManager.userFirstName.isEmpty {
                                    Text("\((accountPageManager.userFirstName).capitalized)")
                                        .font(.custom("Poppins-SemiBold", size: 40))
                                        .foregroundStyle(
                                            backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                        )
                                } else {
                                    Text("User")
                                        .font(.custom("Poppins-SemiBold", size: 40))
                                        .foregroundStyle(
                                            backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                        )
                                }
                            }
                            Spacer()
                            if let data = accountPageManager.data, let uiImage = UIImage(data: data){
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(maxWidth: 50, maxHeight: 50)
                                    .cornerRadius(50)
                                    .shadow(color: Color.black, radius: 100)
                            }
                        }.frame(maxHeight: .infinity, alignment: .top)
                        
                        VStack {
                            userWallet(
                                financeManager: financeManager,
                                expensePageManager: expensePageManager,
                                incomePageManager: incomePageManager,
                                transactionManager: transactionManager,
                                backgroundPageManager: backgroundPageManager
                            )
                            
                            lastThreeTrasnsactions(
                                financeManager: financeManager,
                                expensePageManager: expensePageManager,
                                incomePageManager: incomePageManager,
                                transactionManager: transactionManager,
                                accountPageManager: accountPageManager,
                                backgroundPageManager: backgroundPageManager
                            )
                            
                            ExpenseAndIncomeChart(
                                financeManager: financeManager,
                                expensePageManager: expensePageManager,
                                incomePageManager: incomePageManager,
                                transactionManager: transactionManager,
                                accountPageManager: accountPageManager,
                                backgroundPageManager: backgroundPageManager
                            )
                            
                            BusinessNews(
                                backgroundPageManager: backgroundPageManager
                            )
                        }
                        
                        
                    }.padding(.horizontal)
                }
                expensePageAddButton(
                    financeManager: financeManager,
                    expensePageManager: expensePageManager,
                    incomePageManager: incomePageManager,
                    transactionManager: transactionManager,
                    backgroundPageManager: backgroundPageManager
                )
                .padding(20)
                
            }
        }.navigationBarBackButtonHidden(true)
            .tint(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
    }
    
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour >= 0 && hour < 12 {
            return "Good Morning"
        } else if hour >= 12 && hour < 17 {
            return "Good Afternoon"
        } else if hour >= 17 && hour < 21 {
            return "Good Evening"
        } else if hour >= 21 && hour < 24 {
            return "Good Night"
        } else {
            return "Good Morning"
        }
    }
}


struct userWallet: View{
    
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View{
        
        let totalIncome = incomePageManager.incomeDetailsArray.reduce(0) { total, income in
            total + (Int(income.incomeAmount) ?? 0)
        }
        
        let totalExpenses = expensePageManager.expenseDetailsArray.reduce(0) { total, expense in
            total + (Int(expense.expenseAmount) ?? 0)
        }
        
        let totalWalletBalance = (Int(accountPageManager.accountBalance) ?? 0) + (totalIncome - totalExpenses)
        
        
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .leading){
                Text("Your balance")
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(
                        backgroundPageManager.isDarkMode == false ? Color.black
                            .opacity(0.7) : Color.white.opacity(0.7)
                    )
                
                Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency)) \(Int(totalWalletBalance))")
                    .font(.custom("Poppins-Medium", size: 40))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
            }
            
            HStack{
                VStack(alignment: .leading){
                    
                    Text("Income")
                        .font(.custom("Poppins-Regular", size: 20))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.white.opacity(0.7))
                    Text("+ \(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(Int(totalIncome))")
                        .font(.custom("Poppins-Medium", size: 20))
                        .foregroundStyle(Color.green)
                    
                    
                    
                }
                Spacer()
                VStack(alignment: .leading) {
                    
                    Text("Expense")
                        .font(.custom("Poppins-Regular", size: 20))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.white.opacity(0.7))
                    Text("- \(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(totalExpenses)")
                        .font(.custom("Poppins-Medium", size: 20))
                        .foregroundStyle(Color.red)
                }
            }
        }
        .foregroundStyle(Color.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
        .cornerRadius(20)
    }
}

struct expensePageAddButton: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        NavigationLink(
            destination: ExpensePage(
                financeManager: financeManager,
                expensePageManager: expensePageManager,
                incomePageManager: incomePageManager,
                transactionManager: transactionManager,
                backgroundPageManager: backgroundPageManager
            )
        ) {
            Image(systemName: "plus")
                .font(.system(size: 40))
                .padding()
                .foregroundStyle(Color.black)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(radius: 20)
        }
    }
}

struct lastThreeTrasnsactions: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        if !transactionManager.transactionDetailsArray.isEmpty {
            VStack(alignment: .leading) {
                Text("Recent Transactions")
                    .font(.custom("Poppins-SemiBold", size: 25))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                ForEach(
                    transactionManager.transactionDetailsArray
                        .sorted(by: { $0.expenseDate < $1.expenseDate })
                        .suffix(3).reversed(),
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
        }
    }
}

struct ExpenseAndIncomeChart: View {
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        if !expensePageManager.expenseDetailsArray.isEmpty || !incomePageManager.incomeDetailsArray.isEmpty {
            VStack(alignment: .leading) {
                Text("Stats")
                    .font(.custom("Poppins-SemiBold", size: 25))
                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                
                VStack(alignment: .center) {
                    Chart {
                        let currentMonth = Calendar.current.component(.month, from: Date())
                        let currentYear = Calendar.current.component(.year, from: Date()) // CHATGPT:
                        
                        let filteredTransactions = transactionManager.transactionDetailsArray.filter { transaction in // CHATGPT:
                            let transactionMonth = Calendar.current.component(.month, from: transaction.expenseDate) // CHATGPT:
                            let transactionYear = Calendar.current.component(.year, from: transaction.expenseDate) // CHATGPT:
                            return transactionMonth == currentMonth && transactionYear == currentYear
                        }
                        
                        let sortedTransactions = filteredTransactions.sorted { $0.expenseDate < $1.expenseDate }
                        
                        ForEach(sortedTransactions) { transaction in
                            BarMark(
                                x: .value("Date", transaction.expenseDate.formattedDate()),
                                y: .value("Amount", Double(transaction.expenseAmount) ?? 0)
                            )
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.5), radius: 5)
                            .foregroundStyle(by: .value("Type", transaction.transactionType))
                        }
                    }
                    .frame(height: 300)
                    .padding()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            }
        }
    }
}

struct BusinessNews: View {
    @StateObject var viewModel = ViewModel()
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                if let articles = viewModel.news?.articles, !articles.isEmpty {
                    Text("Financial News")
                        .font(.custom("Poppins-SemiBold", size: 25))
                        .foregroundColor(backgroundPageManager.isDarkMode ? .white : .black)
                }
                
                if let articles = viewModel.news?.articles.suffix(10) {
                    ForEach(articles, id: \.url) { article in
                        Link(destination: URL(string: article.url) ?? URL(string: "https://example.com")!) {
                            VStack {
                                HStack {
                                    if let urlToImage = article.urlToImage,
                                       let url = URL(string: urlToImage) {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .frame(width: 150, height: 100)
                                                .cornerRadius(10)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    } else {
                                        Color.gray
                                            .frame(width: 150, height: 100)
                                            .cornerRadius(10)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(article.title)
                                            .font(.custom("Poppins-SemiBold", size: 15))
                                            .foregroundColor(backgroundPageManager.isDarkMode ? .white : .black)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(3)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundPageManager.isDarkMode ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
                            .cornerRadius(20)
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    HomePage()
}
