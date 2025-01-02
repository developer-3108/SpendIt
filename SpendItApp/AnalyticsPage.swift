import SwiftUI
import Charts

struct AnalyticsPage: View {
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack{
            BackgroundManager(backgroundPageManager: backgroundPageManager)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading){
                    VStack{
                        Text("Analytics")
                            .padding(.leading)
                            .font(.custom("Poppins-SemiBold", size: 40))
                            .foregroundStyle(
                                backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                    }
                    
                    ExpenseAndIncome(
                        accountPageManager: accountPageManager,
                        financeManager: financeManager,
                        expensePageManager: expensePageManager,
                        incomePageManager: incomePageManager,
                        transactionManager: transactionManager,
                        backgroundPageManager: backgroundPageManager
                    )
                    
                    if !expensePageManager.expenseDetailsArray.isEmpty {
                        Text("Categories")
                            .font(.custom("Poppins-SemiBold", size: 25))
                            .foregroundStyle(
                                backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                            )
                            .padding(.horizontal)
                        
                        CategoryWiseExpense(
                            accountPageManager: accountPageManager,
                            financeManager: financeManager,
                            expensePageManager: expensePageManager,
                            incomePageManager: incomePageManager,
                            transactionManager: transactionManager,
                            backgroundPageManager: backgroundPageManager
                        )
                    }
                    
                    if !incomePageManager.incomeDetailsArray.isEmpty {
                        CategoryWiseIncome(
                            accountPageManager: accountPageManager,
                            financeManager: financeManager,
                            expensePageManager: expensePageManager,
                            incomePageManager: incomePageManager,
                            transactionManager: transactionManager,
                            backgroundPageManager: backgroundPageManager
                        )
                    }
                    
                    if !expensePageManager.expenseDetailsArray.isEmpty {
                        AmountWiseHistogram(
                            accountPageManager: accountPageManager,
                            financeManager: financeManager,
                            expensePageManager: expensePageManager,
                            incomePageManager: incomePageManager,
                            transactionManager: transactionManager,
                            backgroundPageManager: backgroundPageManager
                        )
                    }
                    
                }
            }
        }
    }
}

struct ExpenseAndIncome: View {
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title)
                    .padding(7)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(50)
                
                VStack(alignment: .leading){
                    Text("Expense")
                        .font(.custom("Poppins-Regular", size: 20))
                    
                    let totalExpenses = expensePageManager.expenseDetailsArray.reduce(0) { total, expense in
                        total + (Int(expense.expenseAmount) ?? 0)
                    }
                    
                    Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(totalExpenses)")
                        .font(.custom("Poppins-SemiBold", size: 15))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.red)
            .cornerRadius(20)
            
            Spacer()
            
            HStack{
                Image(systemName: "arrow.down.circle.fill")
                    .font(.title)
                    .padding(7)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(50)
                
                VStack(alignment: .leading){
                    Text("Income")
                        .font(.custom("Poppins-Regular", size: 20))
                    
                    let totalIncome = incomePageManager.incomeDetailsArray.reduce(0) { total, income in
                        total + (Int(income.incomeAmount) ?? 0)
                    }
                    
                    Text("\(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))\(totalIncome)")
                        .font(.custom("Poppins-SemiBold", size: 15))
                }
            }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.green)
                .cornerRadius(20)
                .foregroundStyle(Color.black)
            
        }
        .foregroundStyle(Color.white)
        .padding(.horizontal)
    }
}

struct CategoryWiseExpense: View {
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            VStack(alignment: .center) {
                Text("Expense")
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(
                        backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.white.opacity(0.8)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .center) {
                
                let data = aggregateExpenses(
                    byCategory: expensePageManager.expenseDetailsArray
                )
                Chart {
                    ForEach(data) { d in
                        SectorMark(
                            angle: .value("Amount", d.totalAmount),
                            innerRadius: .ratio(0.618),
                            outerRadius: .inset(10),
                            angularInset: 1
                        )
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.5), radius: 5)
                        .foregroundStyle(by: .value("Category", d.category))
                    }
                }.frame(width: 200, height: 200)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
            
        }.padding(.horizontal)
    }
    
    private func aggregateExpenses(byCategory expenses: [ExpenseDetails]) -> [AggregatedExpense] {
        var aggregatedData: [String: Int] = [:]
        
        for expense in expenses {
            let category = expense.expenseCategory
            let amount = Int(expense.expenseAmount) ?? 0
            aggregatedData[category, default: 0] += amount
        }
        
        return aggregatedData.map { AggregatedExpense(category: $0.key, totalAmount: $0.value) }
    }
}

struct CategoryWiseIncome: View {
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            VStack(alignment: .center) {
                Text("Income")
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(
                        backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.white.opacity(0.8)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .center) {
                
                let data = aggregateIncome(
                    byCategory: incomePageManager.incomeDetailsArray
                )
                Chart {
                    ForEach(data) { d in
                        SectorMark(
                            angle: .value("Amount", d.totalAmount),
                            innerRadius: .ratio(0.618),
                            outerRadius: .inset(10),
                            angularInset: 1
                        )
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.5), radius: 5)
                        .foregroundStyle(by: .value("Category", d.category))
                    }
                }.frame(width: 200, height: 200)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
        }.padding(.horizontal)
    }
    
    private func aggregateIncome(byCategory incomeDetails: [IncomeDetails]) -> [AggregatedIncome] {
        var aggregatedData: [String: Int] = [:]
        
        for income in incomeDetails {
            let category = income.incomeCategory
            let amount = Int(income.incomeAmount) ?? 0
            aggregatedData[category, default: 0] += amount
        }
        
        return aggregatedData.map { AggregatedIncome(category: $0.key, totalAmount: $0.value) }
    }
}

struct AmountWiseHistogram: View {
    @ObservedObject var accountPageManager: AccountPageManager
    @ObservedObject var financeManager: FinanceManager
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var transactionManager: TransactionManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        VStack(spacing: 5) {
            
            VStack(alignment: .center) {
                Text("Spending Analysis")
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(
                        backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.8) : Color.white.opacity(0.8)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .center) {
                
                let data = aggregateTransactionsByRange(
                    transactions: transactionManager
                        .transactionDetailsArray)
                Chart {
                    ForEach(data, id: \.range) { item in
                        BarMark(
                            x: .value("Range", item.range),
                            y: .value("Count", item.count)
                        )
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.5), radius: 5)
                        .foregroundStyle(Color.red)
                    }
                }
                .frame(height: 300)
                .padding()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
        }.padding(.horizontal)
    }
    
    private func aggregateTransactionsByRange(transactions: [TransactionDetails]) -> [(range: String, count: Int)] {
        let ranges = [
            (min: 0, max: 500),
            (min: 501, max: 5000),
            (min: 5001, max: 50000),
            (min: 50001, max: Int.max)
        ]
        
        var result: [(range: String, count: Int)] = []
        
        for range in ranges {
            let count = transactions.filter {
                let amount = Int($0.expenseAmount) ?? 0
                return amount >= range.min && amount <= range.max
            }.count
            
            let rangeLabel = "₹\(range.min)-₹\(range.max == Int.max ? "+" : "\(range.max)")"
            result.append((range: rangeLabel, count: count))
        }
        
        return result
    }
    
}


#Preview {
    AnalyticsPage()
}
