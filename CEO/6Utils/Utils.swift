//
//  Utils.swift
//

import Foundation

func getQuestion(_ str: String) -> String {
    var replaced = str.replacingOccurrences(of: "(--)", with: g_pictureName)
    replaced = replaced.replacingOccurrences(of: "(==)", with: g_userName)
    return replaced
}
