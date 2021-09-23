//
//  Question.swift
//  Quizzler
//
//  Created by Avani Patel on 9/23/21.
//

import Foundation

struct  Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
