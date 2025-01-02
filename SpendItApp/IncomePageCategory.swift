import SwiftUI

struct IncomePageCategory: View {
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundManager(backgroundPageManager: backgroundPageManager)
            
            
            VStack(alignment: .leading) {
                Button{
                    incomePageManager.IncomePageCategory.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack{
                    
                    Text("Select Category")
                        .font(.custom("Poppins-SemiBold", size: 25))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    
                    Spacer()
                    
                    HStack {
                        Button(){
                            incomePageManager.lineViewSelected = true
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .foregroundStyle(
                                    incomePageManager.lineViewSelected == true ? Color.black : Color.white
                                )
                                .font(.subheadline)
                                .padding(10)
                                .background(
                                    incomePageManager.lineViewSelected == true ? Color.white : Color.clear
                                )
                                .cornerRadius(10)
                        }
                        
                        Button {
                            incomePageManager.lineViewSelected = false
                        } label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .foregroundStyle(
                                    incomePageManager.lineViewSelected == false ? Color.black : Color.white
                                )
                                .font(.subheadline)
                                .padding(10)
                                .background(
                                    incomePageManager.lineViewSelected == false ? Color.white : Color.clear
                                )
                                .cornerRadius(10)
                        }
                    }.background(Color.black.opacity(0.3))
                        .cornerRadius(10)
                }
                
                if incomePageManager.lineViewSelected == true {
                    IncomeCategoryListLayout(
                        incomePageManager: incomePageManager,
                        backgroundPageManager: backgroundPageManager
                    )
                } else if incomePageManager.lineViewSelected == false {
                    IncomeCategoryGridLayout(incomePageManager: incomePageManager,
                                             backgroundPageManager: backgroundPageManager)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            
            incomeSaveButton(incomePageManager: incomePageManager)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
    }
}

struct IncomeCategoryListLayout: View {
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                ForEach(incomePageManager.incomeCategoryArray) { category in
                    
                    Button {
                        incomePageManager.selectedIncomeCategoryLogo = category.logo
                        incomePageManager.selectedIncomeCategory = category.category
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: category.logo)
                                .font(.title)
                                .frame(width: 50)
                            
                            Text(category.category)
                                .font(.headline)
                        }.frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        
                    }
                    .foregroundColor(
                        incomePageManager.selectedIncomeCategory == category.category ? Color.black : Color.black
                    )
                    .padding()
                    .background(
                        incomePageManager.selectedIncomeCategory == category.category ? Color.white : Color.white
                            .opacity(0.3)
                    )
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
        }.cornerRadius(10)
    }
}

struct IncomeCategoryGridLayout: View {
    @ObservedObject var incomePageManager: IncomePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(incomePageManager.incomeCategoryArray) { category in
                    Button {
                        incomePageManager.selectedIncomeCategoryLogo = category.logo
                        incomePageManager.selectedIncomeCategory = category.category
                        print("\(incomePageManager.selectedIncomeCategory)")
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: category.logo)
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                            
                            Text(category.category)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        .foregroundColor(
                            incomePageManager.selectedIncomeCategory == category.category ? Color.black : Color.black
                        )
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            incomePageManager.selectedIncomeCategory == category.category ? Color.white : Color.white
                                .opacity(0.3)
                        )
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .cornerRadius(10)
    }
}

struct incomeSaveButton: View{
    @ObservedObject var incomePageManager: IncomePageManager
    var body: some View {
        Button {
            incomePageManager.selectedIncomeCategoryLogo = incomePageManager.selectedIncomeCategoryLogo
            incomePageManager.selectedIncomeCategory = incomePageManager.selectedIncomeCategory
            print("Save Button: \(incomePageManager.selectedIncomeCategory)")
            incomePageManager.IncomePageCategory.toggle()
        } label: {
            Image(systemName: "square.and.arrow.down.fill")
                .foregroundStyle(Color.black)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .padding()
                .shadow(radius: 20)
        }
    }
}

#Preview {
    IncomePageCategory(incomePageManager: IncomePageManager())
}
