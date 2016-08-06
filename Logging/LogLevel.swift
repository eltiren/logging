//
//  LogLevel.swift
//  Paragraph
//
//  Created by Vitalii Yevtushenko on 8/6/16.
//  Copyright © 2016 Roll'n'Code. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    case verbose
    case warning
    case error

    var prefix: String {
        get {
            switch self {
            case .warning:
                return "Warning"
            case .error:
                return "Error"
            default:
                return ""
            }
        }
    }
}