//
//  WriteViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

class WriteViewController: UIViewController {

    let mainView = WriteView()
    
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
        let navBarBtn = UIBarButtonItem(customView: navBtn)
        self.navigationItem.rightBarButtonItems = [navBarBtn]
    }
}
