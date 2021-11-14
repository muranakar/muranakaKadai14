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
            Fruit(name: "みかん", isCheck: true),
            Fruit(name: "バナナ", isCheck: false),
            Fruit(name: "パイナップル", isCheck: true)
        ]

    // MARK: - Table view data source

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
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "AddSegue":
            let nav = segue.destination as! UINavigationController
            let addVC = nav.topViewController as! AddFruitViewController
            addVC.onViewDidDisappear = { [weak self] result in
                guard let strongSelf = self else { return }
                
                switch result {
                case .save(let name):
                    guard !name.isEmpty else { return }
                    
                    strongSelf.fruits.append(Fruit(name: name, isCheck: false))

                    strongSelf.tableView.insertRows(
                        at: [IndexPath(row: strongSelf.fruits.count - 1, section: 0)],
                        with: .top
                    )
                case .cancel:
                    break
                }
            }
        default:
            break
        }
    }
}
