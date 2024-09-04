//
//  ChopCell.swift
//  WCWC
//
//  Created by iStart17 on 8/8/20.
//  Copyright © 2020 iStart17. All rights reserved.
//

import UIKit

class ChopCell: UICollectionViewCell {
    
    @IBOutlet weak var mChopImage: UIImageView!
    @IBOutlet weak var mBlurImage: UIImageView!
    
    func setCell(tile: TileModel) {
        mChopImage.image = UIImage(cgImage: tile.tile!)
        if tile.clicked {
            mBlurImage.image = #imageLiteral(resourceName: "red_blur")
        } else {
            mBlurImage.image = nil
        }
    }
}
