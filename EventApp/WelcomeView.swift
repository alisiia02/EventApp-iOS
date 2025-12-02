import SwiftUI

struct WelcomeView: View {
 var body: some View {
 ZStack {
 LinearGradient(
 gradient: Gradient(colors: [
 Color(red: 0.45, green: 0.20, blue: 0.85),
 Color(red: 0.95, green: 0.75, blue: 0.90)
 ]),
 startPoint: .top,
 endPoint: .bottom
 )
 .ignoresSafeArea()

 VStack {
 Image("partyIllustrationjpeg")
 .resizable()
 .scaledToFit()
 .frame(height: 350)

 Spacer().frame(height: 20)

 VStack(alignment: .leading, spacing: 10) {
 Text("Welcome")
 .font(.largeTitle)
 .bold()
 .foregroundColor(.white)

 Text("Event App\nblablabla description bla bla..")
 .foregroundColor(.white.opacity(0.8))
 .font(.body)
 }
 .padding(.horizontal, 30)

 Spacer()

 HStack {
 Spacer()
 
 // Navigate to Sign In
 NavigationLink(destination: SignInView()) {
 HStack {
 Text("Continue")
 Image(systemName: "arrow.right")
 }
 .padding()
 .background(Color.purple)
 .foregroundColor(.white)
 .cornerRadius(30)
 }
 }
 .padding(.horizontal, 30)
 .padding(.bottom, 40)
 }
 }
 }
}

#Preview {
 WelcomeView()
}
