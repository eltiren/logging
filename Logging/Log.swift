//
//  Log.swift
//  Paragraph
//
//  Created by Vitalii Yevtushenko on 8/6/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation

public class Log {

    public static var enabled = false
    public static var level = LogLevel.verbose

    private static var startTime: NSDate?
    private static var lastTime: NSDate?

    private static func _print(text: String, level messageLevel: LogLevel) {
        if !enabled || messageLevel.rawValue < level.rawValue {
            return
        }

        let time = NSDate()

        if let theLastTime = lastTime {
            let deltaTimeStr = String(format: "%.03f", time.timeIntervalSinceDate(theLastTime) * 1000.0)
            let absoluteTimeStr = String(format: "%.03f", time.timeIntervalSinceDate(startTime!))
            print("\(absoluteTimeStr) +\(deltaTimeStr) \(messageLevel.prefix): \(text)")
        } else {
            print("0.000 +0.000 \(messageLevel.prefix): \(text)")
            startTime = time
        }

        lastTime = time
    }

    public static func verbose(text: String) {
        _print(text, level: .verbose)
    }

    public static func warning(text: String) {
        _print(text, level: .warning)
    }

    public static func error(text: String) {
        _print(text, level: .error)
    }

}