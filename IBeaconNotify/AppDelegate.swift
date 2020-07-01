//
//  AppDelegate.swift
//  IBeaconNotify
//
//  Created by cntt37 on 6/18/20.
//  Copyright © 2020 hcmute.edu.vn. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let locationManager=CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        locationManager.delegate=self
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]){(granted,error) in}
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate:CLLocationManagerDelegate{
    

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            notify(beacons[0].proximity)
        }
    }
    func notify(_ distance: CLProximity){
        print("immediate")
        switch distance {
        case .immediate:
            let content = UNMutableNotificationContent()
            content.title = "Forget Me Not"
            content.body = "Are you forgetting something?"
            content.sound = .default
              
            let request = UNNotificationRequest(identifier: "IBeaconNotify", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            return
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
      guard region is CLBeaconRegion else {
        print("didExitRegion return")
        return
        }

      let content = UNMutableNotificationContent()
      content.title = "Forget Me Not"
      content.body = "Are you forgetting something?"
      content.sound = .default
        
      let request = UNNotificationRequest(identifier: "IBeaconNotify", content: content, trigger: nil)
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        print("didDetermineState")
        if(state == CLRegionState.inside){
            let content = UNMutableNotificationContent()
            content.title = "IBeacon Notify"
            content.body = "Thong bao Ibeacon"
            content.sound = .defaultCritical
            
            let request=UNNotificationRequest(identifier: "IBeaconNotify", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
        }
    }
}

