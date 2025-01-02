import Foundation
import SwiftUI

class BackgroundPageManager: ObservableObject {
    
    static func getSystemDarkMode() -> Bool {
        UIScreen.main.traitCollection.userInterfaceStyle == .dark
    }
    
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    @Published var backgroundImage: String {
        didSet {
            UserDefaults.standard.set(backgroundImage, forKey: "backgroundImage")
        }
    }
    @Published var selectedBackgroundColor: String {
        didSet {
            UserDefaults.standard.set(selectedBackgroundColor, forKey: "selectedBackgroundColor")
        }
    }
    
    init() {
        
        let savedIsDarkMode = UserDefaults.standard.object(forKey: "isDarkMode") as? Bool
        self.isDarkMode = savedIsDarkMode ?? BackgroundPageManager.getSystemDarkMode()
        
        
        self.backgroundImage = UserDefaults.standard.string(forKey: "backgroundImage") ?? "purple1"
        self.selectedBackgroundColor = UserDefaults.standard.string(forKey: "selectedBackgroundColor") ?? "purple"
    }
}
