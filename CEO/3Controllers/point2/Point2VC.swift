//
//  Point2VC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class Point2VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "Did she bring herself into existence alone?",
        "Did she produce and assemble her countless parts alone?",
        "Did she produce herself alone without parents or laboratory procedure?"
    ]
    
    let alertMsg: [String] = [
        "Congratulations! Point 2 has revealed that this person did not self-produce because she lacks individual nature of any kind that could; instead this person is a manifestation of the universal nature and its countless and ever-changing physical and non-physical elements.\n Thus, she is not different from you or anybody, and vice versa, as everyone is a product of the same universal nature and not their own.\n This understanding challenges the notion of individual existence and highlights the universal origin and essence we all share.\n By grasping this fact, you’ve paved the way for deeper insights into the nature of existence most people remain unaware of.\nCongratulations! You have completed Step #2!",
        "We understand this is challenging. Please try again.",
        "We understand this is not easy; however, your answer is incorrect."
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "2. Did she self-generate?"
        self.navigationItem.titleView = label
        
        questionLabel.text = questions[indexOfQuestions]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    

    @IBAction func onNo(_ sender: Any) {
        showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg[0]), positive: R.btnPoint3, negative: nil, positiveAction: { (_) in
            self.gotoNext()
        }, negativeAction: nil, completion: nil)
    }

    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0:
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 1:
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 2:
            showAlert(title: Constants.APPNAME, message: alertMsg[2], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.indexOfQuestions = -1
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = questions[indexOfQuestions]
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Point3VC") as! Point3VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
