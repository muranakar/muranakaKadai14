//
//  AddFruitViewController.swift
//  muranakaKadai14
//
//  Created by 村中令 on 2021/11/10.
//

import UIKit

class AddFruitViewController: UIViewController {
    @IBOutlet weak private var fruitTextField: UITextField!
    // 次回以降で、編集機能があると思いましたので、varで定義しました。
    private(set) var text: String?

    @IBAction private func addFruit(_ sender: Any) {
        text = fruitTextField.text
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

    @IBAction private func cancel(_ sender: Any) {
        performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
}
