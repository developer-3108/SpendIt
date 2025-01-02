import SwiftUI

struct ExpensePageCategory: View {
    @ObservedObject var expensePageManager = ExpensePageManager()
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    
    var body: some View {
        ZStack(alignment: .bottom){
            BackgroundManager(backgroundPageManager: backgroundPageManager)
            
                VStack(alignment: .leading) {
                    
                    Button{
                        expensePageManager.ExpensePageCategory.toggle()
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
                                expensePageManager.lineViewSelected = true
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .foregroundStyle(
                                        expensePageManager.lineViewSelected == true ? Color.black : Color.white
                                    )
                                    .font(.subheadline)
                                    .padding(10)
                                    .background(
                                        expensePageManager.lineViewSelected == true ? Color.white : Color.clear
                                    )
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                expensePageManager.lineViewSelected = false
                            } label: {
                                Image(systemName: "square.grid.2x2.fill")
                                    .foregroundStyle(
                                        expensePageManager.lineViewSelected == false ? Color.black : Color.white
                                    )
                                    .font(.subheadline)
                                    .padding(10)
                                    .background(
                                        expensePageManager.lineViewSelected == false ? Color.white : Color.clear
                                    )
                                    .cornerRadius(10)
                            }
                        }.background(Color.black.opacity(0.3))
                            .cornerRadius(10)
                    }
                    
                    if expensePageManager.lineViewSelected == true {
                        ExpenseCategoryListLayout(
                            expensePageManager: expensePageManager,
                            backgroundPageManager: backgroundPageManager
                        )
                    } else if expensePageManager.lineViewSelected == false {
                        ExpenseCategoryGridLayout(expensePageManager: expensePageManager, backgroundPageManager: backgroundPageManager)
                    }
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
            
            saveButton(expensePageManager: expensePageManager)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct ExpenseCategoryListLayout: View {
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                ForEach(expensePageManager.expenseCategoryArray) { category in
                    
                    Button {
                        expensePageManager.selectedExpenseCategoryLogo = category.logo
                        expensePageManager.selectedExpenseCategory = category.category
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: category.logo)
                                .font(.title)
                                .frame(width: 50)
                                .foregroundStyle(Color.black)
                            
                            Text(category.category)
                                .font(.headline)
                                .foregroundStyle(Color.black)
                        }.frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        
                    }
                    .foregroundColor(
                        expensePageManager.selectedExpenseCategory == category.category ? Color.black : Color.black
                    )
                        .padding()
                        .background(
                            expensePageManager.selectedExpenseCategory == category.category ? Color.white : Color.white
                                .opacity(0.3)
                        )
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
        }.cornerRadius(10)
    }
}

struct ExpenseCategoryGridLayout: View {
    @ObservedObject var expensePageManager: ExpensePageManager
    @ObservedObject var backgroundPageManager: BackgroundPageManager
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(expensePageManager.expenseCategoryArray) { category in
                    Button {
                        expensePageManager.selectedExpenseCategoryLogo = category.logo
                        expensePageManager.selectedExpenseCategory = category.category
                        print("\(expensePageManager.selectedExpenseCategory)")
                    } label: {
                        VStack(spacing: 10) {
                            Image(systemName: category.logo)
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.black)
                            
                            Text(category.category)
                                .font(.headline)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        .foregroundColor(
                            expensePageManager.selectedExpenseCategory == category.category ? Color.black : Color.black
                        )
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            expensePageManager.selectedExpenseCategory == category.category ? Color.white : Color.white
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

struct saveButton: View{
    @ObservedObject var expensePageManager: ExpensePageManager
    var body: some View {
        Button {
            expensePageManager.selectedExpenseCategoryLogo = expensePageManager.selectedExpenseCategoryLogo
            expensePageManager.selectedExpenseCategory = expensePageManager.selectedExpenseCategory
            print("Save Button: \(expensePageManager.selectedExpenseCategory)")
            expensePageManager.ExpensePageCategory.toggle()
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
    ExpensePageCategory()
}
