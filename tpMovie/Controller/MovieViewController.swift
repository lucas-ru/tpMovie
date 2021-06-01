//
//  MovieViewController.swift
//  tpMovie
//
//  Created by lucas on 18/05/2021.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movieId: Int = 0
    var movie: Movie?
    let moviesRepository = MoviesRequest()
    let imageManager = ImageManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moviesRepository.getMovieDetails(id: movieId) { response in
            if let movieResponse = response {
                guard let movie = Movie(from: movieResponse) else {
                    return
                }
                self.movie = movie
                DispatchQueue.main.async() {
                    self.displayMovieInformation(movie: movie)
                    self.displayMovieImages(movie: movie)
                }
            }
        }
    }
    
    /**
        Remove the hidden property for the Play button
     */
    private func displayPlayButton() {
        DispatchQueue.main.async() {
            self.playButton.isHidden = false
        }
    }

    /**
        function that allows to fill in the labels for the details of a film
     */
    private func displayMovieInformation(movie: Movie) {
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        if let year = movie.year {
            yearLabel.text = String(year)
        }
        durationLabel.text = movie.getDurationAsString()
        categoriesLabel.text = movie.getCategoriesAsString()
        synopsisLabel.text = movie.synopsis
    }
    
    private func displayMovieImages(movie: Movie) {
        if let url = movie.getImageUrl() {
            imageManager.getImage(url: url) { image, imageUrl in
                DispatchQueue.main.async() {
                    if imageUrl ==  url.absoluteString {
                        self.movieImageView.image = image
                    }
                }
            }
        }

    }
    
}

