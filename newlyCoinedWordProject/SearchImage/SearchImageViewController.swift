//
//  SearchImageViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/25.
//

import UIKit


class SearchImageViewController: UIViewController {
    
    var writeVC: UIViewController = UIViewController()

    let mainView = SearchImageView()
    
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
        navBtnConfig.title = "SELECT"
        navBtnConfig.baseForegroundColor = .black // tint
        navBtnConfig.background.backgroundColor = .white // background
        let navBtn = UIButton(configuration: navBtnConfig)
        navBtn.addTarget(self, action: #selector(selectButtonClicked), for: .touchUpInside)
        let navBarBtn = UIBarButtonItem(customView: navBtn)
        navigationItem.rightBarButtonItems = [navBarBtn]
    }
    
    @objc func selectButtonClicked() {
        print(#function)
        let index = mainView.selectedPhotoUrl.item
        let selectedImageURL = mainView.urlArray[index]
        NotificationCenter.default.post(name: NSNotification.Name("selectedImageURL"), object: nil, userInfo: ["url": selectedImageURL])
        
        self.navigationController?.popViewController(animated: false)
    }
}


