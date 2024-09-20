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
        "To claim different and separate existence from yours, she must have an individual existence that is::\n\n1. One. \n2. Self-generated. \n3. Existing as a person independently of your mind's label of \"person.\"",
        "1. If she is not one entity, she cannot be regarded as one. If she is not one, there can't be a second or third entity,etc.\n2. If she is a product of everything else and their essence, she does not have an individual essence.\n3. The body and mind can exist without the label 'person'; they only became a person when you applied that label and believed it."
    ]
    
    let alertMsg = "We understand this is not easy; however, your answer is incorrect."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = questions[indexOfQuestions]
    }
    
    @IBAction func onNo(_ sender: Any) {
        if indexOfQuestions == 0 {
            gotoNext()
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg, positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.navigationController?.popViewController(animated: true)
            }, negativeAction: nil, completion: nil)
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        if indexOfQuestions == 0 {
            indexOfQuestions = 1
            questionLabel.text = questions[1]
        } else {
            gotoNext()
        }
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "ToNumber1VC") as! ToNumber1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
