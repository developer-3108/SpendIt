import SwiftUI

struct ProfileSettings: View {
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var onboardingManager = OnboardingManager()
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing){
                BackgroundManager(backgroundPageManager: backgroundPageManager)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 15){
                        
                        Text("Name")
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        HStack{
                            TextField(
                                "First Name",
                                text: $firstName
                            )
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                            .cornerRadius(10)
                            
                            TextField(
                                "Last Name",
                                text: $lastName
                            )
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                        
                        Text("Age")
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        TextField(
                            "Enter Age",
                            text: $age
                        )
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        .keyboardType(.numberPad)
                        .font(.custom("Poppins-Regular", size: 20))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                        .cornerRadius(10)
                        
                        Text("Main Currency")
                            .font(.custom("Poppins-Regular", size: 20))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        HStack {
                            Text(financeManager.selectedCurrencySymbol(selectedSymbol: financeManager.selectedCurrency))
                                .font(.custom("Poppins-Regular", size: 25))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                .padding(.trailing, 5)
                            
                            
                            Spacer()
                            
                            
                            Picker("Select Currency", selection: $financeManager.selectedCurrency) {
                                ForEach(financeManager.allCurrencies, id: \.self) { currency in
                                    Text(currency)
                                        .font(.custom("Poppins-Regular", size: 35))
                                        .tag(currency)
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.1) : Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                        
                        Text("What is your Primary Goal?")
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                        VStack(spacing: 10){
                            HStack(spacing: 10) {
                                Button {
                                    if accountPageManager.budgetingButton == false {
                                        accountPageManager.budgetingButton = true
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                        accountPageManager.userGoal = "Budgeting"
                                    } else{
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                    }
                                } label: {
                                    VStack {
                                        Image("1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                        Text("Budgeting")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 140)
                                    .padding()
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(20)
                                }
                                .shadow(
                                    color: Color.black.opacity(0.8),
                                    radius: accountPageManager.budgetingButton
                                    == true ? 10 : 0
                                )
                                .scaleEffect(
                                    accountPageManager.budgetingButton
                                    == true ? 1.1 : 0.9)
                                .animation(
                                    .easeInOut(duration: 0.3),
                                    value: accountPageManager
                                        .budgetingButton)
                                
                                Button {
                                    if accountPageManager.saveMoneyButton  == false {
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = true
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                        accountPageManager.userGoal = "Save Money"
                                    } else{
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                    }
                                } label: {
                                    VStack {
                                        Image("2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                        Text("Save money")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 140)
                                    .padding()
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(20)
                                }
                                .shadow(
                                    color: Color.black.opacity(0.8),
                                    radius: accountPageManager.saveMoneyButton
                                    == true ? 10 : 0
                                )
                                .scaleEffect(
                                    accountPageManager.saveMoneyButton
                                    == true ? 1.1 : 0.9)
                                .animation(
                                    .easeInOut(duration: 0.3),
                                    value: accountPageManager
                                        .saveMoneyButton)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            HStack(spacing: 10) {
                                Button {
                                    if accountPageManager.trackFinancesButton  == false {
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = true
                                        accountPageManager.manageExpensesButton = false
                                        accountPageManager.userGoal = "Track Finances"
                                    } else{
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                    }
                                } label: {
                                    VStack {
                                        Image("3")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                        Text("Track finances")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 140)
                                    .padding()
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(20)
                                }
                                .shadow(
                                    color: Color.black.opacity(0.8),
                                    radius: accountPageManager.trackFinancesButton
                                    == true ? 10 : 0
                                )
                                .scaleEffect(
                                    accountPageManager.trackFinancesButton
                                    == true ? 1.1 : 0.9)
                                .animation(
                                    .easeInOut(duration: 0.3),
                                    value: accountPageManager
                                        .trackFinancesButton)
                                
                                Button {
                                    if accountPageManager.manageExpensesButton  == false {
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = true
                                        accountPageManager.userGoal = "Manage Expenses"
                                    } else{
                                        accountPageManager.budgetingButton = false
                                        accountPageManager.saveMoneyButton = false
                                        accountPageManager.trackFinancesButton = false
                                        accountPageManager.manageExpensesButton = false
                                    }
                                } label: {
                                    VStack {
                                        Image("6")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                        Text("Manage expenses")
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 140)
                                    .padding()
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(20)
                                }
                                .shadow(
                                    color: Color.black.opacity(0.8),
                                    radius: accountPageManager.manageExpensesButton
                                    == true ? 10 : 0
                                )
                                .scaleEffect(
                                    accountPageManager.manageExpensesButton
                                    == true ? 1.1 : 0.9)
                                .animation(
                                    .easeInOut(duration: 0.3),
                                    value: accountPageManager
                                        .manageExpensesButton)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .padding(.horizontal)
                    .font(.custom("Poppins-Regular", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button {
                    
                    if !firstName.isEmpty && !lastName.isEmpty && !age.isEmpty && !accountPageManager.userGoal.isEmpty {
                        accountPageManager.userFirstName = firstName
                        accountPageManager.userLastName = lastName
                        accountPageManager.userAge = age
                        showAlert = false
                    } else {
                        showAlert = true
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .padding()
                        .foregroundStyle(Color.black)
                }.alert("Please fill in all the details", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                
            }
        }
    }
}

#Preview {
    ProfileSettings()
}
