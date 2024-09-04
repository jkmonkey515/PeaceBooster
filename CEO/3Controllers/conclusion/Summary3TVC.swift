//
//  Summary3VC.swift
//  CEO
//
//  Created by iStart17 on 1/28/21.
//

import UIKit
import SafariServices

class Summary3TVC: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let uiImgView = UIImageView()
        uiImgView.alpha = 0.5
        uiImgView.contentMode = .scaleAspectFit
        uiImgView.image = UIImage(named: "main_round")
        tableView.backgroundView = uiImgView
    }
    
    @IBAction func onShareAction(_ sender: Any) {
        let items = [URL(string: "https://apps.apple.com/us/app/id1553664312")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @IBAction func onGotoWCWC(_ sender: Any) {
        if let url = URL(string: "https://apps.apple.com/us/app/id1529050773") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onPoint1(_ sender: Any) {
        goBackStep1()
    }
    
    @IBAction func onPoint2(_ sender: Any) {
        goBackStep2()
    }
    
    @IBAction func onPoint3(_ sender: Any) {
        goBackStep3()
    }
    
    @IBAction func onStartOver(_ sender: Any) {
        goBackStartOver()
    }
    
    @IBAction func onDonate(_ sender: Any) {
        gotoDonate()
    }
    
    fileprivate func gotoDonate() {
        if let url = URL(string: "https://vastself.org/donate") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 2:
            return tableView.estimatedRowHeight
        case 7:
            return 75
        default:
            return 50
        }
    }

}
