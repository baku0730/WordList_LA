//
//  WordList_LAApp.swift
//  WordList_LA
//
//  Created by シング　シュバクシ on 2026/02/03.
//

import SwiftUI
import SwiftData

@main
struct WordList_LAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Word.self) //Wordモデル用のデータベース作成
        }
    }
}
