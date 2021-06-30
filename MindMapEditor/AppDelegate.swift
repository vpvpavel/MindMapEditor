//
//  AppDelegate.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create canvas view controller
//        let canvasViewController = CanvasViewController()

//        // Create the window
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window!.rootViewController = canvasViewController
//        window!.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }


}

