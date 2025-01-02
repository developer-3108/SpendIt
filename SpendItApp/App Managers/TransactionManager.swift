
import Foundation

struct TransactionDetails: Codable, Identifiable {
    let id = UUID()
    let expenseDate: Date
    let transactionType: String
    let expenseTitle: String
    let expenseAmount: String
    let expenseCategory: String
    let expenseLogo: String
}

class TransactionManager: ObservableObject {
    @Published var transactionDetailsArray: [TransactionDetails] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    init() {

        self.transactionDetailsArray = TransactionManager.loadFromUserDefaults()
    }
    
    
    private func saveToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(transactionDetailsArray) {
            UserDefaults.standard.set(encodedData, forKey: "transactionDetailsArray")
        }
    }
    
    
    private static func loadFromUserDefaults() -> [TransactionDetails] {
        if let savedData = UserDefaults.standard.data(forKey: "transactionDetailsArray"),
           let decodedArray = try? JSONDecoder().decode([TransactionDetails].self, from: savedData) {
            return decodedArray
        }
        return []
    }
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    static let customDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
}
