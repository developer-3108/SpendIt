import SwiftUI

struct FAQsPage: View {
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack{
            BackgroundManager()
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("FAQs")
                            .font(.custom("Poppins-SemiBold", size: 40))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    VStack(spacing: 20) {
                        
                        VStack(alignment: .leading){
                            Text("General")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("1. What is SpendIt?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("SpendIt is an expense tracking app designed to help users manage their finances efficiently. The app provides a seamless way to record your expenses, categorize them, and gain insights into your spending habits. All your data is securely stored on your device, ensuring complete privacy. Additionally, Spend It keeps you informed about the latest financial trends by integrating business news directly into the app.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("2. How is SpendIt different from other expense tracker apps?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("SpendIt prioritizes user privacy by storing all your financial data locally on your device. Unlike other apps that require cloud storage or account creation, SpendIt ensures that your sensitive information never leaves your device. The app also stands out with its user-friendly interface and the ability to display relevant financial news.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("3. Is SpendIt free to use?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Yes, SpendIt is completely free to download and use. All core features, including expense tracking and financial news, are available without any charges. In the future, we may introduce optional premium features or subscriptions to enhance the app further.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text("Features")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("4. How do I add a new expense?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Adding an expense is simple. From the home screen, tap the “+” button to open the expense form. Enter details such as the amount, category, date, and title. Once you save the expense, it will be added to your list of transactions and reflected in your spending summary.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("5. Can I track income as well as expenses?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Yes, SpendIt allows users to track both income and expenses. You can categorize your income sources, such as salary, freelance work, or investments, to get a complete view of your finances.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("6. Can I customize categories in SpendIt?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Currently, SpendIt does not support category customization. However, we understand the importance of personalized tracking and are actively working to introduce this feature in future updates. Stay tuned for more improvements!")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("7. What is the financial news feature?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("The financial news feature fetches the latest business and financial updates from trusted third-party sources. It helps you stay informed about economic trends, stock market updates, and financial tips. This integration is designed to provide value beyond expense tracking by keeping you aware of the global financial landscape.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text("Troubleshooting")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("8. Why is my data not syncing across devices?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("SpendIt is designed with privacy in mind, meaning all your data is stored locally on your device. As a result, there is no cloud syncing feature. If you switch devices, you will need to manually transfer your data.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("9. What should I do if the app crashes?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("If the app crashes, follow these steps:")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• Ensure you are using the latest version of the app. If not, update it from the App Store or GitHub.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• Restart your device and try opening the app again.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• If the issue persists, contact our support team through the “Help” section in the app.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("10. Why am I not seeing the latest financial news?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("The financial news feature relies on a third-party API to fetch updates. If you’re not seeing the latest news:")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• Ensure your device has an active internet connection.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• Check if the API is temporarily down by visiting the news source’s website.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("• Restart the app to refresh the news feed.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text("Privacy & Security")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("11. Is my financial data secure in SpendIt?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Absolutely. Your financial data is securely stored on your device, and SpendIt does not access, share, or store any of your personal information. This design prioritizes your privacy and ensures your data remains safe.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("12. Does SpendIt collect any of my personal data?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("No, SpendIt does not collect or store any personal data. All data input into the app is stored locally on your device and never sent to external servers.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading, spacing: 20){
                            Text("13. Can I back up my data?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("Currently, SpendIt does not have a built-in backup feature. A dedicated backup feature may be introduced in future updates.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            Text("Still Have Questions?")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 20){
                            
                            Text("If your question isn’t listed here, feel free to reach out to us through the “Help & Support” section in the app. We’re here to help!")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                        }.padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    FAQsPage()
}
