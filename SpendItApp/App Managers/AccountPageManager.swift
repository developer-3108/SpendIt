import Foundation
import PhotosUI
import SwiftUI
import SwiftUICore

class AccountPageManager: ObservableObject {
    @Published var accountid: UUID {
        didSet {
            UserDefaults.standard.set(accountid.uuidString, forKey: "accountid")
        }
    }
    @Published var accountIconName: String {
        didSet {
            UserDefaults.standard.set(accountIconName, forKey: "accountIconName")
        }
    }
    @Published var accountIconColor: Color {
        didSet {
            let colorString = UIColor(accountIconColor).toHexString()
            UserDefaults.standard.set(colorString, forKey: "accountIconColor")
        }
    }
    @Published var accountName: String {
        didSet {
            UserDefaults.standard.set(accountName, forKey: "accountName")
        }
    }
    @Published var accountBalance: String {
        didSet {
            UserDefaults.standard.set(accountBalance, forKey: "accountBalance")
        }
    }
    @Published var userFirstName: String {
        didSet {
            UserDefaults.standard.set(userFirstName, forKey: "userFirstName")
        }
    }
    @Published var userLastName: String {
        didSet {
            UserDefaults.standard.set(userLastName, forKey: "userLastName")
        }
    }
    @Published var userAge: String {
        didSet {
            UserDefaults.standard.set(userAge, forKey: "userAge")
        }
    }
    @Published var userGoal: String {
        didSet {
            UserDefaults.standard.set(userGoal, forKey: "userGoal")
        }
    }
    @Published var budgetingButton: Bool {
        didSet {
            UserDefaults.standard.set(budgetingButton, forKey: "budgetingButton")
        }
    }
    @Published var saveMoneyButton: Bool {
        didSet {
            UserDefaults.standard.set(saveMoneyButton, forKey: "saveMoneyButton")
        }
    }
    @Published var trackFinancesButton: Bool {
        didSet {
            UserDefaults.standard.set(trackFinancesButton, forKey: "trackFinancesButton")
        }
    }
    @Published var manageExpensesButton: Bool {
        didSet {
            UserDefaults.standard.set(manageExpensesButton, forKey: "manageExpensesButton")
        }
    }
    @Published var loginStatus: Bool {
        didSet {
            UserDefaults.standard.set(loginStatus, forKey: "loginStatus")
        }
    }
    
    @Published var data: Data? {
        didSet {
            UserDefaults.standard.set(data, forKey: "data")
        }
    }
    
    init() {
        self.accountid = UUID(uuidString: UserDefaults.standard.string(forKey: "accountid") ?? UUID().uuidString)!
        self.accountIconName = UserDefaults.standard.string(forKey: "accountIconName") ?? "dollarsign.bank.building.fill"
        let colorString = UserDefaults.standard.string(forKey: "accountIconColor") ?? "#FF0000"
        self.accountIconColor = Color(UIColor(hexString: colorString))
        self.accountName = UserDefaults.standard.string(forKey: "accountName") ?? "Account"
        self.accountBalance = UserDefaults.standard.string(forKey: "accountBalance") ?? "0.00"
        self.userFirstName = UserDefaults.standard.string(forKey: "userFirstName") ?? ""
        self.userLastName = UserDefaults.standard.string(forKey: "userLastName") ?? ""
        self.userAge = UserDefaults.standard.string(forKey: "userAge") ?? ""
        self.userGoal = UserDefaults.standard.string(forKey: "userGoal") ?? ""
        self.budgetingButton = UserDefaults.standard.bool(forKey: "budgetingButton")
        self.saveMoneyButton = UserDefaults.standard.bool(forKey: "saveMoneyButton")
        self.trackFinancesButton = UserDefaults.standard.bool(forKey: "trackFinancesButton")
        self.manageExpensesButton = UserDefaults.standard.bool(forKey: "manageExpensesButton")
        self.loginStatus = UserDefaults.standard.bool(forKey: "loginStatus")
        self.data = UserDefaults.standard.data(forKey: "data")
    }
}

extension UIColor {
    func toHexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255)
        return String(format: "#%06x", rgb)
    }
    
    convenience init(hexString: String) {
        let scanner = Scanner(string: hexString)
        scanner.scanLocation = 1
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
