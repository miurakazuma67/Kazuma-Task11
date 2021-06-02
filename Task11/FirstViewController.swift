//
//  ViewController.swift
//  Task11
//
//  Created by 三浦　一真 on 2021/05/26.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet private weak var changeLabel: UILabel!
    
    @IBAction func enter(_ sender: Any) {
        let second = SecondViewController.instantiate(
            didSelect: { [weak self] in
                self?.changeLabel.text = $0
                self?.dismiss(animated: true)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true)
            }
        )

        let nav = UINavigationController(rootViewController: second)

        present(nav, animated: true)
    }
}
