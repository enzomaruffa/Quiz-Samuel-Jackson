
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
    var questions : [Question]
    
    static var sharedInstance : AppData = AppData()
    
    private init() {
        self.user = User(name: "Enzo", points: 0)
        self.questions = AppData.generateQuestions()
        
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
        return questions
    }
    
}
