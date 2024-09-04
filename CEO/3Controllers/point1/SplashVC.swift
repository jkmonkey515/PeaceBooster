//
//  SplashVC.swift
//  CEO
//
//  Created by iStart17 on 2/20/21.
//

import UIKit

class SplashVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
            let vc = self.storyboard?.instantiateViewController(identifier: "StartNav") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        }
    }
    

}
