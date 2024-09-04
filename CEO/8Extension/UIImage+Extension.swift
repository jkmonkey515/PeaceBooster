//
//  UIView+Extension.swift
//

import Foundation
import UIKit
import CoreImage

extension UIImage {
    
    func divide() -> [TileModel] {
        var tiles: [TileModel] = []
        let image = UIImage(named: g_pictureName)?.cgImage
        
        for y in 0..<g_rows {
            for x in 0..<g_cols {
                let tile = image?.cropping(to: CGRect(x: x * (image?.width)!/g_rows, y: y * (image?.height)!/g_rows, width: (image?.width)!/g_rows, height: (image?.height)!/g_rows ))
                let t = TileModel(tile: tile!)
                tiles.append(t)
            }
        }
    
        tiles[5].clicked = true
        tiles[7].clicked = true
        tiles[20].clicked = true
        tiles[28].clicked = true
        tiles[42].clicked = true
        return tiles
    }
}
