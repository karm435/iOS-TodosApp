//
//  DateExtenstions.swift
//  ToDoApp
//
//  Created by karmjit singh on 25/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import Foundation

extension Date {
    var ShortDate: String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
