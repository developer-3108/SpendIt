import SwiftUI
import Charts

struct UserProfilePage: View {
    var body: some View {
        ZStack {
            BackgroundManager()
            
            Text("This is User Profile Page")
                .font(.custom("Poppins-Regular", size: 20))
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    UserProfilePage()
}
