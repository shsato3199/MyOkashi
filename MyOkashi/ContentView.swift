//
//  ContentView.swift
//  MyOkashi
//
//  Created by 佐藤翔馬 on 2024/04/14.
//

import SwiftUI

struct ContentView: View {
    //OkashoDataを参照する変数
    //OkashiDataのインスタンスを作成。インスタンスは、クラスや構造体から生成された実体のこと。
    var okashiDataList = OkashiData()
    //入力された文字列を保持する状態変数
    @State var inputText = ""
    //SafariViewの表示有無を管理する変数
    @State var isShowSafari = false
    var body: some View {
        VStack{
            //文字を受け取るTextFieldを表示する
            TextField("キーワード",
                      text: $inputText,
                      prompt: Text("キーワードを入力してください。")
            )
            .onSubmit {
                //入力完了直後に検索をする。
                okashiDataList.searchOkashi(keyword: inputText)
            }
            //キーボードの改行を検索に変更する。
            .submitLabel(.search)
            //上下左右に空白を開ける
            .padding()
            
            //リスト表示する
            List(okashiDataList.okashiList){okashi in
                //一つ一つの要素を取り出す
                //ボタンを用意する
                Button{
                    //選択したリンクを保持する
                    okashiDataList.okashiLink = okashi.link
                    //SafariViewを表示する
                    isShowSafari.toggle()
                }label: {
                    //Listの表示内容を生成する
                    //巣兵にレイアウト(横方向にレイアウト)
                    HStack{
                        //画像を読み込み、表示する
                        //AsyncImageは、画像を非同期で読み込むことができ、読み込み中も別の処理をすることができる。
                        AsyncImage(url: okashi.image){ image in
                            //画像を表示する
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }placeholder: {
                            //読み込み中はインジケーターを表示すう。
                            ProgressView()
                        }
                        Text(okashi.name)
                    }
                }
            }
            .sheet(isPresented: $isShowSafari, content: {
                //SafariViewを表示する
                SafariView(url: okashiDataList.okashiLink!)
                //画面下部がセーフエリア外までいっぱいになるように指定
                    .ignoresSafeArea(edges: [.bottom])
            })
        }
    }
}

#Preview {
    ContentView()
}
