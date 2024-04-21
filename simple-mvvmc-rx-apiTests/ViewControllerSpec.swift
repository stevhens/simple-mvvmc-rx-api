import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class ViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("ViewController") {
            var sut: ViewController!
            
            beforeEach {
                sut = ViewController()
                _ = sut.view
            }
            
            afterEach {
                sut = nil
            }
            
            context("when app loaded") {
                it("Should test viewDidLoad") {
                    sut.viewDidLoad()
                    expect(sut.view).toNot(beNil())
                }
            }
        }
    }
}
