//
//  Result.swift
//  Quiz: Samuel Jackson
//
//  Created by Enzo Maruffa Moreira on 11/05/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import Foundation

class Result : Comparable {
    static func < (lhs: Result, rhs: Result) -> Bool {
        if lhs.points < rhs.points {
            return true
        }
        return false
    }
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        if lhs.name == rhs.name && lhs.points == rhs.points
        {
            return true
        }
        return false
    }
    
    var name : String
    var points : Int

    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
    
    
}
