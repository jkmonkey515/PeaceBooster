//
//  Summary3VC.swift
//  CEO
//
//  Created by iStart17 on 1/29/21.
//

import UIKit

class Summary3VC: BaseViewController {

    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Here is a summary of what \nyou discovered:"
        self.navigationItem.titleView = label
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
        
        lblDescription.text = "Now you Understand the truth of this conclusion and realize that this person and you lack individual existence as you’re not singular entities with the capacity for self-production.  Instead, both of you are compositions of the same universal nature, comprising of countless physical and non-physical elements, rather than originating autonomously.\n Your origin and essence are identical, and any perceived distinctions do not belong to any individual; they are relative and arise from your mind\'s conceptualizations. \nRecognizing this, any action against her is essentially an action against yourself, and vice versa.\n This insight dispels the misconception of different existences that we erroneously perceive and believe in."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
