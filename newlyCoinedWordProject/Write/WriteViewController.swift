//
//  WriteViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

import RealmSwift

class WriteViewController: UIViewController {

    let mainView = WriteView()
    
    let localREalm = try! Realm()
    var diaryTable: Results<UserDiary>!    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        
        mainView.navCon = self.navigationController ?? UINavigationController()
        setNav()
    }
    
    func setNav() {
        var navBtnConfig = UIButton.Configuration.plain()
        var navRightTitle = AttributedString.init("SAVE")
        navRightTitle.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        navBtnConfig.attributedTitle = navRightTitle
        navBtnConfig.baseForegroundColor = .black // tint
        navBtnConfig.background.backgroundColor = .white
        let navBtn = UIButton(configuration: navBtnConfig)
        navBtn.addTarget(self, action:#selector(navSaveBtnClicked) , for: .touchUpInside)
        let navBarBtn = UIBarButtonItem(customView: navBtn)
        self.navigationItem.rightBarButtonItems = [navBarBtn]
    }
    
    @objc func navSaveBtnClicked() {
        let title = mainView.titleTF.text!
        let date = Date()
        let regDate = mainView.datePicker.date
        let contents = mainView.contentsTF.text!
        
        let data = UserDiary(diaryTitle: title, diaryContent: contents, DiaryDate: date, regDate: regDate, photo: mainView.selectedImageURL)
        try! localREalm.write({
            localREalm.add(data)
        })
        
        if let image = mainView.photo.image {
            saveImageToDocument(fileName: "\(data.objectId).jpg", image: image)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
