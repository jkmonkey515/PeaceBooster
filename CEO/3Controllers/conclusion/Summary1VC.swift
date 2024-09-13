//
//  Summary1VC.swift
//  CEO
//
//  Created by iStart17 on 1/27/21.
//

import UIKit

class Summary1VC: BaseViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "In the beginning, you said that the person appears to exist separately from you.",
        "You recognized that to claim a true individual existence she and you need to be two different existences, thus each of you has to be::\n1. one entity. \n2. self-generated. \n3. existing as different independently of your mind\'s labels.\n\nHowever, you completed all 3 steps and found the opposite to be true about both of you.",
        "You discovered that this person is:\n1. not one entity.\n2. unable to self-produce.\n3. Needs your mind\'s label to exist as different.",
        "Conclusion: it appears to your mind that she and you are two different existences, but when examined, nobody does.\n This proves that your senses are lying to you because she and you appear to possess individual existence, but that is not true.",
        "Since you both share the same existence, what is the difference between you two?"
    ]
    
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
        if indexOfQuestions == questions.count-1 {
            gotoNext()
        } else {
            updateQuestion()
        }
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = questions[indexOfQuestions]
    }
    
    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Summary2VC") as! Summary2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
