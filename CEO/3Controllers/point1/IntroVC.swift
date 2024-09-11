//
//  IntroVC.swift
//  CEO
//
//  Created by iStart17 on 1/20/21.
//

import UIKit

class IntroVC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "Does this person appear to exist separately from you?",
        "Do you experience this person as someone different from you?",
        "To your senses, the person appears to possess a separate existence from yours. Let's verify if your senses are showing you correctly how she exists \n\nAre you ready?"
    ]
    
    let alertMsg = "Your senses are functioning correctly, indicating a deep understanding and uncorrupted senses.\n Consider that all beings are manifestations of the same universal physical and non-physical elements, without individual ability to generate themselves; thus, everyone is identical and shares a common origin.\n There are no differences between people, except for relative ones, like you, me, short or tall which arise through concepts invented and projected by our minds. This realization is the path to true peace and happiness.\n Since you and this person are without individual existence, any action against this person is equivalent to action against yourself and vice versa.\n You may not need this app, but feel free to use it to understand the situation further."
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        indexOfQuestions = 0
        questionLabel.text = questions[indexOfQuestions]
    }

    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0:
            updateQuestion()
            break
        case 1:
            showAlert(title: Constants.APPNAME, message: getQuestion(alertMsg), positive: R.btnOK, negative: "Discover how humans and animals exist.", positiveAction: { (_) in
                self.navigationController?.popViewController(animated: true)
            }, negativeAction: { (_) in
                self.onGotoWCWC()
            }, completion: nil)
            break
        case 2:
            indexOfQuestions = -1
            updateQuestion()
            break
        default:
            break
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0:
            indexOfQuestions = 1
            updateQuestion()
            break
        case 1:
            updateQuestion()
            break
        case 2:
            gotoNext()
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
        let vc = self.storyboard?.instantiateViewController(identifier: "OrderVC") as! OrderVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onGotoWCWC() {
        if let url = URL(string: "https://apps.apple.com/us/app/id1529050773") {
            UIApplication.shared.open(url)
        }
    }
}
