import SwiftUI

struct TermsAndConditionPage: View {
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack{
            BackgroundManager()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(alignment: .leading){
                        Text("Terms & Conditions")
                            .font(.custom("Poppins-SemiBold", size: 40))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 10) {
                        VStack(alignment: .leading){
                            HStack{
                                Text("Effective Date:")
                                    .font(.custom("Poppins-Medium", size: 15))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("December 31, 2024")
                                    .font(.custom("Poppins-Regular", size: 15))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading){
                            Text("Welcome to SpendIt, an expense tracking application designed to assist you in managing your finances effectively and conveniently. By downloading or utilizing SpendIt, you acknowledge your compliance with the terms outlined below. These Terms and Conditions govern your usage of the application and establish a transparent understanding of its functionality and user expectations. Kindly review them thoroughly before commencing your app usage.")
                                .font(.custom("Poppins-Regular", size: 17))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                        .cornerRadius(20)
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("User Data and Policy")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("At SpendIt, your privacy is of paramount importance. All data entered into the application, including financial transactions, budgets, and any personal information, is securely stored exclusively on your device. This ensures that we do not collect, process, or transmit your data to external servers or third-party services.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("By utilizing the application, you acknowledge sole responsibility for safeguarding and securing your data. SpendIt does not offer cloud backup services; therefore, any data loss resulting from device malfunction, app uninstallation, or any other unforeseen circumstances is beyond our recoverability. It is strongly advised that you periodically back up your data using external methods as a precautionary measure.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("We adhere strictly to a policy prohibiting the collection of personal data, including financial information and tracking of user activities within the application.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Third-Party Financial News API Usage")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("The application incorporates a feature that retrieves financial news from a third-party API provider. This functionality is designed to furnish users with contemporary information on financial markets, investment prospects, and economic developments.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Although we cannot guarantee the accuracy, reliability, or completeness of the information provided through this feature, as it is sourced externally, the content fetched by the API is subject to the terms, conditions, and privacy policies of the respective third-party provider.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("It is crucial to recognize that any decisions or actions you make based on the news provided by this feature are solely your responsibility. SpendIt does not provide financial advice or assume any liability for financial losses, missed opportunities, or any consequences resulting from reliance on this information. We strongly recommend that users independently verify the news before making decisions that could potentially impact their finances.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Prohibited Activities")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("When utilizing the SpendIt application, users are expected to exercise responsible and ethical behavior. The following activities are expressly prohibited:")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("1.) Unauthorized access to the app’s functionality, including attempting to reverse engineer, modify, or tamper with its code or features, constitutes a violation of intellectual property laws and these terms.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("2.) Utilizing the application for unlawful activities, including fraudulent transactions, data manipulation, or financial impropriety is strictly prohibited. Spend It is exclusively designed for lawful financial tracking and planning purposes.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("3.) Unauthorized sharing or distribution of the application’s proprietary materials, such as its interface, branding, or any portion of its intellectual property, without obtaining prior written consent from the developer is prohibited.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("4.) Misusing the application’s features in any manner that could compromise its functionality, infringe upon the rights of others, or violate local regulations.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Violations of these regulations may result in the immediate cessation of access to the application without prior notification.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Storage and Backup Responsibilities")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("As all user data is stored locally on the user’s device, SpendIt does not provide built-in cloud synchronization or remote backup capabilities. Users are strongly advised to implement their own measures to safeguard and preserve their data.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("This can encompass manually exporting data to external storage or utilizing third-party tools for device backups. In the unfortunate event of data loss due to device malfunction, app deletion, or reinstallation, the app developers assume no responsibility for any inability to recover lost information.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Financial News Content Disclaimer")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("The financial news section of SpendIt is provided as a convenience to users who wish to stay informed about developments in the financial world. The content displayed is sourced through a trusted third-party API provider and is not created, reviewed, or endorsed by the developers of SpendIt.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Users are advised to exercise caution when interpreting the information provided and seek professional guidance before making any financial decisions based on the news. The app developers are not liable for inaccuracies, outdated information, or any financial losses that may occur due to reliance on the news content.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("App Updates and Modifications")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("“SpendIt” is meticulously designed to undergo continuous evolution, ensuring its enduring user-friendliness, security, and alignment with contemporary technological advancements. Regular updates and modifications may be released to optimize the app’s performance, rectify any identified bugs, and introduce novel features.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Upon the release of an update, users are strongly advised to install it promptly to ensure optimal app functionality. Failure to update the app may lead to diminished functionality or incompatibility with newer devices or operating systems. By continuing to utilize the app after an update, users acknowledge and accept the terms of the revised version.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Please be advised that while we strive to enhance our offerings, certain updates may necessitate user adjustments to settings, reconfiguration of preferences, or the temporary suspension of specific functionalities that are no longer supported.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Intellectual Property Rights")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("All components of SpendIt, including its name, logo, design, interface, and underlying code, are the intellectual property of the app developer. These elements are protected by copyright and trademark laws, and any unauthorized use or reproduction of these assets is strictly prohibited.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Users are granted a non-exclusive, non-transferable license to utilize the application for personal, non-commercial purposes. Any attempt to replicate, modify, or distribute the application without explicit authorization constitutes a violation of intellectual property rights.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Limitation of Liability")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("“SpendIt” is provided on an “as-is” and “as-available” basis. While we endeavor to provide a reliable and user-friendly experience, we do not guarantee that the application will be free of errors, interruptions, or vulnerabilities.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("The developers bear no liability for any damages, including financial losses, data corruption, or device malfunctions, arising from the use or inability to use the application. Users are strongly advised to exercise caution and take appropriate measures, such as regular data backups and independent verification of financial news.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Termination of Use")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("We retain the sole discretion to suspend or terminate a user’s access to Spend It at our discretion, should these Terms and Conditions be breached. In such instances, the application may become inaccessible, potentially resulting in the loss of any locally stored data.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                Text("Users may choose to discontinue their app usage at any time by uninstalling it from their devices. However, it is the user’s responsibility to back up their data prior to uninstalling, as it cannot be recovered once the app is deleted.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Contact Information")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 20){
                                Text("If you have any questions, concerns, or feedback regarding these Terms and Conditions or the functionality of SpendIt, please do not hesitate to contact us at:")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                                HStack {
                                    Text("Email:")
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                    
                                    Text("developer.akshat310804@gmail.com")
                                        .font(.custom("Poppins-Regular", size: 15))
                                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                }
                                
                                Text("We highly value your input and are committed to promptly and effectively addressing any concerns you may have.")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    TermsAndConditionPage()
}
