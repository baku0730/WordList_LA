//
//  Word.swift
//  WordList_LA
//
//  Created by シング　シュバクシ on 2026/02/03.
//

import SwiftData

@Model //これでデータベースにアクセスできるようになってデータを端末に保存できる
class Word{
    var english: String
    var japanese: String
    
    init(english: String, japanese: String) {
        self.english = english
        self.japanese = japanese
    }
}
