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
    
    @IBAction func thirdButtonPressed() {
        buttons.forEach { $0.isEnabled = false }
    }
}

extension UIButton {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn]) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
            self.transform = .identity
        }
    }
}

extension ViewController: NextViewControllerDelegate {
    func changeButtonState() {
        buttons.forEach { $0.isEnabled = true }
    }
}

