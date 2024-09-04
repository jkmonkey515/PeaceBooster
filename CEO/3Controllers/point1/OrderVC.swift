//
//  OrderVC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class OrderVC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "To claim different and separate existence from you, she should possess different individual existence; which should be:\n\n1. One. \n2. Self-generated. \n3. Existing as a person without your mind's label of \"person.\"",
                "1. If she is not one, can she be counted as a one being?\n2. If she is a product of everything else, can she be counted as self-produced?\n3. If she existed without the label \"person\", was she a person before you named her \"person\"?"
    ]
    
    let alertMsg = "We understand this is not easy; however, your answer is incorrect."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = questions[indexOfQuestions]
    }
    
    @IBAction func onNo(_ sender: Any) {
        if indexOfQuestions == 0 {
            indexOfQuestions = 1
            questionLabel.text = questions[1]
        } else {
            gotoNext()
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        if indexOfQuestions == 0 {
            gotoNext()
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg, positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.navigationController?.popViewController(animated: true)
            }, negativeAction: nil, completion: nil)
        }
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
