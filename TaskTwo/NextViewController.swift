//
//  NextViewController.swift
//  TaskTwo
//
//  Created by Руслан Шигапов on 06.03.2023.
//

import UIKit

class NextViewController: UIViewController {
    
    var delegate: NextViewControllerDelegate!

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate.changeButtonState()
    }
}
