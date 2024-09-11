//
//  Point1VC.swift
//  CEO
//
//  Created by iStart17 on 1/21/21.
//

import UIKit

class Point1VC: BaseViewController {

    @IBOutlet weak var mVerticalLineStackView: UIStackView!
    @IBOutlet weak var mChoppedCollView: UICollectionView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var indexOfQuestions: Int = 0
    let questions: [String] = [
        "Can you see that the person is not one thing but made of parts?",
        "Do you see the green squares indicating the parts?"
    ]
    
    let alertMsg: [String] = [
        "Correct! In Step 1 you’ve recognized that this person is not one entity but a composite of various parts and halves. \n By acknowledging this, you’ve taken the first step towards understanding the true nature of existence.\n Remember, she is not a single entity and this realization sets the foundation for the next steps in discovering the profound sameness and interconnectedness we all share. \n\n Congratulations! You’ve completed Step #1. ",
        "Really? In that case, something is not right with your phone's display, but please keep going.",
        "We understand this is not easy; however, your answer is incorrect."
        ]
    
    let tiles = UIImage(named: g_pictureName)?.divide()
    var imgProcessiongFinishedObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "1. Is she one entity?"
        questionLabel.text = questions[indexOfQuestions]
        
        mChoppedCollView.delegate = self
        mChoppedCollView.dataSource = self
        mChoppedCollView.reloadData()
        
        imgProcessiongFinishedObserver = NotificationCenter.default.addObserver(forName: .processiongFinished, object: nil, queue: .main, using: { (notiCenter) in
            self.mChoppedCollView.isHidden = false
            
            self.showAlert(title: "Notice!", message: "Click on the photo.", positive: R.btnOK, negative: nil)
        })
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShareAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ImgProcessingVC") as! ImgProcessingVC
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onNo(_ sender: Any) {
        if indexOfQuestions == 0 {
            showAlert(title: Constants.APPNAME, message: alertMsg[1], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.updateQuestion()
            }, negativeAction: nil, completion: nil)
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg[2], positive: R.btnOK, negative: nil, positiveAction: { (_) in
                self.goBackStartOver()
            }, negativeAction: nil, completion: nil)
        }
    }
    
    @IBAction func onYes(_ sender: Any) {
        showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnPoint2, negative: nil, positiveAction: { (_) in
            self.gotoNext()
        }, negativeAction: nil, completion: nil)
        /*
        if indexOfQuestions == 0 {
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnPoint2, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
        } else {
            showAlert(title: Constants.APPNAME, message: alertMsg[0], positive: R.btnPoint2, negative: nil, positiveAction: { (_) in
                self.gotoNext()
            }, negativeAction: nil, completion: nil)
        }*/
    }
    
    private func updateQuestion() {
        indexOfQuestions += 1
        questionLabel.text = questions[indexOfQuestions]
    }

    private func gotoNext() {
        let vc = self.storyboard?.instantiateViewController(identifier: "Point2VC") as! Point2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Collection view data source
extension Point1VC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return g_rows * g_cols
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChopCell", for: indexPath as IndexPath) as! ChopCell
        cell.setCell(tile: tiles![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ImgShowVC") as! ImgShowVC
        g_chopImage = tiles![indexPath.row].tile
        tiles![indexPath.row].clicked = !tiles![indexPath.row].clicked
        collectionView.reloadItems(at: [indexPath])
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collWidth = SCREEN_WIDTH
        
        let contentWidth  = collWidth/8
        let contentHeight = contentWidth
        
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
}
