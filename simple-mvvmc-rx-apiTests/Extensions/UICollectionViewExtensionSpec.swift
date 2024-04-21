import UIKit
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class UICollectionViewExtensionSpec: QuickSpec {
    override class func spec() {
        describe("UICollectionView Extension") {
            var collectionView: UICollectionView!

            beforeEach {
                let layout = UICollectionViewFlowLayout()
                collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            }

            afterEach {
                collectionView = nil
            }

            context("when registering cells") {
                it("should register the specified cell identifiers") {
                    collectionView.registerCells(withIdentifiers: JokeListItemCell.className)
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JokeListItemCell.className, for: IndexPath(item: 0, section: 0))
                    expect(cell).to(beAKindOf(JokeListItemCell.self))
                }
            }
        }
    }
}
