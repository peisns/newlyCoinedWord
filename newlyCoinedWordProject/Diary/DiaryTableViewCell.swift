//
//  DiaryTableViewCell.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit
import SnapKit

class DiaryTableViewCell: UITableViewCell {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title label"
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    var diaryDate: UILabel = {
        let label = UILabel()
        label.text = "1888-12-28"
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()

    var regDate: UILabel = {
        let label = UILabel()
        label.text = "1888-12-28"
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()

    var photoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        return view
    }()
    
    var contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "diary contents"
        label.textColor = .white
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()

    var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        return btn
    }()

    var markButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "star"), for: .normal)
        return btn
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DiaryTableViewCell")
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        [titleLabel, diaryDate, regDate, photoImageView, contentsLabel, likeButton, markButton].forEach {self.contentView.addSubview($0)}
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(self.contentView).inset(16)
        }

        regDate.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.contentView).inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        diaryDate.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.contentView).inset(16)
            make.top.equalTo(regDate.snp.bottom).offset(16)
        }

        photoImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.contentView).inset(16)
            make.height.equalTo(photoImageView.snp.width)
            make.top.equalTo(diaryDate.snp.bottom).offset(16)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.contentView).inset(16)
        }

        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.trailing.equalTo(self.contentView).inset(16)
            make.top.equalTo(contentsLabel.snp.bottom).offset(16)
        }

        markButton.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.trailing.equalTo(likeButton.snp.leading)
            make.top.equalTo(contentsLabel.snp.bottom).offset(16)
        }
    }
}
