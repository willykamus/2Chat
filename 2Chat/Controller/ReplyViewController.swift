//
//  ReplyViewController.swift
//  2Chat
//
//  Created by William Ching on 2019-04-15.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController, UITextFieldDelegate {

    var getComment = String()
    var getUsername = String()
    
    var cellid = "CommentCell"
    
    @IBOutlet weak var collectionComment: UICollectionView!
    
    @IBOutlet weak var replyInput: UITextField!
    
    @IBOutlet weak var bottomView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = getUsername
        
        collectionComment.delegate = self

        // Do any additional setup after loading the view.
        
        replyInput.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    func hideKeyboard(){
        
        replyInput.resignFirstResponder()
        
    }
    
    @objc func keyboardWillChange(notification: Notification){
        
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name  == UIResponder.keyboardWillChangeFrameNotification {
            
            bottomView.constant = -keyboardHeight
            
            //view.frame.origin.y = -keyboardHeight
        } else {
            bottomView.constant = 0
            
        }
        
        UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
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
extension ReplyViewController: UICollectionViewDelegate {
    
    
}

extension ReplyViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Estimate size of the text

//        let cell = collectionComment.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CommentCollectionViewCell
//
//        let width = cell.contentView.frame.width + 60

        //let approxWidth = view.frame.width - 100

        let size = CGSize(width: 250, height: 1000)

        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]

        let estimateFrame = NSString(string: getComment).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

        return CGSize(width: view.frame.width, height: estimateFrame.height + 20)

    }
    
    
}

extension ReplyViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionComment.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CommentCollectionViewCell
        
        let size = CGSize(width: 250, height: 1000)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        
        let estimateFrame = NSString(string: getComment).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        
        cell.commentLabel.frame = CGRect(x: 8 + 8, y: 0, width: estimateFrame.width + 8, height: estimateFrame.height + 20)
        cell.containerView.frame = CGRect(x: 8 + 0, y: 0, width: estimateFrame.width + 16 + 8, height: estimateFrame.height + 20)
        
//        cell.contentView.layer.cornerRadius = 12
//        cell.contentView.layer.masksToBounds = false
//        cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
//        cell.layer.masksToBounds = true
        
        cell.containerView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.containerView.layer.cornerRadius = 15
        cell.containerView.layer.masksToBounds = true
        
        cell.commentLabel.text = getComment
        cell.commentLabel.numberOfLines = 0
        
        return cell
        
    }
    
    
}
