//
//  FileManager+Extension.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/26.
//

import UIKit

extension UIViewController {
    
    func saveImageToDocument(fileName: String, image: UIImage) {
        // 파일을 Document에 저장하려면 Document가 어디에 있는지 알아야함, URL을 얻자
        // for enum은 접근 폴더를 지정해준다
        // in 제한을 걸어주는 요소?
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        print(documentDirectory)
        //세부 경로, 이미지를 저장할 위치
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 이미지 압축 -> data
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
    
        //
        do {
            try data.write(to: fileURL)
            print("save!")
        } catch let error {
            print("file save error", error)
        }
    }
    
    func loadImageFromDocument(fileName: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 경로에 파일이 존재하면?
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path) // 파일 가져와
        } else {
            return UIImage(systemName: "star.fill") // 파일 없으면 별 보여줘
        }
    }
    
    func removeImageFromDocument(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
    }
}
