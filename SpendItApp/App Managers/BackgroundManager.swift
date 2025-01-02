import SwiftUI

struct BackgroundManager: View {
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some View {
        
        if backgroundPageManager.selectedBackgroundColor == "blue" && backgroundPageManager.isDarkMode == false {
            Image("blue1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "blue" && backgroundPageManager.isDarkMode == true {
            Image("blue2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "purple" && backgroundPageManager.isDarkMode == false {
            Image("purple1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "purple" && backgroundPageManager.isDarkMode == true {
            Image("purple2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "pink" && backgroundPageManager.isDarkMode == false {
            Image("pink1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "pink" && backgroundPageManager.isDarkMode == true {
            Image("pink2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "red" && backgroundPageManager.isDarkMode == false {
            Image("red1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "red" && backgroundPageManager.isDarkMode == true {
            Image("red2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "orange" && backgroundPageManager.isDarkMode == false {
            Image("orange1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "orange" && backgroundPageManager.isDarkMode == true {
            Image("orange2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "yellow" && backgroundPageManager.isDarkMode == false {
            Image("yellow1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "yellow" && backgroundPageManager.isDarkMode == true {
            Image("yellow2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "green" && backgroundPageManager.isDarkMode == false {
            Image("green1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "green" && backgroundPageManager.isDarkMode == true {
            Image("green2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "white" && backgroundPageManager.isDarkMode == false {
            Image("white1")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        } else if backgroundPageManager.selectedBackgroundColor == "white" && backgroundPageManager.isDarkMode == true {
            Image("white2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 50, opaque: true)
        }
    }
}

#Preview {
    BackgroundManager()
}
