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
    
    public static func removeNotificationRequest(identifier: String){
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    public static func registerNotificationRequest(todo: Todo) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings() { settings in
            guard (settings.authorizationStatus == .authorized) ||
                (settings.authorizationStatus == .provisional) else { return }
            
             let requestId  = UUID().uuidString
            
            let reuest = UNNotificationRequest(identifier: requestId, content: buildTaskTimeNotification(todo: todo), trigger: buildTrigger(todo: todo))
            
            if settings.alertSetting == .enabled {
                notificationCenter.add(reuest) { error in
                    if error != nil {
                        print(error!)
                    }
                }
                //schedule an alert only notification
            } else {
                // schedule a notification with a badge and sound
            }
        }
    }
    
    private static func buildTrigger(todo: Todo) -> some UNNotificationTrigger {
        // for now just bulding Calendar triggerm later we need to build the location triggger
        
        let calendar = Calendar.current
        let reminderAt = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: todo.wrappedDueDate)
        
        //calendar.timeZone = TimeZone(identifier: "UTC")
        
        return UNCalendarNotificationTrigger(dateMatching: reminderAt, repeats: false)
    }
    
    private static func buildTaskTimeNotification(todo: Todo) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "\(todo.taskPriority.rawValue.description) Task due by \(todo.wrappedDueDate.ShortDate)"
        content.body = todo.wrappedTask
        return content
    }
}
