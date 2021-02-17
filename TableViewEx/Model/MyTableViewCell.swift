//
//  MyTableViewCell.swift
//  TableViewEx
//
//  Created by 김종권 on 2021/02/18.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bind(title: String) {
        lblTitle.text = title
    }
    
}
