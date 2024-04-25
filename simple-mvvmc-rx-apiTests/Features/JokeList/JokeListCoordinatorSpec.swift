import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class JokeListCoordinatorSpec: QuickSpec {
    override class func spec() {
        describe("JokeListCoordinator") {
            var navigationController: UINavigationController!
            var coordinator: JokeListCoordinator!

            beforeEach {
                navigationController = UINavigationController()
                coordinator = JokeListCoordinator(navigationController: navigationController)
            }

            afterEach {
                navigationController = nil
                coordinator = nil
            }

            context("when starting") {
                it("should start the coordinator and the kind must be a JokeListViewController") {
                    coordinator.start()
                    expect(navigationController.topViewController).to(beAKindOf(JokeListViewController.self))
                }
            }

            context("when showing joke detail") {
                it("should create and start a JokeDetailCoordinator") {
                    coordinator.start()
                    coordinator.showJokeDetail(jokeID: 101)

                    expect(coordinator.childCoordinators.count).to(equal(1))
                    expect(coordinator.childCoordinators.first).to(beAKindOf(JokeDetailCoordinator.self))
                }
            }

            context("when receiving notification that a JokeDetailCoordinator finished") {
                it("should remove the child coordinator after finish / dismiss") {
                    coordinator.start()
                    let jokeDetailCoordinator = JokeDetailCoordinator(navigationController: navigationController, jokeID: 101)
                    coordinator.childCoordinators.append(jokeDetailCoordinator)

                    coordinator.jokeDetailCoordinatorDidFinish(jokeDetailCoordinator)

                    expect(coordinator.childCoordinators).to(beEmpty())
                }
            }
        }
    }
}
