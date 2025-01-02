import SwiftUI

struct AccountPage: View {
    @ObservedObject var onboardingManager = OnboardingManager()
    @StateObject var accountPageManager = AccountPageManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @State var accountName: String = ""
    @State var accountAmount: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            
            BackgroundManager()
            
            ScrollView(showsIndicators: false){
            VStack(spacing: 40) {
                
                Button{
                    onboardingManager.accountPageState.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                
                
                VStack(spacing: 30) {
                    Button{
                        onboardingManager.iconPageState.toggle()
                    } label: {
                        Image(systemName: "\(accountPageManager.accountIconName)")
                            .foregroundStyle(
                                accountPageManager.accountIconColor
                            )
                            .font(.system(size: 200))
                            .shadow(color: Color.black.opacity(0.7), radius: 20)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading){
                            Text("Account Name")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            TextField(
                                "Enter Account Name",
                                text: $accountName)
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Current Balance")
                                .font(.custom("Poppins-Regular", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            TextField(
                                "Enter Current Balance",
                                text: $accountAmount
                            )
                                .keyboardType(.decimalPad)
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                .font(.custom("Poppins-Regular", size: 20))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Button {
                        
                        if !accountName.isEmpty && !accountAmount.isEmpty {
                            accountPageManager.accountName = accountName
                            accountPageManager.accountBalance = accountAmount
                            onboardingManager.accountPageState.toggle()
                        } else {
                            showAlert = true
                        }
                        
                    } label: {
                        Text("Done")
                            .foregroundStyle(Color.black)
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                    }.alert(
                        "Please complete all the required fields.",
                        isPresented: $showAlert
                    ) {
                        Button("OK", role: .cancel) { }
                    }
                }
                .sheet(isPresented: $onboardingManager.iconPageState, content: {
                    IconLogoPage(onboardingManager: onboardingManager,
                                 accountPageManager: accountPageManager,
                                 backgroundPageManager: backgroundPageManager
                    )
                })
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .foregroundStyle(Color.black)
        }
        }
    }
}

#Preview {
    AccountPage(onboardingManager: OnboardingManager(),
                accountPageManager: AccountPageManager())
}
