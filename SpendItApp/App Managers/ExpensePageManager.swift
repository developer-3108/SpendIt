import Foundation

struct ExpenseCategory: Identifiable {
    let id = UUID()
    let logo: String
    let category: String
}

struct ExpenseDetails: Codable, Identifiable {
    let id = UUID()
    let expenseDate: Date
    let expenseTitle: String
    let expenseAmount: String
    let expenseCategory: String
    let expenseLogo: String
}

class ExpensePageManager: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var expenseTitle: String = ""
    @Published var expenseAmount: String = ""
    @Published var selectedExpenseCategory: String = "Other"
    @Published var selectedExpenseCategoryLogo: String = "ellipsis.circle.fill"
    @Published var ExpensePageCategory: Bool = false
    @Published var expenseCategoryArray: [ExpenseCategory] = [
        ExpenseCategory(logo: "fork.knife", category: "Food and Dining"),
        ExpenseCategory(logo: "tshirt.fill", category: "Clothes"),
        ExpenseCategory(logo: "cart.fill", category: "Shopping"),
        ExpenseCategory(logo: "car.side", category: "Travel"),
        ExpenseCategory(logo: "fuelpump.fill", category: "Fuel"),
        ExpenseCategory(logo: "duffle.bag.fill", category: "Holidays"),
        ExpenseCategory(logo: "house.fill", category: "Household"),
        ExpenseCategory(logo: "figure.child", category: "Kids"),
        ExpenseCategory(logo: "iphone", category: "Entertainment"),
        ExpenseCategory(logo: "cross.case.fill", category: "Medical"),
        ExpenseCategory(logo: "bathtub.fill", category: "Personal Care"),
        ExpenseCategory(logo: "graduationcap.fill", category: "Education"),
        ExpenseCategory(logo: "pencil.and.list.clipboard", category: "Bills and Utilities"),
        ExpenseCategory(logo: "chart.bar.fill", category: "Investments"),
        ExpenseCategory(logo: "dollarsign", category: "Rent"),
        ExpenseCategory(logo: "dollarsign.bank.building.fill", category: "Taxes"),
        ExpenseCategory(logo: "checkmark.shield.fill", category: "Insurancce"),
        ExpenseCategory(logo: "gift", category: "Gifts"),
        ExpenseCategory(logo: "appletv.fill", category: "Subscriptions"),
        ExpenseCategory(logo: "car.side.and.exclamationmark", category: "Vehicle"),
        ExpenseCategory(logo: "ellipsis.circle.fill", category: "Other")
    ]
    @Published var lineViewSelected: Bool = false
    @Published var expenseDetailsArray: [ExpenseDetails] = [] {
        didSet {
            saveExpenseDetails()
        }
    }
    
    init() {
        loadExpenseDetails()
    }
    
    private func saveExpenseDetails() {
        if let encodedData = try? JSONEncoder().encode(expenseDetailsArray) {
            UserDefaults.standard.set(encodedData, forKey: "expenseDetailsArray")
        }
    }
    
    private func loadExpenseDetails() {
        if let savedData = UserDefaults.standard.data(forKey: "expenseDetailsArray"),
           let decodedData = try? JSONDecoder().decode([ExpenseDetails].self, from: savedData) {
            expenseDetailsArray = decodedData
        }
    }
}

struct AggregatedExpense: Identifiable {
    let id = UUID()
    let category: String
    let totalAmount: Int
}

struct AggregatedIncome: Identifiable {
    let id = UUID()
    let category: String
    let totalAmount: Int
}

struct IncomeCategory: Identifiable {
    let id = UUID()
    let logo: String
    let category: String
}

struct IncomeDetails: Codable, Identifiable {
    let id = UUID()
    let incomeDate: Date
    let incomeTitle: String
    let incomeAmount: String
    let incomeCategory: String
    let incomeLogo: String
}

class IncomePageManager: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var incomeTitle: String = ""
    @Published var incomeAmount: String = ""
    @Published var selectedIncomeCategory: String = "Other"
    @Published var selectedIncomeCategoryLogo: String = "ellipsis.circle.fill"
    @Published var IncomePageCategory: Bool = false
    @Published var incomeCategoryArray: [IncomeCategory] = [
        IncomeCategory(logo: "banknote.fill", category: "Salary"),
        IncomeCategory(logo: "suitcase.cart.fill", category: "Sold Items"),
        IncomeCategory(logo: "tag.fill", category: "Coupon"),
        IncomeCategory(logo: "dollarsign.circle.fill", category: "Investment"),
        IncomeCategory(logo: "giftcard.fill", category: "Lottery"),
        IncomeCategory(logo: "ellipsis.circle.fill", category: "Other")
    ]
    @Published var lineViewSelected: Bool = false
    @Published var incomeDetailsArray: [IncomeDetails] = [] {
        didSet {
            saveIncomeDetails()
        }
    }
    
    init() {
        loadIncomeDetails()
    }
    
    private func saveIncomeDetails() {
        if let encodedData = try? JSONEncoder().encode(incomeDetailsArray) {
            UserDefaults.standard.set(encodedData, forKey: "incomeDetailsArray")
        }
    }
    
    private func loadIncomeDetails() {
        if let savedData = UserDefaults.standard.data(forKey: "incomeDetailsArray"),
           let decodedData = try? JSONDecoder().decode([IncomeDetails].self, from: savedData) {
            incomeDetailsArray = decodedData
        }
    }
}

