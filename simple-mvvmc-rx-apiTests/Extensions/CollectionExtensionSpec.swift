import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class CollectionExtensionSpec: QuickSpec {
    override class func spec() {
        describe("CollectionExtension") {
            context("when accessing elements") {
                it("should safely return element if in range") {
                    let array = [1, 2, 3, 4, 5]
                    let index = 4
                    let expectedElement = array[index]
                    
                    let result = array[safe: index]
                    
                    expect(result).to(equal(expectedElement))
                }
                
                it("should return nil if element is out of range") {
                    let array = [1, 2, 3, 4, 5]
                    let index = 5
                    
                    let result = array[safe: index]
                    
                    expect(result).to(beNil())
                }
                
                it("should return nil for an empty array") {
                    let emptyArray: [Int] = []
                    let index = 0
                    
                    let result = emptyArray[safe: index]
                    
                    expect(result).to(beNil())
                }
            }
        }
    }
}
