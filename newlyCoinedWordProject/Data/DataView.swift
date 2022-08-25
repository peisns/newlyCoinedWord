//
//  DataView.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/25.
//

import UIKit
import Zip

class DataView: UIView {
    
    let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("SAVE DATA", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    let loadButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOAD DATA", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .red
        return btn
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
        self.backgroundColor = .white
        [saveButton, loadButton].forEach { self.addSubview($0)}
        saveButton.addTarget(self, action: #selector(saveButtonClicked) , for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(loadButtonClicked) , for: .touchUpInside)
    }
    
    func setConstraints() {
        let basicMargin:Int = 16 //basicMargin

        saveButton.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(60)
        }
        
        loadButton.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(basicMargin)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(basicMargin)
            make.height.equalTo(60)
        }
    }
    
    @objc func saveButtonClicked() {
        var urlPaths = [URL]()
        
        //도큐먼트 위치에 백업 파일 확인
        guard let path = documentDirectoryPath() else {
            // alert: 도큐먼트 위치에 오류가 있습니다
            return
        }
        //도큐먼트 폴더 안의 default.realm의 단순한 경로
        let realmFile = path.appendingPathComponent("default.realm")
        
        //파일의 존재여부 확인
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            // alert : 백업할 파일이 없습니다
            return
        }
        
        urlPaths.append(URL(string: realmFile.path)!)
        
        //백업 파일을 압축
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "SeSACDiary_1")
            showActivityViewController()
        } catch {
            // alert: 압축을 실패했습니다
        }
        
        //activityView Controller
    }
    
    @objc func loadButtonClicked() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
//        self.present(documentPicker, animated: true)
    }
    
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } // document 경로
        return documentDirectory
    }
    
    func showActivityViewController() {
        guard let path = documentDirectoryPath() else {
            // alert: 도큐먼트 위치에 오류가 있습니다
            return
        }
        //도큐먼트 폴더 안의 default.realm의 단순한 경로
        let backupFileURL = path.appendingPathComponent("SeSACDiary_1.zip")
        
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
//        self.present(vc, animated: false)
        
    }
}
extension DataView: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print(#function)
        guard let selectedFileURL = urls.first else {
            //alert: 선택한 파일을 찾을 수 없습니다.
            return
        }
        
        guard let path = documentDirectoryPath() else {
            //alert: 도큐먼트 위치에 오류가 있습니다
            return  }
        
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")
            do {
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzipfile::\(unzippedFile)")
                    //alert: 복구가 완료되었습니다
                })
            } catch {
                //alert : 압축 해제에 실패
            }
            
        } else {
            do {
                //파일 앱에서 zip -> Document 폴더에 복사
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                let fileURL = path.appendingPathComponent("SeSACDiary_1.zip")
                
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile : \(unzippedFile)")
                    //alert 복구가 완료되었습니다.
                })
                
            } catch {
                //alert 압축 해제에 실패
            }
        }
    }
}
