//
//  CategoryController.swift
//  tpMovie
//
//  Created by lucas on 04/04/2021.
//

import UIKit

class CategoriesViewController: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [Category] = []
    
    private let categoriesRepository = CategoriesRequest()
    private let segueIdentifier = "showMoviesSegue"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionViewCell.nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        collectionView.register(TitleCollectionViewCell.nib, forCellWithReuseIdentifier: TitleCollectionViewCell.reuseIdentifier)

        categoriesRepository.getCategoriesList { response in
            if let genres = response {
                self.categories = genres.transformToCategoryArray()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let listViewController = segue.destination as! ListViewController
            if let category = sender as? Category {
                listViewController.category = category
            }
        }
    }

}

extension CategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cell.alpha = 0.5
            UIView.animate(
                withDuration: 0.4,
                delay: 0.2,
                animations: {
                    cell.alpha = 1
            })
            self.performSegue(withIdentifier: segueIdentifier, sender: categories[indexPath.item])
        }
    }
}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0: return 1
            case 1: return categories.count
            default: return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! TitleCollectionViewCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! CategoryCollectionViewCell
            cell.configureWithName(CategoriesName: categories[indexPath.item].name)
            return cell
        }
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        if indexPath.section == 1 {
            return CGSize(width: collectionViewSize/2, height: collectionViewSize/4)
        }
        return CGSize(width: collectionViewSize, height: collectionViewSize/4)
    }
}
