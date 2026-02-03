//
//  QuizView.swift
//  WordList_LA
//
//  Created by シング　シュバクシ on 2026/02/03.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    @Environment(\.dismiss) var dismiss //前の画面に戻るため
    @Environment(\.modelContext) var context
    @Query var words: [Word] //保存されている単語データを取得する→データベースから自動でデータを取得してくれる
    @State var index = 0 //問題番号
    @State var showAnswer = false //答えの表示状態を管理する
    
    //最後の問題かどうかを判定する
    var isLastQuiz: Bool{
        index + 1 >= words.count
    }
    
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            
            if words.isEmpty{
                Text("登録されている単語がありません")
            } else {
                Text(words[index].english)
                    .font(.largeTitle)
                
                Text(showAnswer ? words[index].japanese : "-")
                    .font(.largeTitle)
                
                Button{
                    showAnswer.toggle()
                } label: {
                    Text(showAnswer ? "解答を非表示" : "解答を表示")
                }
                .font(.title)
                .foregroundStyle(.white)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .clipShape(.capsule)
            }
            
            Spacer()
            
            Button{
                //最後の問題なら前の画面へ戻り、そうでないなら次の単語に進む
                if isLastQuiz{
                    dismiss()
                } else {
                    index += 1
                    showAnswer = false
                }
            } label: {
                Text(isLastQuiz ? "終了" : "次の問題へ")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .clipShape(.capsule)
        }
        .padding(.horizontal, 60)
    }
}

#Preview {
    QuizView()
        .modelContainer(wordContainer)
}
