//
//  Summary2VC.swift
//  CEO
//
//  Created by iStart17 on 1/28/21.
//

import UIKit

class Summary2VC: BaseViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btnPoint1: UIButton!
    @IBOutlet weak var btnPoint2: UIButton!
    @IBOutlet weak var btnPoint3: UIButton!
    @IBOutlet weak var btnStartOver: UIButton!
    @IBOutlet weak var yesNoStackView: UIStackView!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "There is no difference between you two or anybody else. Every living being manifests from the same universal nature, comprising both physical and non-physical elements, rather than originating autonomously. The only difference between anybody exists in concepts only you were, like all things, given for convenience's sake. You discovered this in Step #3.\n\nThese are unbiased facts of how everyone exists without exceptions.\nDo you recognize and understand this?",
        "Only singular things that are not full of their own essence can claim to have their own existence, such entities don't exist, which you discovered after completing Step #1.",
        "Correct. She and you share the same existence; however, your senses cannot perceive this fact correctly. However, by navigating the fundamental aspects of existence, you’ve grasped that you and she share the same origin and essence, devoid of any individual nature. Any distinctions between you two are relative and exist in mere labels only. Understanding the sameness we all share eliminates the basis for conflicts and unhappiness. Recognizing this reality is pivotal, as any conflict between you two or anyone else is fundamentally a conflict against oneself. True peace and happiness await those who comprehend and practice this profound understanding.\nDoes this make sense?",
        "Take a moment to reflect profoundly on each question. Envision the presented information without the influence of preconceived notions to grasp life’s facts and the truth of this conclusion."
    ]
    
    let alertMsg: [String] = [
        "Correct. You use the label of \"person\" only for convenience's sake, thus what you see is not a person but countless and nameless parts. Naming something that is not a person a \"person\" makes sense, and that is what you did.\nCongratulations! You have completed Step #3.",
        "We understand this is not easy. Please try again.",
        "We understand this is not easy. Please repeat Step #1.",
        "We understand this is not easy, but you are almost there. Please don't give up now."
        ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnPoint1.isHidden = true
        btnPoint2.isHidden = true
        btnPoint3.isHidden = false
        btnStartOver.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Here is a summary of what \n you discovered:"
        self.navigationItem.titleView = label
        
        questionLabel.text = questions[indexOfQuestions]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    @IBAction func onYes(_ sender: Any) {
        switch indexOfQuestions {
        case 0: // P9
            self.indexOfQuestions = 1
            self.updateQuestion()
            break
        case 1: // P12
            updateQuestion()
            break
        case 2: // P13
            gotoNext()
            break
        default:
            break
        }
    }
    
    @IBAction func onNo(_ sender: Any) {
        switch indexOfQuestions {
        case 0: // P9
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
            break
        case 1: // P12
            showAlert(title: Constants.APPNAME, message: alertMsg[2], positive: R.btnPoint1, negative: nil, positiveAction: { (_) in
                self.goBackStep1()
            }, negativeAction: nil, completion: nil)
            break
        case 2: // P13
            showAlert(title: Constants.APPNAME, message: alertMsg[3], positive: R.btnOK, negative: nil, positiveAction: { (_) in
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
        
        btnPoint1.isHidden = true
        btnPoint2.isHidden = true
        btnPoint3.isHidden = true
        btnStartOver.isHidden = true
        
        yesNoStackView.isHidden = false
        
        switch indexOfQuestions {
        case 0:
            btnPoint3.isHidden = false
            break
        case 1:
            btnPoint1.isHidden = false
        case 2:
            break
        case 3:
            btnPoint1.isHidden = false
            btnPoint2.isHidden = false
            btnPoint3.isHidden = false
            btnStartOver.isHidden = false
            
            yesNoStackView.isHidden = true
            break
        default:
            break
        }
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary3VC") as! Summary3VC
        self.navigationController?.pushViewController(vc, animated: true)
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

}
