//
//  DataView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/25.
//

import UIKit

class DataView: UIView {
    
    let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("SAVE DATA", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    let loadButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOAD DATA", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .red
        return btn
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
        self.backgroundColor = .white
        [saveButton, loadButton].forEach { self.addSubview($0)}
        saveButton.addTarget(self, action: #selector(saveButtonClicked) , for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(loadButtonClicked) , for: .touchUpInside)
    }
    
    func setConstraints() {
        let basicMargin:Int = 16 //basicMargin

        saveButton.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(60)
        }
        
        loadButton.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(60)
        }
    }
    
    @objc func saveButtonClicked() {
        print(#function)
    }
    
    @objc func loadButtonClicked() {
        print(#function)
    }
}
