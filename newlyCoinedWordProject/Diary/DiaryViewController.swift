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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
                
        mainView.tableView.reloadData()
    }
    
    func setNav() {
        
        var navFilterConfig = UIButton.Configuration.plain()
        navFilterConfig.title = "Filter"
        navFilterConfig.baseForegroundColor = .black // tint
        navFilterConfig.background.backgroundColor = .white // background
        let navFilterBtn = UIButton(configuration: navFilterConfig)
        navFilterBtn.addTarget(self, action: #selector(filterBtnClicked), for: .touchUpInside)
        let navFilterBarBtn = UIBarButtonItem(customView: navFilterBtn)
        
        var navDataConfig = UIButton.Configuration.plain()
        navDataConfig.title = "Data"
        navDataConfig.baseForegroundColor = .black // tint
        navDataConfig.background.backgroundColor = .white // background
        let navDataBtn = UIButton(configuration: navDataConfig)
        navDataBtn.addTarget(self, action: #selector(dataButtonClicked), for: .touchUpInside)
        let navDataBarBtn = UIBarButtonItem(customView: navDataBtn)
        
        navigationItem.leftBarButtonItems = [navFilterBarBtn, navDataBarBtn]
        
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

    @objc func filterBtnClicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let newest = UIAlertAction(title: "newest", style: .default) { action in
            self.mainView.diaryTable = self.mainView.localREalm.objects(UserDiary.self).sorted(byKeyPath: "regDate", ascending: true)
            self.mainView.tableView.reloadData()
        }
        let oldest = UIAlertAction(title: "oldest", style: .default) { action in
            self.mainView.diaryTable = self.mainView.localREalm.objects(UserDiary.self).sorted(byKeyPath: "regDate", ascending: false)
            self.mainView.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(newest)
        alert.addAction(oldest)
        alert.addAction(cancel)
        self.present(alert, animated: false)
    }
    
    @objc func dataButtonClicked() {
        let vc = DataViewController()
        present(vc, animated: true)
    }
}
