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
        let canvasViewController = CanvasViewController()
        
        // Create the window
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = canvasViewController
        window!.makeKeyAndVisible()
        return true
    }



}

