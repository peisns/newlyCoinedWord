//
//  DiaryView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/23.
//

import UIKit

import RealmSwift
import SnapKit


class DiaryView: UIView {
    
    let localREalm = try! Realm()
    var diaryTable: Results<UserDiary>!
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.allowsSelection = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        self.backgroundColor = .black
        
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        
        diaryTable = localREalm.objects(UserDiary.self).sorted(byKeyPath: "regDate", ascending: true)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }

}

extension DiaryView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var cell = DiaryTableViewCell()
        cell.titleLabel.text = diaryTable[indexPath.row].diaryTitle
        cell.diaryDate.text = dateFormatter.string(from: diaryTable[indexPath.row].diaryDate)
        cell.regDate.text = dateFormatter.string(from: diaryTable[indexPath.row].regDate)
        cell.contentsLabel.text = diaryTable[indexPath.row].diaryContents

        cell.backgroundColor = .black
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 1.5//UITableView.automaticDimension
    }

    
}
