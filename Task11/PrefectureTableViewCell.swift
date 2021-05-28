//
//  PrefectureTableViewCell.swift
//  Task11
//
//  Created by 三浦　一真 on 2021/05/27.
//

import UIKit

class PrefectureTableViewCell: UITableViewCell {

    @IBOutlet weak var prefectureLabel: UILabel!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    func configure(prefectureName: String) {
        prefectureLabel.text = prefectureName
    }
}
