//
//  ArtopiaApp.swift
//  Artopia
//
//  Created by Samira Omer on 08/03/2023.
//

import SwiftUI
import Firebase
@main
struct ArtopiaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
//            Content2()
            AuthenticationWithAppleView(showSignInView: .constant(false) )
            
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        print("Configured Firebase")
        return true
    }
}

