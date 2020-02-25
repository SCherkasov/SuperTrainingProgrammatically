//
//  AppDelegate.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
//    let vc = LaunchViewController()
//    let navCon = UINavigationController(rootViewController: vc)
//    window?.rootViewController = navCon
    let layer = UICollectionViewFlowLayout()
    let vc = FlagsController(collectionViewLayout: layer)
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    
    FirebaseApp.configure()
    
    return true
  }

  
}

