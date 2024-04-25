import UIKit

class JokeListItemCell: UICollectionViewCell {
    static func getSize(jokeSetupText: String, jokePunchlineText: String) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        let jokeSetupHeight = CGFloat.getTextHeight(
            jokeSetupText,
            width: screenWidth - 56,
            font: .systemFont(ofSize: 17.0, weight: .semibold)
        )
        let jokePunchlineHeight = CGFloat.getTextHeight(
            jokePunchlineText,
            width: screenWidth - 56,
            font: .systemFont(ofSize: 15.0, weight: .regular)
        )
        let totalHeight = 32 + jokeSetupHeight + 16 + jokePunchlineHeight
        return CGSize(width: screenWidth, height: totalHeight)
    }
    
    @IBOutlet weak var jokeSetupLabel: UILabel!
    @IBOutlet weak var jokePunchlineLabel: UILabel!
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.alpha = self.isHighlighted ? 0.5 : 1.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
