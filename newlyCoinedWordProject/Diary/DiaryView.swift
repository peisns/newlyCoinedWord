//
//  DiaryView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/23.
//

import UIKit

import RealmSwift
import SnapKit
import Network


class DiaryView: UIView {
    
    let localREalm = try! Realm()
    var diaryTable: Results<UserDiary>!
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.allowsSelection = false
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
        return diaryTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
                
        let cell = DiaryTableViewCell()
        cell.titleLabel.text = diaryTable[indexPath.row].diaryTitle
        cell.diaryDate.text = dateFormatter.string(from: diaryTable[indexPath.row].diaryDate)
        cell.regDate.text = dateFormatter.string(from: diaryTable[indexPath.row].regDate)
        cell.contentsLabel.text = diaryTable[indexPath.row].diaryContents
        let likeIcon = diaryTable[indexPath.row].like == true ? "heart.fill" : "heart"
        cell.likeButton.setImage(UIImage(systemName: likeIcon), for: .normal)
        cell.sendLikeIndex = {
            try! self.localREalm.write({
                self.diaryTable[indexPath.row].like = !self.diaryTable[indexPath.row].like
            })
            tableView.reloadData()
        }
        let markIcon = diaryTable[indexPath.row].favorite == true ? "star.fill" : "star"
        cell.markButton.setImage(UIImage(systemName: markIcon), for: .normal)
        cell.sendMarkIndex = {
            try! self.localREalm.write({
                self.diaryTable[indexPath.row].favorite = !self.diaryTable[indexPath.row].favorite
            })
            tableView.reloadData()
        }

        cell.backgroundColor = .black
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UIScreen.main.bounds.width * 1.5
        return height //UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "delete") { action, view, handler in
            try! self.localREalm.write({
                self.localREalm.delete(self.diaryTable[indexPath.row])
            })
            tableView.reloadData()
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }

    
}
