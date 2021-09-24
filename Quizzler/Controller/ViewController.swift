//
//  ViewController.swift
//  Quizzler
//
//  Created by Avani Patel on 9/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        //          self.updateUI()
        //        }
        
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswerText()
        firstOptionButton.setTitle(answers[0], for: .normal)
        secondOptionButton.setTitle(answers[1], for: .normal)
        thirdOptionButton.setTitle(answers[2], for: .normal)
        firstOptionButton.backgroundColor = UIColor.clear
        secondOptionButton.backgroundColor = UIColor.clear
        thirdOptionButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
}
