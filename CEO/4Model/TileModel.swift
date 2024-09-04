//
//  TileModel.swift
//  WCWC
//
//  Created by iStart17 on 8/9/20.
//  Copyright © 2020 iStart17. All rights reserved.
//

import Foundation
import UIKit

class TileModel {
    var tile: CGImage? = nil
    var clicked: Bool = false
    
    init(tile: CGImage, clicked:Bool = false) {
        self.tile = tile
        self.clicked = clicked
    }
}
