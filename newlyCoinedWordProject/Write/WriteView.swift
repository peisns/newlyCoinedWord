//
//  WriteView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

import SnapKit

class WriteView: UIView {
    
    let titleTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.backgroundColor = .white
        picker.preferredDatePickerStyle = .compact
        return picker
    }()
    
    let selectPhotoButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("select", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    let takePhotoButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("take", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    let photo: UIImageView = {
        let tf = UIImageView()
        tf.backgroundColor = .white
        return tf
    }()
    
    let contentsTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
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
        [titleTF, datePicker, takePhotoButton, selectPhotoButton, photo, contentsTF].forEach {self.addSubview($0)}

    }
    
    func setConstraints() {
        let basicMargin:Int = 16 //basicMargin
        
        titleTF.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(44)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(titleTF.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
        }
        
        selectPhotoButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.top.equalTo(datePicker.snp.bottom).offset(basicMargin)
        }
        
        takePhotoButton.snp.makeConstraints { make in
            make.trailing.equalTo(selectPhotoButton.snp.leading).offset(-basicMargin)
            make.top.equalTo(datePicker.snp.bottom).offset(basicMargin)
        }
        
        photo.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.top.equalTo(selectPhotoButton.snp.bottom).offset(basicMargin)
            make.width.height.equalTo(100)
        }
        contentsTF.snp.makeConstraints { make in
            make.top.equalTo(photo.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(44)
        }
        
        
    }
    
   

}
