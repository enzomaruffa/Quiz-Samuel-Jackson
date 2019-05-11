
//
//  AppData.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 08/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import Foundation

class AppData {
    
    var user : User
    var questions : [Question] = AppData.generateQuestions()
    
    static var sharedInstance : AppData = AppData()
    
    private init() {
        self.user = User(name: "", points: 0)
    }
    
    func resetQuestions() {
        questions.map { $0.resetQuestion() }
    }
    
    static func generateQuestions() -> [Question] {
        var questions : [Question] = []
        questions.append(
            Question(phrase: "English, motherf*cker, do you speak it?",
                     isFromSJ: true,
                     originalContext: "From Pulp Fiction, this is one of SJs most iconic phrases!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "I'll make him an offer he can't refuse",
                     isFromSJ: false,
                     originalContext: "The Godfather!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "I'll be back",
                     isFromSJ: false,
                     originalContext: "Terminator!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Bond, James Bond",
                     isFromSJ: false,
                     originalContext: "Pretty obvious, right?",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "You're gonna need a bigger boat",
                     isFromSJ: false,
                     originalContext: "JAWS!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Enough is enough! I've had it with these motherf*ckin' snakes on this motherf*ckin plane!",
                     isFromSJ: true,
                     originalContext: "Snakes on a Plane seems savage af",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "And you will know I am the Lord when I lay My vengeance upon thee",
                     isFromSJ: true,
                     originalContext: "Also from Pulp Fiction, this is one of SJs most iconic phrases!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        return questions.shuffled()
    }
    
}
