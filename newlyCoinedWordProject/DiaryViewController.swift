//
//  DiaryViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/23.
//

import UIKit

class DiaryViewController: UIViewController {

    let mainView = DiaryView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
    }
    
    func setNav() {
        
        var navBtnConfig = UIButton.Configuration.plain()
        navBtnConfig.title = "WRITE"
        navBtnConfig.image = UIImage(systemName: "square.and.pencil")
        navBtnConfig.baseForegroundColor = .black // tint
        navBtnConfig.background.backgroundColor = .white // background
        navBtnConfig.imagePlacement = .trailing
        let navBtn = UIButton(configuration: navBtnConfig)
        navBtn.addTarget(self, action: #selector(writeBtnCilcked), for: .touchUpInside)
        let navBarBtn = UIBarButtonItem(customView: navBtn)
        navigationItem.rightBarButtonItems = [navBarBtn]
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.shadowColor = .clear // underline color
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] // title color
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    @objc func writeBtnCilcked() {
        let vc = WriteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
