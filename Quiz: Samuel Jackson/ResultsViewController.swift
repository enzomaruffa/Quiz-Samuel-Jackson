//
//  ResultsViewController.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 10/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var player1name: UILabel!
    @IBOutlet weak var player1points: UILabel!
    @IBOutlet weak var player2name: UILabel!
    @IBOutlet weak var player2points: UILabel!
    @IBOutlet weak var player3name: UILabel!
    @IBOutlet weak var player3points: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let resultsShown = AppData.sharedInstance.results.prefix(3)
        
        if resultsShown.count > 0  {
            player1name.text = resultsShown[0].name
            player1points.text = resultsShown[0].points.description
        }
        
        if resultsShown.count > 1  {
            player2name.text = resultsShown[1].name
            player2points.text = resultsShown[1].points.description
        }
        
        if resultsShown.count > 2  {
            player3name.text = resultsShown[2].name
            player3points.text = resultsShown[2].points.description
        }
    }
    

    @IBAction func resetPress(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
