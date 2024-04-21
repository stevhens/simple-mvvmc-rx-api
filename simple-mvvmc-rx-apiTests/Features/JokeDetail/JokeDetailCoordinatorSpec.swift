import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class JokeDetailCoordinatorSpec: QuickSpec {
    override class func spec() {
        describe("JokeDetailCoordinator") {
            var navigationController: UINavigationController!
            var coordinator: JokeDetailCoordinator!
            var mockDelegate: MockJokeDetailCoordinatorDelegate!

            beforeEach {
                navigationController = UINavigationController()
                mockDelegate = MockJokeDetailCoordinatorDelegate()
                coordinator = JokeDetailCoordinator(navigationController: navigationController, jokeID: 101)
                coordinator.delegate = mockDelegate
            }

            afterEach {
                navigationController = nil
                mockDelegate = nil
                coordinator = nil
            }

            context("when starting") {
                it("should start the coordinator and the kind must be a JokeDetailViewController") {
                    coordinator.start()
                    expect(navigationController.topViewController).to(beAKindOf(JokeDetailViewController.self))
                }
            }

            context("when dismissing page") {
                it("should pop the view controller and call delegate") {
                    coordinator.start()
                    coordinator.dismissPage()

                    expect(mockDelegate.didFinishCalled).to(beTrue())
                    expect(mockDelegate.finishedCoordinator).to(be(coordinator))
                }
            }
        }
    }
}

class MockJokeDetailCoordinatorDelegate: JokeDetailCoordinatorDelegate {
    var didFinishCalled = false
    var finishedCoordinator: JokeDetailCoordinator?

    func jokeDetailCoordinatorDidFinish(_ coordinator: JokeDetailCoordinator) {
        didFinishCalled = true
        finishedCoordinator = coordinator
    }
}
