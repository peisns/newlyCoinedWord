//
//  DiaryModel.swift
//  newlyCoinedWordProject
//
//  Created by Brother Model on 2022/08/24.
//

import UIKit

import RealmSwift

//UserDiary: 테이블 이름
//@Persisted
class UserDiary: Object {
    @Persisted var diaryTitle: String //제목(필수)
    @Persisted var diaryContents: String? //내용(옵션)
    @Persisted var diaryDate = Date() //작성 날짜(필수)
    @Persisted var regDate = Date() //등록 날짜(필수)
    @Persisted var favorite: Bool //즐겨찾기(필수)
    @Persisted var like: Bool
    @Persisted var photoURL: String? //사진URLString(옵션)
    
    //PK(필수): Int, UUID, ObjectID
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(diaryTitle: String, diaryContent: String?, DiaryDate: Date, regDate: Date, photo: String?) {
        self.init()
        self.diaryTitle = diaryTitle
        self.diaryContents = diaryContent
        self.regDate = regDate
        self.favorite = false
        self.like = false
        self.photoURL = photo
   }
}
