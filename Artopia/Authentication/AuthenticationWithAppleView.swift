//
//  AuthenticationWithAppleView.swift
//  Artopia
//
//  Created by Samira Omer on 10/04/2023.
//

import SwiftUI
import AuthenticationServices
import CryptoKit

@MainActor
final class AuthenticationViewModel: NSObject,ObservableObject{
    
    private var currentNonce: String?
    @Published var didSignInWithApple: Bool = false
    
    func signInApple() async throws{
        startSignInWithAppleFlow()
        
//        let nonce = randomNonceString()
//        let sha = sha256(nonce)
    }
    
   
    func startSignInWithAppleFlow() {
        
        guard let topVC = Utilities.shared.topViewController() else{
            return
        }
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = topVC
      authorizationController.performRequests()
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }

        
        
}

struct SignInWithAppleResult{
    
    let token: String
    let nonce: String
}

@available(iOS 13.0, *)
extension AuthenticationViewModel: ASAuthorizationControllerDelegate {

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard
            let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
            let appleIDToken = appleIDCredential.identityToken,
            let idTokenString = String(data: appleIDToken, encoding: .utf8),
            let nonce = currentNonce else {
            print ("error")
            return
            
        }
    
        let tokens = SignInWithAppleResult(token: idTokenString, nonce: nonce)
        
        Task{
            do{
                try await AuthenticationManager.shared.signInWithApple(tokens: tokens)
                didSignInWithApple = true
            }catch{
                
            }
        }
    }
      
  

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    print("Sign in with Apple errored: \(error)")
  }

}
//extension AuthenticationViewModel: ASAuthorizationControllerPresentationContextProviding{
//
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return Utilities.shared.topViewController()?.view.window
//    }
//
//}
extension UIViewController: ASAuthorizationControllerPresentationContextProviding{
    
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
}


struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable {
    
    let type: ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton{
        
         ASAuthorizationAppleIDButton(authorizationButtonType: type , authorizationButtonStyle: style)
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context){
        
    }
    
}
struct AuthenticationWithAppleView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        
        
        Button(action: {
            Task{
                do{
                    try await viewModel.signInApple()
//                    showSignInView = false
                }
                catch{
                    print(error)
                }
            }
        }, label: {
            SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                .allowsHitTesting(false)
                
        }).frame(height: 55)
            .onChange(of: viewModel.didSignInWithApple){  newValue in
                if newValue {
                    showSignInView = false
                }
            }

//        SignInWithAppleButton { request in
//
//        } onCompletion: { result in
//
//        }
//        .frame(height: 55)
//        .padding()
//        .navigationTitle("Sign In")
        
    }
}

struct AuthenticationWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationWithAppleView(showSignInView: .constant(false))
    }
}
