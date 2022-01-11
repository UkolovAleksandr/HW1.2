//
//  ViewController.swift
//  HW1.2
//
//  Created by Александр Уколов on 11.01.2022.
//

import UIKit

enum CorrentLight {
    case red, yellow, green
    
}

class ViewController: UIViewController {
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLigt: UIView!
    @IBOutlet var greenLigt: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var correntLight = CorrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        redLight.alpha = lightIsOff
        yellowLigt.alpha = lightIsOff
        greenLigt.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLigt.layer.cornerRadius = redLight.frame.width / 2
        greenLigt.layer.cornerRadius = redLight.frame.width / 2
    }
    
    @IBAction func startButtonPresed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch correntLight {
            case .red:
            greenLigt.alpha = lightIsOff
            redLight.alpha = lightIsOn
            correntLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLigt.alpha = lightIsOn
            correntLight = .green
        case .green:
            greenLigt.alpha = lightIsOn
            yellowLigt.alpha = lightIsOff
            correntLight = .red
        }
    }
}

