//
//  NotificationHandler.swift
//  ToDoApp
//
//  Created by karmjit singh on 15/6/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI
import UserNotifications

struct NotificationHandler {
    
    public static func askForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print(error)
                //handle the error here
            }
            else {
                // Enable ot disable the features based on the authorization
                print("Success")
            }
            
        }
    }
    
    public static func removeNotificationRequest(for identifier: UUID){
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier.uuidString])
    }
    
    public static func registerNotificationRequest(for todo: Todo) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings() { settings in
            guard (settings.authorizationStatus == .authorized) ||
                (settings.authorizationStatus == .provisional) else { return }
            
            let requestId  = todo.id!.uuidString
            
            let reuest = UNNotificationRequest(identifier: requestId, content: buildTaskTimeNotification(todo: todo), trigger: buildTrigger(todo: todo))
            
            
            print("scheduling alert")
            notificationCenter.add(reuest) { error in
                if error != nil {
                    print(error!)
                }
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
        content.title = "\(todo.taskPriority.name) is due now"
        content.body = todo.wrappedTask
        content.sound = UNNotificationSound.default
        return content
    }
}
