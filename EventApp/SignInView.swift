import SwiftUI

struct SignInView: View {
@State private var email = ""
@State private var password = ""
@State private var rememberMe = false

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

VStack(alignment: .leading, spacing: 25) {

Spacer().frame(height: 80)

Text("Sign in")
.font(.largeTitle)
.bold()
.foregroundColor(.white)
.padding(.horizontal, 30)

Group {
VStack(alignment: .leading, spacing: 5) {
Text("Email")
.foregroundColor(.white.opacity(0.8))

TextField("demo@email.com", text: $email)
.padding()
.background(Color.white.opacity(0.15))
.cornerRadius(10)
.foregroundColor(.white)
}

VStack(alignment: .leading, spacing: 5) {
Text("Password")
.foregroundColor(.white.opacity(0.8))

SecureField("Enter your password", text: $password)
.padding()
.background(Color.white.opacity(0.15))
.cornerRadius(10)
.foregroundColor(.white)
}
}
.padding(.horizontal, 30)

// Remember Me + Forgot
HStack {
Toggle("", isOn: $rememberMe)
.labelsHidden()

Text("Remember Me")
.foregroundColor(.white.opacity(0.8))

Spacer()

Button("Forgot Password?") { }
.foregroundColor(.white)
}
.padding(.horizontal, 30)

Spacer()

// Login Button
Button(action: {}) {
Text("Login")
.frame(maxWidth: .infinity)
.padding()
.background(Color.purple)
.foregroundColor(.white)
.cornerRadius(30)
}
.padding(.horizontal, 30)

HStack {
Text("Don’t have an Account?")
.foregroundColor(.white.opacity(0.8))

NavigationLink(destination: SignUpView()) {
Text("Sign up")
.foregroundColor(.white)
}
}
.frame(maxWidth: .infinity)
.padding(.bottom, 40)
}
}
}
}

#Preview {
SignInView()
}
