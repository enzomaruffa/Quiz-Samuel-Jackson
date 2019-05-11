//
//  Question.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 08/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import Foundation

class Question {
    var phrase : String
    var isFromSJ : Bool
    var originalContext : String
    var impressions : Int
    var rightAnswers : Int
    var answered : Bool
    
    init(phrase: String, isFromSJ: Bool, originalContext: String, impressions: Int, rightAnswers: Int, answered: Bool) {
        self.phrase = phrase
        self.isFromSJ = isFromSJ
        self.originalContext = originalContext
        self.impressions = impressions
        self.rightAnswers = rightAnswers
        self.answered = answered
    }
    
    func resetQuestion() {
        answered = false
    }
}
