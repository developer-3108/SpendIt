import Foundation
import SwiftUI
import SwiftUICore

class FinanceManager: ObservableObject{
    @Published var allCurrencies: [String] = ["INR", "USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CNH", "NZD", "PKR"]
    
    @Published var selectedCurrency: String {
        didSet {
            UserDefaults.standard.set(selectedCurrency, forKey: "selectedCurrency")
        }
    }
    
    init() {
        self.selectedCurrency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "INR"
    }
    
    func selectedCurrencySymbol(selectedSymbol: String) -> String {
        switch selectedSymbol {
        case "INR": return "₹"
        case "USD": return "$"
        case "EUR": return "€"
        case "JPY": return "¥"
        case "GBP": return "£"
        case "AUD": return "A$"
        case "CAD": return "C$"
        case "CNH": return "元"
        case "NZD": return "NZ$"
        case "PKR": return "Rs"
        default: return "₹"
        }
    }

}
