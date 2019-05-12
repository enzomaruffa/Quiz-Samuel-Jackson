//
//  EnterNameViewController.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 11/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit

class EnterNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.isEnabled = false

        pointsLabel.textColor = #colorLiteral(red: 1, green: 0.5106488466, blue: 0.002952917945, alpha: 1)
        pointsLabel.layer.shadowColor = #colorLiteral(red: 0.5693798714, green: 0.1380042605, blue: 1, alpha: 1)
        
        nameTextField.delegate = self
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(paintPoints), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        
        // moves view up if keyboards is open
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        pointsLabel.text = AppData.sharedInstance.currentPoints.description
    }
    
    @objc func paintPoints() {
        if pointsLabel.textColor == #colorLiteral(red: 1, green: 0.5106488466, blue: 0.002952917945, alpha: 1) {
            pointsLabel.textColor = #colorLiteral(red: 0.5693798714, green: 0.1380042605, blue: 1, alpha: 1)
            pointsLabel.shadowColor = #colorLiteral(red: 1, green: 0.5106488466, blue: 0.002952917945, alpha: 1)
        } else {
            pointsLabel.textColor = #colorLiteral(red: 1, green: 0.5106488466, blue: 0.002952917945, alpha: 1)
            pointsLabel.shadowColor = #colorLiteral(red: 0.5693798714, green: 0.1380042605, blue: 1, alpha: 1)
        }
    }
    

    @IBAction func finishedName(_ sender: Any) {
        if nameTextField.text!.count > 0 {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        //cadastrar novo resultado
        AppData.sharedInstance.results.append(Result(name: nameTextField.text!, points: AppData.sharedInstance.currentPoints))
        
        AppData.sharedInstance.resetGame()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
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
