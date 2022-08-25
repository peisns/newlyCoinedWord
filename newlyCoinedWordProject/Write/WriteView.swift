//
//  WriteView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

import SnapKit

class WriteView: UIView {
    
    var navCon : UINavigationController = UINavigationController()
    
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
        picker.maximumDate = .now
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
    
    let imageSearchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("search", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    let imageTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        return tf
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
        self.backgroundColor = .black
        [titleTF, datePicker, selectPhotoButton,takePhotoButton, imageSearchButton, imageTF, photo, contentsTF].forEach {self.addSubview($0)}
        imageSearchButton.addTarget(self, action: #selector(searchImageButtonClicked) , for: .touchUpInside)

    }
    
    func setConstraints() {
        let basicMargin:Int = 16
        
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
            make.width.equalTo(70)
        }
        
        takePhotoButton.snp.makeConstraints { make in
            make.trailing.equalTo(selectPhotoButton.snp.leading).offset(-basicMargin)
            make.top.equalTo(datePicker.snp.bottom).offset(basicMargin)
            make.width.equalTo(70)
        }
        
        imageSearchButton.snp.makeConstraints { make in
            make.trailing.equalTo(takePhotoButton.snp.leading).offset(-basicMargin)
            make.top.equalTo(datePicker.snp.bottom).offset(basicMargin)
            make.width.equalTo(70)
        }
        
        imageTF.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.trailing.equalTo(imageSearchButton.snp.leading).offset(-basicMargin)
            make.top.equalTo(datePicker.snp.bottom).offset(basicMargin)
            make.bottom.equalTo(imageSearchButton.snp.bottom)
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
    
    @objc func searchImageButtonClicked() {
        let vc = SearchImageViewController()
        navCon.pushViewController(vc, animated: true)
        let keyword = imageTF.text!
        vc.mainView.getImage(keyword: keyword)
    }
   

}
