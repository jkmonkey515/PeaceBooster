//
//  BaseTableViewController.swift
//

import UIKit

class BaseTableViewController: UITableViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // to enable swiping left when back button in navigation bar customized
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isModalInPresentation = true
        navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        hideLoading()
    }
    
    func setTitle(_ title: String) {
        self.navigationItem.title = title
    }

}
