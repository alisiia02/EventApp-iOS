import SwiftUI

struct SignUpView: View {
@State private var email = ""
@State private var phone = ""
@State private var password = ""
@State private var confirmPassword = ""

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

Text("Sign up")
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
Text("Phone no")
.foregroundColor(.white.opacity(0.8))

TextField("+00 000-000-000", text: $phone)
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

VStack(alignment: .leading, spacing: 5) {
Text("Confirm Password")
.foregroundColor(.white.opacity(0.8))

SecureField("Confirm your password", text: $confirmPassword)
.padding()
.background(Color.white.opacity(0.15))
.cornerRadius(10)
.foregroundColor(.white)
}
}
.padding(.horizontal, 30)

Spacer()

// Create Account Button
Button(action: {}) {
Text("Create Account")
.frame(maxWidth: .infinity)
.padding()
.background(Color.purple)
.foregroundColor(.white)
.cornerRadius(30)
}
.padding(.horizontal, 30)

// Go back to login
HStack {
Text("Already have an Account?")
.foregroundColor(.white.opacity(0.8))

NavigationLink(destination: SignInView()) {
Text("Login")
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
SignUpView()
}
