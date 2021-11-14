//
//  AddFruitViewController.swift
//  muranakaKadai14
//
//  Created by 村中令 on 2021/11/10.
//

import UIKit

class AddFruitViewController: UIViewController {
    enum Result {
        case save(String)
        case cancel
    }
    
    @IBOutlet weak private var fruitTextField: UITextField!
    
    private var result: Result?
    
    var onViewDidDisappear: (Result) -> Void = { _ in }

    @IBAction private func addFruit(_ sender: Any) {
        result = .save(fruitTextField.text ?? "")
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

    @IBAction private func cancel(_ sender: Any) {
        result = .cancel
        performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let result = result else { return }
        onViewDidDisappear(result)
    }
}
