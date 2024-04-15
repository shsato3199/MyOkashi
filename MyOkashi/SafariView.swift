//
//  SafariView.swift
//  MyOkashi
//
//  Created by 佐藤翔馬 on 2024/04/14.
//

import SwiftUI
//SafariServicesというフレームワークをインポートする。
//アプリから外部のSafariを起動させるのではなく、アプリの内部でsafariを起動する子ができ、Web viewsと言われている。
import SafariServices

//SFsafariViewControllerを起動する構造体
struct SafariView: UIViewControllerRepresentable{
    //表示するホームページのURLを受け取る変数
    let url: URL
    //表示するViewを生成する時に実行する
    func makeUIViewController(context: Context) -> some UIViewController {
        //safariを起動
        return SFSafariViewController(url: url)
    }
    //Viewが更新された時に実行
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //処理なし
    }
}
