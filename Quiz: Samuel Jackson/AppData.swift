
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
        
        questions.append(
            Question(phrase: "Hamburgers! The cornerstone of any nutritious breakfast",
                     isFromSJ: true,
                     originalContext: "Also from Pulp Fiction, this is one of SJs most iconic phrases!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "I'm as serious as a heart attack.",
                     isFromSJ: true,
                     originalContext: "Jackie Brown!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Mankind is the virus, and I'm the cure.",
                     isFromSJ: true,
                     originalContext: "Kingsman!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Yeah, Zeus! As in, father of Apollo? Mount Olympus? Don't f**k with me or I'll shove a lightning bolt up your a**!",
                     isFromSJ: true,
                     originalContext: "He indeed says some bad words. Die Hard With a Vengeance!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Frankly, my dear, I don't give a damn.",
                     isFromSJ: false,
                     originalContext: "Gone With the Wind!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Houston, we have a problem",
                     isFromSJ: false,
                     originalContext: "Apollo 13!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "Yippie-ki-yay, mother f**ker!",
                     isFromSJ: false,
                     originalContext: "Die Hard!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        
        questions.append(
            Question(phrase: "I love the smell of napalm in the morning.",
                     isFromSJ: false,
                     originalContext: "Apocalypse Now!",
                     impressions: 0,
                     rightAnswers: 0,
                     answered: false))
        return questions.shuffled()
    }
    
}
