import SwiftUI
import PhotosUI

struct SettingsPage: View {
    @ObservedObject var accountPageManager = AccountPageManager()
    @ObservedObject var financeManager = FinanceManager()
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var incomePageManager = IncomePageManager()
    @ObservedObject var transactionManager = TransactionManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    @ObservedObject var onboardingManager = OnboardingManager()
    @State private var shouldNavigateToScreen1: Bool = false
    @State var selectedItems: [PhotosPickerItem] = []


    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundManager(backgroundPageManager: backgroundPageManager)
                
                ScrollView(showsIndicators: false){
                    VStack{
                        VStack{
                            Text("Settings")
                                .font(.custom("Poppins-SemiBold", size: 40))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack{
                            
                            if let data = accountPageManager.data, let uiImage = UIImage(data: data){
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .cornerRadius(100)
                                    .shadow(color: Color.black, radius: 100)
                            }
                            PhotosPicker(
                                selection: $selectedItems,
                                maxSelectionCount: 1,
                                matching: .images
                            ) {
                                Text("Upload Photo").foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.yellow)
                            }.onChange(of: selectedItems) { oldValue, newValue in
                                guard let item = selectedItems.first else { return }
                                
                                item.loadTransferable(type: Data.self) { result in
                                    switch result {
                                    case .success(let data):
                                        if let data = data {
                                            DispatchQueue.main.async {
                                                self.accountPageManager.data = data
                                            }
                                        } else {
                                            print("Data is nil")
                                        }
                                    case .failure(let error):
                                        fatalError("\(error)")
                                    }
                                }
                            }
                        
                            
                            Text("\((accountPageManager.userFirstName).capitalized) \((accountPageManager.userLastName).capitalized)")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        
                        VStack(spacing: 30){
                            VStack(alignment: .leading){
                                Text("Preferences")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.white.opacity(0.5))
                                    .padding(.vertical, 5)
                                Button{
                                    
                                } label: {
                                    NavigationLink(
                                        destination: ProfileSettings(backgroundPageManager: backgroundPageManager, accountPageManager: accountPageManager,financeManager: financeManager
                                            )) {
                                            HStack{
                                                Image(systemName: "person.crop.circle")
                                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                                    .font(.title2)
                                                
                                                Text("Profile Settings")
                                                    .font(.custom("Poppins-Regular", size: 20))
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                    .font(.title3)
                                            }
                                        }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                                
                                
                            }
                            
                            VStack(alignment: .leading){
                                Text("Customisation")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.white.opacity(0.5))
                                    .padding(.vertical, 5)
                                
                                VStack(spacing: 20) {
                                    HStack{
                                        Image(systemName: "paintbrush.fill")
                                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                            .font(.title2)
                                        
                                        Text("App Theme")
                                            .font(.custom("Poppins-Regular", size: 20))
                                            .foregroundStyle(
                                                backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                            )
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    HStack {
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "blue"
                                        } label: {
                                            ZStack{
                                                if backgroundPageManager.selectedBackgroundColor == "blue"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.blue)
                                                    .border(Color.white, width: 50)
                                            }
                                            
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "purple"
                                        } label: {
                                            ZStack {
                                                
                                                if backgroundPageManager.selectedBackgroundColor == "purple"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.purple)
                                            }
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "pink"
                                        } label: {
                                            ZStack {
                                                
                                                if backgroundPageManager.selectedBackgroundColor == "pink"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.pink)
                                            }
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "red"
                                        } label: {
                                            ZStack {
                                                
                                                if backgroundPageManager.selectedBackgroundColor == "red"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.red)
                                            }
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "orange"
                                        } label: {
                                            ZStack {
                                                
                                                if backgroundPageManager.selectedBackgroundColor == "orange"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.orange)
                                            }
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "yellow"
                                        } label: {
                                            ZStack {
                                                if backgroundPageManager.selectedBackgroundColor == "yellow"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.yellow)
                                            }
                                        }
                                        
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "green"
                                        } label: {
                                            
                                            ZStack {
                                                if backgroundPageManager.selectedBackgroundColor == "green"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.green)
                                            }
                                        }
                                        
                                        
                                        Button {
                                            backgroundPageManager.selectedBackgroundColor = "white"
                                        } label: {
                                            ZStack {
                                                if backgroundPageManager.selectedBackgroundColor == "white"{
                                                    Circle()
                                                        .stroke(Color.white, lineWidth: 5)
                                                        .frame(width: 40, height: 40)
                                                }
                                                Image(systemName: "circle.fill")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.white)
                                            }
                                        }
                                        
                                    }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                                Button{
                                    
                                } label: {
                                    HStack{
                                        Image(systemName: "moon.fill")
                                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                            .font(.title2)
                                        
                                        Text("Dark Mode")
                                            .font(.custom("Poppins-Regular", size: 20))
                                            .foregroundStyle(
                                                backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                            )
                                        
                                        Spacer()
                                        
                                        Toggle(
                                            "",
                                            isOn: $backgroundPageManager.isDarkMode
                                        ).tint(.purple)
                                    }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                            }
                            
                            VStack(alignment: .leading){
                                Text("About App")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.7) : Color.white.opacity(0.5))
                                    .padding(.vertical, 5)
                                Button{
                                    
                                } label: {
                                    
                                    NavigationLink(
                                        destination: AboutPage(backgroundPageManager: backgroundPageManager)) {
                                            HStack{
                                                Image(systemName: "info.circle")
                                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                                    .font(.title2)
                                                
                                                Text("About")
                                                    .font(.custom("Poppins-Regular", size: 20))
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                    .font(.title3)
                                            }
                                        }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                                Button{
                                    
                                } label: {
                                    
                                    NavigationLink(
                                        destination: FAQsPage(
                                            backgroundPageManager: backgroundPageManager
                                        )) {
                                            HStack{
                                                Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
                                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                                    .font(.title2)
                                                
                                                Text("FAQs")
                                                    .font(.custom("Poppins-Regular", size: 20))
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                    .font(.title3)
                                            }
                                        }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                                Button{
                                    
                                } label: {
                                    NavigationLink(
                                        destination: TermsAndConditionPage(backgroundPageManager: backgroundPageManager)) {
                                            HStack{
                                                Image(systemName: "text.document")
                                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                                    .font(.title2)
                                                
                                                Text("Terms & Conditions")
                                                    .font(.custom("Poppins-Regular", size: 20))
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(
                                                        backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                    )
                                                    .font(.title3)
                                            }
                                        }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                                Button{
                                    
                                } label: {
                                    Link(destination: URL(string: "https://forms.gle/XEDAmjh2wBj4MLuV9")!) {
                                        HStack{
                                            Image(systemName: "lifepreserver")
                                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.yellow)
                                                .font(.title2)
                                            
                                            Text("Help & Support")
                                                .font(.custom("Poppins-Regular", size: 20))
                                                .foregroundStyle(
                                                    backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                )
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(
                                                    backgroundPageManager.isDarkMode == false ? Color.black : Color.white
                                                )
                                                .font(.title3)
                                        }
                                    }
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.white.opacity(0.4))
                                
                            }
                            
                        }
                        
                    }.padding(.horizontal)
                }
                
            }
        }
    }
}

#Preview {
    SettingsPage()
}
