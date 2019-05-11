//
//  QuestionViewController.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 09/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var phraseLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let audioHelper = AudioHelper()
    
    let hapticNotification = UINotificationFeedbackGenerator()
    
    var normalSamuel = UIImage(named: "samuel-confused")
    var mirroredSamuel = UIImage(named: "samuel-confused-mirrored")
    var mirrored = true
    
    var yes = UIImage(named: "yes1")
    var yesMirrored = UIImage(named: "yes2")
    var isYesMirrored = true
    
    var no = UIImage(named: "no1")
    var noMirrored = UIImage(named: "no2")
    var isNoMirrored = true
    
    var currentQuestion : Question? {
        didSet {
            currentQuestion!.impressions += 1
            presentQuestion()
        }
    }
    
    var answeredQuestions = 0
    var totalQuestions = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewQuestion()
        
        UIView.animate(withDuration: 1) {
            self.backgroundImageView.alpha = 0.3
        }
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [.curveLinear], animations: {
            self.backgroundImageView.transform = CGAffineTransform.identity.scaledBy(x:1.5, y:1.5)
        }) { (_) in }

        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(mirrorButtonYes), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(mirrorButtonNo), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mirrorButtonYes()
        mirrorButtonNo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("disappear")
    }
    
    func mirrorBackground() {
        backgroundImageView.image = mirrored ? normalSamuel : mirroredSamuel
        mirrored = !mirrored
    }
    
    @objc func mirrorButtonYes() {
        let image = isYesMirrored ? yes : yesMirrored
        yesButton.setImage(image, for: .normal)
        isYesMirrored = !isYesMirrored
    }
    
    @objc func mirrorButtonNo() {
        let image = isNoMirrored ? no : noMirrored
        noButton.setImage(image, for: .normal)
        isNoMirrored = !isNoMirrored
    }
    
    
    func getNewQuestion() {
        if let currentQuestion = self.currentQuestion {
            currentQuestion.answered = true
        }
        
        let notAnsweredQuestions = AppData.sharedInstance.questions.filter { $0.answered == false }
        
        print(notAnsweredQuestions.count)
        
        if answeredQuestions < 20 {
            currentQuestion = notAnsweredQuestions.shuffled().first!
            progressBar.progress += 1 / Float(totalQuestions)
        } else {
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    func presentQuestion() {
        phraseLabel.text = "\"" + currentQuestion!.phrase + "\""
        unfadeMovingUp(view: phraseLabel, duration: 1)
        unfadeMovingUp(view: yesButton, duration: 0.2)
        unfadeMovingUp(view: noButton, duration: 0.2)
    }
    
    @IBAction func yesPress(_ sender: Any) {
        if currentQuestion!.isFromSJ {
            answeredRight()
        } else {
            answeredWrong()
        }
        getNewQuestion()
        mirrorBackground()
    }
    
    @IBAction func noPress(_ sender: Any) {
        if !(currentQuestion!.isFromSJ) {
            answeredRight()
        } else {
            answeredWrong()
        }
        getNewQuestion()
        mirrorBackground()
    }
    
    func answeredRight() {
        currentQuestion!.rightAnswers += 1
        AppData.sharedInstance.currentPoints += 1
        
        hapticNotification.notificationOccurred(.success)
        
        audioHelper.playSound(right: true)
        answeredQuestions += 1
        
        flashScreen(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    }
    
    func answeredWrong() {
        hapticNotification.notificationOccurred(.error)
        
        audioHelper.playSound(right: false)
        answeredQuestions += 1
        
        flashScreen(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    }
    
    func flashScreen(color : UIColor) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            self.backgroundView.backgroundColor = color
        }) { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.backgroundView.backgroundColor = .white
            })
        }
    }
    
    func unfadeMovingUp(view : UIView, duration : Double) {
        view.frame.origin.y = view.frame.origin.y + 150
        view.alpha = 0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            view.frame.origin.y = view.frame.origin.y - 150
            view.alpha = 1
        }) { (false) in
            
        }
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
