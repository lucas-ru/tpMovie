//
//  CategoryTitleTableViewCell.swift
//  tpMovie
//
//  Created by lucas on 31/05/2021.
//

import UIKit

class CategoryTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var nib: UINib {
        return UINib(nibName: "CategoryTitleTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static var reuseIdentifier: String {
        return "CategoryTitleTableViewCell"
    }
    
}
