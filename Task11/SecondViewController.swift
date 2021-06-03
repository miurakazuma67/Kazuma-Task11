//
//  SecondViewController.swift
//  Task11
//
//  Created by 三浦　一真 on 2021/05/27.
//

import UIKit

private let prefectures = [
    "北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
    "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
    "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
    "静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
    "奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
    "徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
    "熊本県","大分県","宮崎県","鹿児島県","沖縄県"
]

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var didSelect: (String) -> Void = { _ in }
    private var didCancel: () -> Void = {}
    
    @IBOutlet private weak var tableView: UITableView!
    
    static func instantiate(didSelect: @escaping (String) -> Void, didCancel: @escaping () -> Void = {}) -> SecondViewController {
        
        let second = UIStoryboard(name: "Second", bundle: nil)
            .instantiateInitialViewController() as! SecondViewController
        
        second.didSelect = didSelect
        second.didCancel = didCancel
        
        return second
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PrefectureTableViewCell.nib, forCellReuseIdentifier: PrefectureTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PrefectureTableViewCell.identifier, for: indexPath) as! PrefectureTableViewCell
        cell.configure(prefectureName: prefectures[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(prefectures[indexPath.row])
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        didCancel()
    }
}


