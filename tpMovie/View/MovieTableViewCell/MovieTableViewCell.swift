//
//  MovieTableViewCell.swift
//  tpMovie
//
//  Created by lucas on 31/05/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /**
        function that allows to link the data with the elements of a scene
     */
    func fillDataWith(movieElement: Movie) {
        self.titleLabel.text = movieElement.title
        if let year = movieElement.year {
            self.dateLabel.text = String(year)
        }
        self.synopsisLabel.text = movieElement.synopsis
    }
    
    func displayImage(_ image: UIImage) {
        DispatchQueue.main.async() {
            self.movieImageView.image = image
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
        function that allows to empty the labels to reuse them
     */
    override func prepareForReuse() {
        self.titleLabel.text = nil
        self.movieImageView.image = nil
        self.dateLabel.text = nil
        self.synopsisLabel.text = nil
    }
    
    static var nib: UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "MovieTableViewCell"
    }
    
}

