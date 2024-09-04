//
//  BaseViewController.swift
//
//

import UIKit

let g_rows = 8
let g_cols = 8
let g_pictureName: String = "Virus_img"
var g_userName: String = ""

var g_image: UIImage? = nil
var g_chopImage: CGImage? = nil

class BaseViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // to enable swiping left when back button in navigation bar customized
        //self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        //self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.isModalInPresentation = true // to disable closing presented vc
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        hideLoading()
    }
    
    @objc func onShareAction() {
        let items = [URL(string: "https://apps.apple.com/us/app/id1553664312")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}



extension UIViewController {

    func goBackStep1() {
        var viewControllers = self.navigationController?.viewControllers
        viewControllers?.removeAll()
        
        let vc1 = self.storyboard?.instantiateViewController(identifier: "StartVC") as! StartVC
        let vc2 = self.storyboard?.instantiateViewController(identifier: "IntroVC") as! IntroVC
        let vc3 = self.storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        let vc4 = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        let vc5 = self.storyboard?.instantiateViewController(identifier: "Point1VC") as! Point1VC
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    func goBackStep2() {
        var viewControllers = self.navigationController?.viewControllers
        viewControllers?.removeAll()
        
        let vc1 = self.storyboard?.instantiateViewController(identifier: "StartVC") as! StartVC
        let vc2 = self.storyboard?.instantiateViewController(identifier: "IntroVC") as! IntroVC
        let vc3 = self.storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        let vc4 = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        let vc5 = self.storyboard?.instantiateViewController(identifier: "Point1VC") as! Point1VC
        let vc6 = self.storyboard?.instantiateViewController(identifier: "Point2VC") as! Point2VC
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5, vc6]
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    func goBackStep3() {
        var viewControllers = self.navigationController?.viewControllers
        viewControllers?.removeAll()
        
        let vc1 = self.storyboard?.instantiateViewController(identifier: "StartVC") as! StartVC
        let vc2 = self.storyboard?.instantiateViewController(identifier: "IntroVC") as! IntroVC
        let vc3 = self.storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        let vc4 = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        let vc5 = self.storyboard?.instantiateViewController(identifier: "Point1VC") as! Point1VC
        let vc6 = self.storyboard?.instantiateViewController(identifier: "Point2VC") as! Point2VC
        let vc7 = self.storyboard?.instantiateViewController(identifier: "Point3VC") as! Point3VC
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5, vc6, vc7]
        self.navigationController?.setViewControllers(viewControllers!, animated: true)
    }
    
    func goBackStartOver() {
        let vc = self.storyboard?.instantiateViewController(identifier: "StartVC") as! StartVC
        self.navigationController?.viewControllers = [vc]
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    // show alert
    func showAlert(title: String!, message: String!, positive: String?, negative: String?, positiveAction: ((_ positiveAciton: UIAlertAction) -> Void)?, negativeAction: ((_ negativeAction: UIAlertAction) -> Void)?, completion:(() -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if (positive != nil) {
            alert.addAction(UIAlertAction(title: positive, style: .default, handler: positiveAction))
        }
        
        if (negative != nil) {
            alert.addAction(UIAlertAction(title: negative, style: .default, handler: negativeAction))
        }
        
        self.present(alert, animated: true, completion: completion)
    }
    
    func showAlert(title: String!, message: String!, positive: String?, negative: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if (positive != nil) {
            alert.addAction(UIAlertAction(title: positive, style: .default, handler: nil))
        }
        
        if (negative != nil) {
            alert.addAction(UIAlertAction(title: negative, style: .default, handler: nil))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String!) {
        
        let alert = UIAlertController(title: Constants.APPNAME, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showToast(_ message: String) {
        UIView.hr_setToastThemeColor(color: UIColor.primaryColor)
        UIView.hr_setToastFontColor(color: .white)
        self.view.window?.makeToast(message: message, duration: HRToastDefaultDuration, position: HRToastPositionTop as AnyObject)
    }
    
    func showLoading() {
        showLoadingWithMsg("")
    }
    
    func showLoadingWithMsg(_ message: String) {
//        UIView.hr_setToastFontName(fontName: Config.RobotoBold)
        UIView.hr_setToastFontColor(color: .white)
        UIView.hr_setToastThemeColor(color: UIColor.primaryColor)
        
        self.navigationController?.view.makeToastActivity(message: message)
    }
    
    func hideLoading() {
        self.navigationController?.view.hideToastActivity()
    }
}

// MARK: - UIAlertViewController+Extension
extension UIAlertController {
    
    /// Set background color
    func setBackgroundColor(_ color: UIColor) {
        guard let bgView = self.view.subviews.first,
            let groupView = bgView.subviews.first,
            let contentView = groupView.subviews.first else {
                return
        }
        
        contentView.backgroundColor = color
    }
    
    /// Set title font and color
    func setTitle(_ font: UIFont? = nil, color: UIColor? = nil) {
        guard let title = self.title else { return }
        
        let attributedString = NSMutableAttributedString(string: title)
        
        if let titleFont = font {
            attributedString.addAttributes([NSAttributedString.Key.font : titleFont], range: NSMakeRange(0, title.utf8.count))
        }
        
        if let titleColor = color {
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor], range: NSMakeRange(0, title.utf8.count))
        }
        
        self.setValue(attributedString, forKey: "attributedTitle")
    }
    
    /// Set message font and color
    func setMessage(_ font: UIFont? = nil, color: UIColor? = nil) {
        guard let message = self.message else { return }
        
        let attributedString = NSMutableAttributedString(string: message)
        
        if let titleFont = font {
            attributedString.addAttributes([NSAttributedString.Key.font : titleFont], range: NSMakeRange(0, message.utf8.count))
        }
        
        if let titleColor = color {
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor], range: NSMakeRange(0, message.utf8.count))
        }
        
        self.setValue(attributedString, forKey: "attributedMessage")
    }
    
    /// Set tint color of UIAlertViewController
    func setTintColor(_ color: UIColor) {
        self.view.tintColor = color
    }
    
    
}
