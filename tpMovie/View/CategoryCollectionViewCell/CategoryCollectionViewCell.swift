//
//  CategoryCollectionViewCell.swift
//  tpMovie
//
//  Created by lucas on 04/04/2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = false
    }

    /**
        function which allows to name the first view via the label
     */
    func configureWithName(CategoriesName: String) {
        nameLabel.text = CategoriesName
    }
    
    
    static var nib: UINib {
        UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        "CategoryCollectionViewCell"
    }
    

}
