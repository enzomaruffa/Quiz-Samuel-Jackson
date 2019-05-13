//
//  MenuViewController.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 09/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuBackgroundImageView: UIImageView!
    
    @IBOutlet weak var headerContainer: UIView!
    
    var normalSamuel = UIImage(named: "samuel-confused")
    var mirroredSamuel = UIImage(named: "samuel-confused-mirrored")
    var mirrored = true
    var timer : Timer?
    
    let audioHelper = AudioHelper.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mirrorBackground()
        
        createParticles()
    }
    
    @IBAction func playPress(_ sender: Any) {
        audioHelper.playNameSound()
    }
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        let cell = CAEmitterCell()
        cell.birthRate = 2
        cell.lifetime = 5.0
        cell.velocity = 85
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.35
        cell.scaleRange = 0.10
        cell.color = UIColor(white: 1, alpha: 0.3).cgColor
        cell.alphaSpeed = -0.025
        cell.contents = UIImage(named: "samuel-smiling")?.cgImage
        particleEmitter.emitterCells = [cell]
        
        headerContainer.layer.addSublayer(particleEmitter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mirrorBackground()
        AppData.sharedInstance.resetGame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @objc func mirrorBackground() {
        menuBackgroundImageView.image = mirrored ? normalSamuel : mirroredSamuel
        mirrored = !mirrored
        timer = Timer.scheduledTimer(timeInterval: Double.random(in: 0.5...1.5), target: self, selector: #selector(mirrorBackground), userInfo: nil, repeats: false)
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
