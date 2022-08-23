//
//  ViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let vc = DiaryViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
    
}

