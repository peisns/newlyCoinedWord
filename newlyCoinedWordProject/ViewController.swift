//
//  ViewController.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainSearchView: UIView!
    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var exampleButton01: UIButton!
    @IBOutlet weak var exampleButton02: UIButton!
    @IBOutlet weak var exampleButton03: UIButton!
    @IBOutlet weak var exampleButton04: UIButton!
    @IBOutlet var exampleButtonCollection: [UIButton]!
    
    @IBOutlet weak var mainLabelView: UIView!
    @IBOutlet weak var mainLabelViewTopView: UIView!
    
    @IBOutlet weak var mainLabelText: UILabel!
    
    
    var exampleWordsDictionary: Dictionary<String,String> = ["윰차":"윰차뜻입니다", "실매":"실매뜻입니다", "만만잘꾸":"만만잘꾸뜻입니다","킹받으라슈":"킹받드라슈뜻입니다","갓생":"갓생뜻입니다","대유죄":"대유죄뜻입니다"]
    var exampleWordsDictionaryKeys: [String] = []
    var exmapleWordsDictionaryValue: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainSearchView.layer.borderColor = UIColor.black.cgColor
        mainSearchView.layer.borderWidth = 2
        
        for i in exampleButtonCollection {
            i.layer.borderColor = UIColor.black.cgColor
            i.layer.borderWidth = 1
            i.layer.cornerRadius = 7
        }
        
        select4keysAndChangeBtsTitle()
        
        mainLabelView.layer.borderColor = UIColor.black.cgColor
        mainLabelView.layer.borderWidth = 1
        
        mainLabelViewTopView.layer.borderColor = UIColor.black.cgColor
        mainLabelViewTopView.layer.borderWidth = 1
        
//        mainLabelText.text = exampleWordsDictionary[exampleWordsDictionary.keys.randomElement()!]
        mainLabelText.text = "신조어를 검색해보세요, 여기에 뜻이 표시됩니다"

    }
    
    func select4keysAndChangeBtsTitle() {
        var key:String = String()
        exampleWordsDictionaryKeys = []
        while exampleWordsDictionaryKeys.count < 4 {
            key = exampleWordsDictionary.keys.randomElement()!
            if !exampleWordsDictionaryKeys.contains(key) {
                exampleWordsDictionaryKeys.append(key)
            }
        }
        print(exampleWordsDictionaryKeys)
        var exampleWordIndex:Int = 0
        for i in exampleButtonCollection {
            i.setTitle(exampleWordsDictionaryKeys[exampleWordIndex], for: .normal)
            exampleWordIndex += 1
        }
    }

    @IBAction func searchWord(_ sender: Any) {
        let text = userText.text!
        if exampleWordsDictionary["\(text)"] == nil {
            mainLabelText.text = "검색결과가 존재하지 않습니다"
        } else {
            mainLabelText.text = exampleWordsDictionary["\(text)"]
        }
        select4keysAndChangeBtsTitle()
    }
    
    @IBAction func clearKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}

