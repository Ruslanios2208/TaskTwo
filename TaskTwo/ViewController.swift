//
//  ViewController.swift
//  TaskTwo
//
//  Created by Руслан Шигапов on 04.03.2023.
//

import UIKit

protocol NextViewControllerDelegate {
    func changeButtonState()
}

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? NextViewController else { return }
        nextVC.delegate = self
    }
        
    private func setup() {
        for button in buttons {
            button.layer.cornerRadius = 7
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(
                top: 10, leading: 14, bottom: 10, trailing: 14
            )
            button.configurationUpdateHandler = { button in
                switch button.state {
                case .disabled:
                    button.backgroundColor = .gray
                default:
                    button.backgroundColor = .link
                }
            }
        }
    }
    
    @IBAction func anyButtonPressed(_ sender: UIButton) {
        sender.pulsate()
    }
    
    @IBAction func thirdButtonPressed() {
        buttons.forEach { $0.isEnabled = false }
    }
}

extension UIButton {
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.9
        pulse.toValue = 1
        pulse.initialVelocity = 0.5

        layer.add(pulse, forKey: nil)
    }
}

extension ViewController: NextViewControllerDelegate {
    func changeButtonState() {
        buttons.forEach { $0.isEnabled = true }
    }
}

