//
//  AddWordView.swift
//  WordList_LA
//
//  Created by シング　シュバクシ on 2026/02/03.
//

import SwiftUI
import SwiftData

struct AddWordView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var english = ""
    @State var japanese = ""
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 16){
            Spacer()
            TextField("英単語", text: $english) //Textを入力するUI
                .textFieldStyle(.roundedBorder)
            TextField("意味", text: $japanese)
                .textFieldStyle(.roundedBorder)
            
            Button{
                save()
            } label: {
                Text("保存")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .clipShape(.capsule)
            
            Spacer()
        }
        .padding()
        
        // エラー時のアラートを表示
        .alert("両方の欄に入力してください", isPresented: $showAlert){
            Button("OK", role: .cancel){ }
        }
    }
    
    func save(){
        if english.isEmpty || japanese.isEmpty {
            showAlert = true
            return
        }
        let word = Word(english: english, japanese: japanese) //新しいWordインスタンスを作成
        context.insert(word)
        dismiss()
    }
}

#Preview {
    AddWordView()
}
