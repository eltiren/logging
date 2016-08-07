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
    public static var dateFormatter = NSDateFormatter()

    private static func _print(object: Any, scope: String?, level messageLevel: LogLevel, file: String, line: Int) {
        if !enabled || messageLevel.rawValue < level.rawValue {
            return
        }

        var text = ""

        if let scope = scope {
            text += "[\(scope)] "
        }

        text += dateFormatter.stringFromDate(NSDate())
        text += " "

        if level.prefix.characters.count > 0 {
            text += "(\(level.prefix)) "
        }

        text += "\(object)\n"

        debugPrint(text)
    }

    public static func verbose(object: Any, scope: String? = nil, file: String = #file, line: Int = #line) {
        _print(object, scope: scope, level: .verbose, file: file, line: line)
    }

    public static func warning(object: Any, scope: String? = nil, file: String = #file, line: Int = #line) {
        _print(object, scope: scope, level: .warning, file: file, line: line)
    }

    public static func error(object: Any, scope: String? = nil, file: String = #file, line: Int = #line) {
        _print(object, scope: scope, level: .error, file: file, line: line)
    }

}