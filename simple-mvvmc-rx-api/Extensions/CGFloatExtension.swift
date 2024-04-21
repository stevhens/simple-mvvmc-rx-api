import UIKit

public extension CGFloat {
    static func getTextHeight(_ text: String, width: CGFloat, margin: CGFloat = 0.0, font: UIFont, line: Int = 0) -> CGFloat {
      guard !text.isEmpty else {
        return 0.0
      }

      let label: UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude)
        lbl.font = font
        lbl.textAlignment = .left
        lbl.numberOfLines = line
        lbl.lineBreakMode = .byWordWrapping
        lbl.text = text
        lbl.sizeToFit()
        return lbl
      }()

      return label.frame.height + margin
    }

}
