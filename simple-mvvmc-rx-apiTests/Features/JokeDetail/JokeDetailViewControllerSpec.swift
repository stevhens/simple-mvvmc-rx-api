import XCTest
import Quick
import Nimble
import RxSwift
import RxTest
import Cuckoo
@testable import simple_mvvmc_rx_api

class JokeDetailViewControllerSpec: QuickSpec {
    override class func spec() {
        describe("JokeDetailViewController") {
            var sut: JokeDetailViewController!
            var mockViewModel: MockJokeDetailViewModel!
            var testScheduler: TestScheduler!
            var mockContentRepository: MockContentRepository!
            var coordinator: JokeDetailCoordinator!
            var disposeBag: DisposeBag!
            var window: UIWindow!
            
            beforeEach {
                disposeBag = DisposeBag()
                testScheduler = TestScheduler(initialClock: 0)
                mockContentRepository = MockContentRepository()
                coordinator = JokeDetailCoordinator(navigationController: .init(), jokeID: 101)
                mockViewModel = MockJokeDetailViewModel(contentRepository: mockContentRepository, coordinator: coordinator)
                
                sut = JokeDetailViewController(viewModel: mockViewModel, jokeID: 101)
                
                window = UIWindow(frame: UIScreen.main.bounds)
                window.rootViewController = sut
                window.makeKeyAndVisible()
                
                _ = sut.view
            }
            
            afterEach {
                sut = nil
                mockViewModel = nil
                testScheduler = nil
                mockContentRepository = nil
                coordinator = nil
                disposeBag = nil
                window = nil
            }
            
            context("when viewDidLoad is called") {
                it("should setup UI") {
                    expect(sut.navigationItem.title).to(equal("Joke Detail"))
                    expect(sut.navigationItem.leftBarButtonItem?.image).to(equal(UIImage(systemName: "chevron.left")))
                }
                
                it("should bind view model") {
                    testScheduler.createColdObservable([.next(1, true), .completed(2)])
                        .bind(to: mockViewModel.isLoading)
                        .disposed(by: disposeBag)
                    
                    let joke = Joke(id: 101, type: "", setup: "setup", punchline: "punchline")
                    testScheduler.createColdObservable([.next(3, joke), .completed(4)])
                        .bind(to: mockViewModel.joke)
                        .disposed(by: disposeBag)
                    
                    sut.viewDidLoad()
                    
                    testScheduler.start()
                    
                    expect(sut.jokeSetupLabel.text).to(equal("setup"))
                    expect(sut.jokePunchlineLabel.text).to(equal("punchline"))
                }
            }
            
            context("when viewModel emits an error") {
                it("should show the error alert") {
                    testScheduler.createColdObservable([.next(1, true), .completed(2)])
                        .bind(to: mockViewModel.isLoading)
                        .disposed(by: disposeBag)
                    
                    let joke = Joke(id: 101, type: "", setup: "setup", punchline: "punchline")
                    testScheduler.createColdObservable([.next(3, joke), .completed(4)])
                        .bind(to: mockViewModel.joke)
                        .disposed(by: disposeBag)
                    
                    let testError = NSError(domain: "Test Error Message", code: 101, userInfo: nil)
                    
                    testScheduler.createColdObservable([.next(2, testError), .completed(4)])
                        .bind(to: mockViewModel.error)
                        .disposed(by: disposeBag)
                    
                    sut.viewDidLoad()
                    
                    testScheduler.start()
                    
                    guard let presentedAlertController = sut.presentedViewController as? UIAlertController else {
                        fail("Expected UIAlertController to be presented")
                        return
                    }
                    
                    expect(presentedAlertController.title).to(equal("Error"))
                    expect(presentedAlertController.message).to(equal(testError.localizedDescription))
                }
            }
            
            context("when back button is tapped") {
                it("should call vm dismissPage") {
                    sut.backButtonTapped()
                    expect(mockViewModel.dismissPageCalled).to(beTrue())
                }
            }
        }
    }
}

class MockJokeDetailViewModel: JokeDetailViewModel {
    var fetchJokeIdCalled = false
    var dismissPageCalled = false
    
    override func fetchJoke(id: Int) {
        fetchJokeIdCalled = true
    }
    
    override func dismissPage() {
        dismissPageCalled = true
    }
}
