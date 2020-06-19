//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.updateQuestionNumber()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: updateUI)
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        
        choiceOneButton.backgroundColor = UIColor.clear
        choiceOneButton.setTitle(quizBrain.getChoiceText(0), for: .normal)
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceTwoButton.setTitle(quizBrain.getChoiceText(1), for: .normal)
        choiceThreeButton.backgroundColor = UIColor.clear
        choiceThreeButton.setTitle(quizBrain.getChoiceText(2), for: .normal)
    }
}

