import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class JokeListItemCellSpec: QuickSpec {
    override class func spec() {
        describe("JokeListItemCell") {
            context("when calculating cell size") {
                it("should return calculated size after measuring joke setup and punchline texts") {
                    let jokeSetupText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    let jokePunchlineText = "Integer a urna fringilla, mattis ipsum a, euismod magna"
                    let expectedWidth = UIScreen.main.bounds.size.width
                    let expectedHeight: CGFloat = 32 +
                        CGFloat.getTextHeight(jokeSetupText, width: expectedWidth - 56, font: .systemFont(ofSize: 17.0, weight: .semibold)) +
                        16 +
                        CGFloat.getTextHeight(jokePunchlineText, width: expectedWidth - 56, font: .systemFont(ofSize: 15.0, weight: .regular))

                    let calculatedSize = JokeListItemCell.getSize(jokeSetupText: jokeSetupText, jokePunchlineText: jokePunchlineText)

                    expect(calculatedSize.width).to(equal(expectedWidth))
                    expect(calculatedSize.height).to(equal(expectedHeight))
                }
            }
            
            context("when cell is being tapped / highlighting") {
                it("should animate alpha to 0.5") {
                    let cell = JokeListItemCell()
                    cell.isHighlighted = true
                    expect(cell.alpha).toEventually(equal(0.5), timeout: .milliseconds(300))
                }
                
                it("should animate alpha to 1.0") {
                    let cell = JokeListItemCell()
                    cell.isHighlighted = false
                    expect(cell.alpha).toEventually(equal(1.0), timeout: .milliseconds(300))
                }
            }
        }
    }
}
