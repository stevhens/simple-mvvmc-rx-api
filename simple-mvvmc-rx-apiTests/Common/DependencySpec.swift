import XCTest
import Quick
import Nimble
import Swinject
@testable import simple_mvvmc_rx_api

class DependencySpec: QuickSpec {
    override class func spec() {
        describe("Dependency") {
            var container: Container!

            beforeEach {
                container = Dependency.container
            }

            afterEach {
                container = nil
            }

            context("when registering default services") {
                it("should register DefaultNetworkClient") {
                    expect(container.resolve(DefaultNetworkClient.self)).toNot(beNil())
                }
            }

            context("when registering repositories") {
                it("should register DefaultContentRepository") {
                    expect(container.resolve(DefaultContentRepository.self)).toNot(beNil())
                }
            }
        }
    }
}
