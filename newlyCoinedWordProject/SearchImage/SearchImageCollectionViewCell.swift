//
//  SearchImageCollectionViewCell.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/25.
//

import UIKit
import SnapKit

class SearchImageCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let view = UIImageView()
        view.backgroundColor = .systemGray6
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
        self.contentView.addSubview(imageView)
    }
    
    func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
    }

}
