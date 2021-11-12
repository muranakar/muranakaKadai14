//
//  FruitsTableViewController.swift
//  muranakaKadai13
//
//  Created by 村中令 on 2021/11/08.
//

import UIKit

class FruitsTableViewController: UITableViewController {
    private var fruits: [Fruit] =
        [
            Fruit(name: "りんご", isCheck: false),
            Fruit(name: "みかん", isCheck: true ),
            Fruit(name: "バナナ", isCheck: false),
            Fruit(name: "パイナップル", isCheck: true)
        ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        ) as! FruitTableViewCell // swiftlint:disable:this force_cast

        cell.configure(fruit: fruits[indexPath.row])
        return cell
    }

    @IBAction private func addFruit(segue: UIStoryboardSegue) {
        let addVC = segue.source as! AddFruitViewController  // swiftlint:disable:this force_cast
        guard let text = addVC.text else { return }
        guard text != "" else { return }
        fruits.append(Fruit(name: text, isCheck: false))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            [weak self] in
            self!.tableView.insertRows(
                at: [IndexPath.init(row: self!.fruits.count - 1, section: 0)],
                with: .top
            )
        }
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {
    }
}
