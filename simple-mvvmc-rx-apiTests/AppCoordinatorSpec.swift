import UIKit
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class AppCoordinatorSpec: QuickSpec {
    override class func spec() {
        describe("AppCoordinator") {
            var sut: AppCoordinator!
            var navigationController: UINavigationController!
            
            beforeEach {
                navigationController = UINavigationController()
                sut = AppCoordinator(navigationController: navigationController)
            }
            context("when starting") {
                it("should start the coordinator and the kind must be a JokeListCoordinator") {
                    sut.start()
                    expect(sut.childCoordinators).toNot(beEmpty())
                    expect(sut.childCoordinators.first).to(beAKindOf(JokeListCoordinator.self))
                }
            }
        }
    }
}
