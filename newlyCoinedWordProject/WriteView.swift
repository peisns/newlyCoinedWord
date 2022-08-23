//
//  WriteView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

class WriteView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        backgroundColor = .white
    }
    
    func setConstraints() {
    
    }

}
