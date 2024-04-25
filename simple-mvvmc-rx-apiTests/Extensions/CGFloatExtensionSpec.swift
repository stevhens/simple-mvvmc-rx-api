import XCTest
import Quick
import Nimble
import UIKit
@testable import simple_mvvmc_rx_api

class CGFloatExtensionSpec: QuickSpec {
    override class func spec() {
        describe("CGFloatExtension") {
            context("when calculating text height") {
                it("should return correct height, single line") {
                    let text = "Lorem"
                    let width: CGFloat = 100
                    let font = UIFont.systemFont(ofSize: 16)
                    let expectedHeight = 19.3 // Manual calculation
                    
                    let calculatedHeight = CGFloat.getTextHeight(text, width: width, font: font)
                    
                    expect(calculatedHeight).to(beCloseTo(expectedHeight, within: 0.1))
                }
                
                it("should return correct height, multiple lines") {
                    let text = "Text: Foo Bar Lorem Ipsum dolor sit amet adipiscing loras"
                    let width: CGFloat = 150
                    let font = UIFont.systemFont(ofSize: 14)
                    let expectedHeight = 50.3 // Manual calculation
                    
                    let calculatedHeight = CGFloat.getTextHeight(text, width: width, font: font)
                    
                    expect(calculatedHeight).to(beCloseTo(expectedHeight, within: 0.1))
                }
                
                it("should return 0 for empty text") {
                    let text = ""
                    let width: CGFloat = 100
                    let font = UIFont.systemFont(ofSize: 16)
                    let calculatedHeight = CGFloat.getTextHeight(text, width: width, font: font)
                    
                    expect(calculatedHeight).to(equal(0))
                }
            }
        }
    }
}
