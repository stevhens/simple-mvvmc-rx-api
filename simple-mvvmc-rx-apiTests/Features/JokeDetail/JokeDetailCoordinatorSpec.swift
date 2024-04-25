import XCTest
import Quick
import Nimble
import Cuckoo
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
                    
                    stub(mockDelegate) { mock in
                        when(mock.jokeDetailCoordinatorDidFinish(any())).thenDoNothing()
                    }
                    
                    coordinator.dismissPage()
                    
                    verify(mockDelegate, times(1)).jokeDetailCoordinatorDidFinish(equal(to: coordinator))
                }
            }
        }
    }
}
