//
//  SearchImageView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/25.
//

import UIKit

import Alamofire
import SnapKit
import SwiftyJSON
import Kingfisher

class SearchImageView: UIView {
    
    var urlArray:[String] = []
    var selectedPhotoUrl: IndexPath = IndexPath()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/2, height: (UIScreen.main.bounds.width - 32)/2)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .yellow
        return view
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
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchImageCollectionViewCell.self, forCellWithReuseIdentifier: "SearchImageCollectionViewCell")
        collectionView.allowsMultipleSelection = false
        collectionView.allowsSelection = true //this is set by default

    }
    
    func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

extension SearchImageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchImageCollectionViewCell", for: indexPath) as! SearchImageCollectionViewCell
        cell.backgroundColor = .blue
        cell.imageView.kf.setImage(with: URL(string: urlArray[indexPath.item]))
        
        var borderColor = UIColor.clear.cgColor
            var borderWidth: CGFloat = 0

            if indexPath == selectedPhotoUrl{
                borderColor = UIColor.brown.cgColor
                borderWidth = 5 //or whatever you please
            }else{
               borderColor = UIColor.clear.cgColor
                borderWidth = 0
            }

            cell.imageView.layer.borderWidth = borderWidth
            cell.imageView.layer.borderColor = borderColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhotoUrl = indexPath
        self.collectionView.reloadData()
    }
    
    func getImage(keyword: String) {
        let unsplashURL = "https://api.unsplash.com/search/photos?page=1&query=\(keyword)"
        let unsplashHeaders: HTTPHeaders = ["Authorization":"Client-ID \(APIkey.unsplashAccessKey)"]
        
        AF.request(unsplashURL, method: .get, headers: unsplashHeaders).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)["results"].arrayValue
                self.urlArray = json.map { $0["urls"]["small"].stringValue}
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
