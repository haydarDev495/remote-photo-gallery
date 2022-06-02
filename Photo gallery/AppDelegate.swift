//
//  AppDelegate.swift
//  Photo gallery
//
//  Created by Haydar Bekmuradov on 25.05.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Gallery", bundle: nil).instantiateInitialViewController() as! GalleryViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

