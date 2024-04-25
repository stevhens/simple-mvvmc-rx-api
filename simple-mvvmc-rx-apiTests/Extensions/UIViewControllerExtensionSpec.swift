import XCTest
import Quick
import Nimble
@testable import simple_mvvmc_rx_api

class UIViewControllerExtensionSpec: QuickSpec {
    override class func spec() {
        describe("UIViewController Extension") {
            var window: UIWindow!
            var viewController: UIViewController!
            
            beforeEach {
                window = UIWindow(frame: UIScreen.main.bounds)
                viewController = UIViewController()
                window.rootViewController = viewController
                window.makeKeyAndVisible()
            }
            
            afterEach {
                window = nil
                viewController = nil
            }
            
            context("when showing error alert") {
                it("should create an alert controller with title and message") {
                    let errorMessage = "TestError"
                    viewController.showErrorAlert(message: errorMessage)
                    
                    guard let presentedAlertController = viewController.presentedViewController as? UIAlertController else {
                        fail("UIAlertController not exist")
                        return
                    }
                    
                    expect(presentedAlertController.title).to(equal("Error"))
                    expect(presentedAlertController.message).to(equal(errorMessage))
                }
                
                it("should have 'OK' to the alert controller") {
                    viewController.showErrorAlert(message: "TestError")
                    
                    guard let presentedAlertController = viewController.presentedViewController as? UIAlertController else {
                        fail("UIAlertController not exist")
                        return
                    }
                    
                    expect(presentedAlertController.actions.count).to(equal(1))
                    
                    let okAction = presentedAlertController.actions.first
                    expect(okAction?.title).to(equal("OK"))
                    expect(okAction?.style).to(equal(.default))
                }
            }
        }
    }
}
