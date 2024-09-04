//
//  Constants.swift
//

import UIKit
import SwiftyUserDefaults
import SystemConfiguration

// ---------------------------------------------------------------------------- //
// --------------------------------- App's Macro ------------------------------ //
// ---------------------------------------------------------------------------- //
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height



let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
var isNetAvailable: Bool = false

func getDateFrom(created_at: String) -> String {
    if let space = created_at.firstIndex(of: "T") {
        return String(created_at[...created_at.index(before: space)])
    }
    return getCurrentDate()
}

func getCurrentTimestamp() -> Int64 {
    return Int64(Date().timeIntervalSince1970)
}

func getCurrentDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let strDate = dateFormatter.string(from: date)
    return strDate
}



//MARK: - App Constants
class Constants {
    static let APPNAME = "Peace Booster"
}

class Params {
    static let USER = "user"
}


extension DefaultsKeys {
    var indexOfPrestepQuestions: DefaultsKey<Int?> { .init("indexOfPrestepQuestions", defaultValue: 0) }
    var indexOfStep1Questions: DefaultsKey<Int?> { .init("indexOfStep1Questions", defaultValue: 0) }
    var indexOfStep2Questions: DefaultsKey<Int?> { .init("indexOfStep2Questions", defaultValue: 0) }
    var indexOfStep3Questions: DefaultsKey<Int?> { .init("indexOfStep3Questions", defaultValue: 0) }
    var indexOfSummary: DefaultsKey<Int?> { .init("indexOfSummary", defaultValue: 0) }
    
    var user_given_name:  DefaultsKey<String> { .init("user_given_name", defaultValue: "") }
}

public class Reachability {
    
    // check and return boolean value if phone is connected to internet or not
    class func isConnected() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
