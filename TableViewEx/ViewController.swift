//
//  ViewController.swift
//  TableViewEx
//
//  Created by 김종권 on 2021/02/18.
//

import UIKit

struct Data {
    let title: String
    static func loadData() -> [Data] {
        var datas = [Data]()
        for data in 0...5 {
            datas.append(.init(title: "\(data) 데이터"))
        }
        return datas
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.flashScrollIndicators()
    }

    private func setupView() {
        tableView.register(UINib(nibName: MyTableViewCell.className(), bundle: Bundle.main), forCellReuseIdentifier: MyTableViewCell.className())
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func loadData() {
        dataSource = Data.loadData()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.className()) as! MyTableViewCell
        cell.bind(title: dataSource[indexPath.row].title)
        return cell
    }
}

extension NSObject {
    class func className() -> String {
        return String(describing: self)
    }
}
