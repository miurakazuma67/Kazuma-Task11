//
//  ViewController.swift
//  Task11
//
//  Created by 三浦　一真 on 2021/05/26.
//

import UIKit

class FirstViewController: UIViewController {
    
    var selectedPrefectureName: String = "未選択"
    
    @IBOutlet private weak var changeLabel: UILabel!
    
    @IBAction func exitCancel(_ segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func enter(_ sender: Any) {
        let second = storyboard?.instantiateViewController(withIdentifier: "Second") as? SecondViewController
               if let second = second {
                second.closure = {(name: String) -> Void in
                    self.selectedPrefectureName = name
                   }
                   present(second, animated: true, completion: nil)
               }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        change()
    }
    
    func change() {
        self.changeLabel?.text = selectedPrefectureName
    }
}

