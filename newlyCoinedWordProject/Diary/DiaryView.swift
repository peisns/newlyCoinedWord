//
//  DiaryView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/23.
//

import UIKit
import SnapKit

class DiaryView: UIView {
    
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
        let cell = DiaryTableViewCell()
        cell.backgroundColor = .black
//        tableView.estimatedRowHeight = 44.0
//        tableView.rowHeight = UITableView.automaticDimension
        return cell
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        let tableViewBasicHeight: CGFloat = UIScreen.main.bounds.width * 1.2
//        return tableViewBasicHeight
//    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 1.5//UITableView.automaticDimension
    }

    
}
