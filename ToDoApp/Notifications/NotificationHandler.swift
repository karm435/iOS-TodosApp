//
//  NotificationHandler.swift
//  ToDoApp
//
//  Created by karmjit singh on 15/6/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct NotificationHandler {
    
    public static func askForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print(error)
                //handle the error here
            }
            
            // Enable ot disable the features based on the authorization
        }
    }
    
    private func getNotificationSettingForApp() {
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings() { settings in
            guard (settings.authorizationStatus == .authorized) ||
                (settings.authorizationStatus == .provisional) else { return }
            
            if settings.alertSetting == .enabled {
                //schedule an alert only notification
            } else {
                // schedule a notification with a badge and sound
            }
        }
    }
}
