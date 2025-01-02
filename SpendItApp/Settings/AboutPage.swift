import SwiftUI

struct AboutPage: View {
    @ObservedObject var backgroundPageManager = BackgroundPageManager()
    var body: some View {
        ZStack {
            BackgroundManager()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack{
                        Text("About SpendIt")
                            .font(.custom("Poppins-SemiBold", size: 40))
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        
                        Text("Welcome to SpendIt, your personal expense tracking application meticulously crafted to simplify and organize your financial management. Whether you are diligently monitoring daily expenses or meticulously planning monthly budgets, SpendIt empowers you to assume control over your financial affairs. We firmly believe that managing finances should be an effortless, secure, and stress-free endeavor. The primary objective of SpendIt is to assist you in achieving financial clarity by diligently tracking your spending patterns, establishing objectives, and gaining valuable insights into your financial habits.")
                            .font(.custom("Poppins-Regular", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        
                    }
                    .padding()
                    .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                    .cornerRadius(20)
                    
                    
                    VStack {
                        VStack {
                            Text("About Me")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 30) {
                            
                            Image("profile_img")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(100)
                                .shadow(radius: 20)
                            
                            
                            Text("Hello there! I’m Akshat Srivastava, the developer of SpendIt and Swiftly Convert, two apps that came from my love for technology and finding solutions to problems. As a Computer Science student and an aspiring iOS developer, I’m always inspired by how apps can make our daily lives easier and more fun.")
                                .font(.custom("Poppins-Regular", size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("SpendIt is all about giving you the power to take control of your money. It’s an easy-to-use app that helps you track your spending and keeps your data safe and private on your device. And Swiftly Convert is another tool I’m proud of - it’s simple, reliable, and makes it easy to convert measurements. You can try that too!")
                                .font(.custom("Poppins-Regular", size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            Text("I’m passionate about creating apps that are easy to use, effective, and meaningful. I’m always learning and innovating, and I’m committed to making my skills even better so I can create even better experiences for users. Thanks for supporting my work, and I hope my apps make your daily life a little easier and more organized!")
                                .font(.custom("Poppins-Regular", size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black : Color.white)
                            
                            HStack{
                                Link(destination: URL(string: "https://www.linkedin.com/in/akshat-srivastava07/")!) {
                                    Image("linkedin")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Link(destination: URL(string: "https://github.com/developer-3108")!) {
                                    Image("github-sign")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Link(destination: URL(string: "https://x.com/developer_3108")!) {
                                    Image("twitter")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Link(destination: URL(string: "https://www.threads.net/@developer_3108")!) {
                                    Image("threads")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(20)
                            
                        }
                        .padding()
                        .background(backgroundPageManager.isDarkMode == false ? Color.white.opacity(0.4) : Color.black.opacity(0.4))
                        .cornerRadius(20)
                    }
                    
                    Text("Version 1.0.0")
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundStyle(backgroundPageManager.isDarkMode == false ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                    
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    AboutPage()
}
