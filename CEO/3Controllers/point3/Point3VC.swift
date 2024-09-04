//
//  Point3VC.swift
//  CEO
//
//  Created by iStart17 on 1/25/21.
//

import UIKit

class Point3VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "Can the body parts exist as a person without your mind\'s label of \"person\"?",
        "If you did not label the body parts a \"person\", would they exist to you as a person?",
        "If the body parts were already a person, would it make sense to label them a \"person\" again?",
        "These body parts existed without any label until the label \"person\" was created and projected by your mind for convenience's sake. This way, everybody can function in concepts as different."
    ]
    
    let alertMsg: [String] = [
        "Correct. In Point 3, you explored the facts of your mind\'s labeling and discovered that the body parts in the photo cannot exist as a person without your mind's label of \"person\".\n This realization extends to your own existence, emphasizing the role of mental labels in shaping perceptions and experiences.\n Please remember, that the label \"person\", or \"she\" is merely a construct of your mind. All labels originate from your mind rather than from the side of any physical forms you are experiencing.\n Recognizing this challenges the notion of separate existences, as human distinctions exist only in labels.\n Reflect on how your experience may contradict this fundamental truth.\nCongratulations! You have completed Step #3.",
        "We understand this is not easy. Please try again."
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "3. Does she need a label?"
        questionLabel.text = questions[indexOfQuestions]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0, 1, 2:
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnConclusion, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
            break
        case 3:
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.moveTo()
            }, negativeAction: nil, completion: nil)
            break
        default:
            break
        }
    }

    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0, 1, 2:
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 3:
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnConclusion, negative: nil, positiveAction: { (_) in
                self.gotoNext()
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

    private func moveTo() {
        let alert = UIAlertController(title: Constants.APPNAME, message: "Incorrect. Please consider reviewing.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Step #3", style: .default, handler: { (_) in
            self.indexOfQuestions = -1
            self.updateQuestion()
        }))
        alert.addAction(UIAlertAction(title: "Step #2", style: .default, handler: { (_) in
            self.goBackStep2()
        }))
        alert.addAction(UIAlertAction(title: "Step #1", style: .default, handler: { (_) in
            self.goBackStep1()
        }))
        alert.addAction(UIAlertAction(title: "Start Over", style: .default, handler: { (_) in
            self.goBackStartOver()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary1VC") as! Summary1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
