//
//  ViewController.swift
//  FunFacts
//
//  Created by BoTingDing on 2018/2/25.
//  Copyright © 2018年 丁柏廷. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let factProvider = FactProvider()
    let colorProvider = BackgroundColorProvider()
    
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    @IBOutlet weak var assignmentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = factProvider.randomText()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = factProvider.randomText()
        let randomColor = colorProvider.randomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor
    }
    
}

