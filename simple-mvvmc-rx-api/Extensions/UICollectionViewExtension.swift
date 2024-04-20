import UIKit

extension UICollectionView {
    func registerCells(withIdentifiers cellIdentifiers: String...) {
        cellIdentifiers.forEach { identifier in
            self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
}
