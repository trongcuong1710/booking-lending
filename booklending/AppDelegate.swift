//
//  AppDelegate.swift
//  booklending
//
//  Created by Cuong Doan on 2/13/17.
//  Copyright © 2017 Cuong Doan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        var viewController: UIViewController
        
        if let _ = UserRepository().getCurrentUser() {
            viewController = BooksListViewController()
        } else {
            viewController = AuthenticationViewController()
        }
        
        let rootController = RootController(rootViewController: viewController)
        
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        
        self.configGoogleServices()
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
}

extension AppDelegate {
    fileprivate func configGoogleServices() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        
        if let error = configureError {
            print("Configuring google services failed with error: \(error.localizedDescription)")
        }
    }
}

