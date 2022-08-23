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
    }
}
