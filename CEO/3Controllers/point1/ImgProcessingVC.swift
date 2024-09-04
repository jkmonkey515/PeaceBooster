//
//  ImgProcessingVC.swift
//  WCWC
//
//  Created by iStart17 on 8/8/20.
//  Copyright © 2020 iStart17. All rights reserved.
//

import UIKit

class ImgProcessingVC: BaseViewController {

    @IBOutlet weak var mBoxView: UIView!
    @IBOutlet weak var mObjectImageView: UIImageView!
    @IBOutlet weak var mIndicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mObjectImageView.image = UIImage(named: g_pictureName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.mIndicatorView.transform = self.mIndicatorView.transform.translatedBy(x: 0, y: (SCREEN_WIDTH-60))
        }) { (finished) in
            UIView.animate(withDuration: 1.0, animations: {
                self.mIndicatorView.transform = self.mIndicatorView.transform.translatedBy(x: 0, y: -(SCREEN_WIDTH-60))
            }) { (finished) in
                self.mIndicatorView.alpha = 0
                NotificationCenter.default.post(name: .processiongFinished, object: nil, userInfo: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}
