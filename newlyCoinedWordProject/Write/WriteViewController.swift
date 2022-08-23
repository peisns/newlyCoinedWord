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
        navBtn.addTarget(self, action:#selector(navBtnClicked) , for: .touchUpInside)
        let navBarBtn = UIBarButtonItem(customView: navBtn)
        self.navigationItem.rightBarButtonItems = [navBarBtn]
    }
    
    @objc func navBtnClicked() {
        let title = mainView.titleTF.text!
        let date = Date()
        let regDate = mainView.datePicker.date
        let contents = mainView.contentsTF.text!
        
        let data = UserDiary(diaryTitle: title, diaryContent: contents, DiaryDate: date, regDate: regDate, photo: nil)
        try! localREalm.write({
            localREalm.add(data)
        })
        
        self.navigationController?.popViewController(animated: true)
    }
}
