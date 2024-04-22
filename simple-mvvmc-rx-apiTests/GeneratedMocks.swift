// MARK: - Mocks generated from file: simple-mvvmc-rx-api/Features/JokeDetail/JokeDetailCoordinator.swift at 2024-04-22 09:22:38 +0000


import Cuckoo
@testable import simple_mvvmc_rx_api

import UIKit






 class MockJokeDetailCoordinatorDelegate: JokeDetailCoordinatorDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = JokeDetailCoordinatorDelegate
    
     typealias Stubbing = __StubbingProxy_JokeDetailCoordinatorDelegate
     typealias Verification = __VerificationProxy_JokeDetailCoordinatorDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: JokeDetailCoordinatorDelegate?

     func enableDefaultImplementation(_ stub: JokeDetailCoordinatorDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func jokeDetailCoordinatorDidFinish(_ coordinator: JokeDetailCoordinator)  {
        
    return cuckoo_manager.call(
    """
    jokeDetailCoordinatorDidFinish(_: JokeDetailCoordinator)
    """,
            parameters: (coordinator),
            escapingParameters: (coordinator),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.jokeDetailCoordinatorDidFinish(coordinator))
        
    }
    
    

     struct __StubbingProxy_JokeDetailCoordinatorDelegate: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func jokeDetailCoordinatorDidFinish<M1: Cuckoo.Matchable>(_ coordinator: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(JokeDetailCoordinator)> where M1.MatchedType == JokeDetailCoordinator {
            let matchers: [Cuckoo.ParameterMatcher<(JokeDetailCoordinator)>] = [wrap(matchable: coordinator) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockJokeDetailCoordinatorDelegate.self, method:
    """
    jokeDetailCoordinatorDidFinish(_: JokeDetailCoordinator)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_JokeDetailCoordinatorDelegate: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func jokeDetailCoordinatorDidFinish<M1: Cuckoo.Matchable>(_ coordinator: M1) -> Cuckoo.__DoNotUse<(JokeDetailCoordinator), Void> where M1.MatchedType == JokeDetailCoordinator {
            let matchers: [Cuckoo.ParameterMatcher<(JokeDetailCoordinator)>] = [wrap(matchable: coordinator) { $0 }]
            return cuckoo_manager.verify(
    """
    jokeDetailCoordinatorDidFinish(_: JokeDetailCoordinator)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class JokeDetailCoordinatorDelegateStub: JokeDetailCoordinatorDelegate {
    

    

    
    
    
    
     func jokeDetailCoordinatorDidFinish(_ coordinator: JokeDetailCoordinator)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockJokeDetailCoordinator: JokeDetailCoordinator, Cuckoo.ClassMock {
    
     typealias MocksType = JokeDetailCoordinator
    
     typealias Stubbing = __StubbingProxy_JokeDetailCoordinator
     typealias Verification = __VerificationProxy_JokeDetailCoordinator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: JokeDetailCoordinator?

     func enableDefaultImplementation(_ stub: JokeDetailCoordinator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return cuckoo_manager.getter("childCoordinators",
                superclassCall:
                    
                                    super.childCoordinators
                    ,
                defaultCall:  __defaultImplStub!.childCoordinators)
        }
        
        set {
            cuckoo_manager.setter("childCoordinators",
                value: newValue,
                superclassCall:
                    
                    super.childCoordinators = newValue
                    ,
                defaultCall: __defaultImplStub!.childCoordinators = newValue)
        }
        
    }
    
    
    
    
    
     override var navigationController: UINavigationController {
        get {
            return cuckoo_manager.getter("navigationController",
                superclassCall:
                    
                                    super.navigationController
                    ,
                defaultCall:  __defaultImplStub!.navigationController)
        }
        
        set {
            cuckoo_manager.setter("navigationController",
                value: newValue,
                superclassCall:
                    
                    super.navigationController = newValue
                    ,
                defaultCall: __defaultImplStub!.navigationController = newValue)
        }
        
    }
    
    
    
    
    
     override var delegate: JokeDetailCoordinatorDelegate? {
        get {
            return cuckoo_manager.getter("delegate",
                superclassCall:
                    
                                    super.delegate
                    ,
                defaultCall:  __defaultImplStub!.delegate)
        }
        
        set {
            cuckoo_manager.setter("delegate",
                value: newValue,
                superclassCall:
                    
                    super.delegate = newValue
                    ,
                defaultCall: __defaultImplStub!.delegate = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func start()  {
        
    return cuckoo_manager.call(
    """
    start()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.start()
                ,
            defaultCall: __defaultImplStub!.start())
        
    }
    
    
    
    
    
     override func dismissPage()  {
        
    return cuckoo_manager.call(
    """
    dismissPage()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.dismissPage()
                ,
            defaultCall: __defaultImplStub!.dismissPage())
        
    }
    
    

     struct __StubbingProxy_JokeDetailCoordinator: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var childCoordinators: Cuckoo.ClassToBeStubbedProperty<MockJokeDetailCoordinator, [Coordinator]> {
            return .init(manager: cuckoo_manager, name: "childCoordinators")
        }
        
        
        
        
        var navigationController: Cuckoo.ClassToBeStubbedProperty<MockJokeDetailCoordinator, UINavigationController> {
            return .init(manager: cuckoo_manager, name: "navigationController")
        }
        
        
        
        
        var delegate: Cuckoo.ClassToBeStubbedOptionalProperty<MockJokeDetailCoordinator, JokeDetailCoordinatorDelegate> {
            return .init(manager: cuckoo_manager, name: "delegate")
        }
        
        
        
        
        
        func start() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockJokeDetailCoordinator.self, method:
    """
    start()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func dismissPage() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockJokeDetailCoordinator.self, method:
    """
    dismissPage()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_JokeDetailCoordinator: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var childCoordinators: Cuckoo.VerifyProperty<[Coordinator]> {
            return .init(manager: cuckoo_manager, name: "childCoordinators", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var navigationController: Cuckoo.VerifyProperty<UINavigationController> {
            return .init(manager: cuckoo_manager, name: "navigationController", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var delegate: Cuckoo.VerifyOptionalProperty<JokeDetailCoordinatorDelegate> {
            return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func start() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    start()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func dismissPage() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    dismissPage()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class JokeDetailCoordinatorStub: JokeDetailCoordinator {
    
    
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Coordinator]).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var navigationController: UINavigationController {
        get {
            return DefaultValueRegistry.defaultValue(for: (UINavigationController).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var delegate: JokeDetailCoordinatorDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (JokeDetailCoordinatorDelegate?).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func start()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func dismissPage()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: simple-mvvmc-rx-api/Features/JokeList/JokeListCoordinator.swift at 2024-04-22 09:22:38 +0000


import Cuckoo
@testable import simple_mvvmc_rx_api

import UIKit






 class MockJokeListCoordinator: JokeListCoordinator, Cuckoo.ClassMock {
    
     typealias MocksType = JokeListCoordinator
    
     typealias Stubbing = __StubbingProxy_JokeListCoordinator
     typealias Verification = __VerificationProxy_JokeListCoordinator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: JokeListCoordinator?

     func enableDefaultImplementation(_ stub: JokeListCoordinator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return cuckoo_manager.getter("childCoordinators",
                superclassCall:
                    
                                    super.childCoordinators
                    ,
                defaultCall:  __defaultImplStub!.childCoordinators)
        }
        
        set {
            cuckoo_manager.setter("childCoordinators",
                value: newValue,
                superclassCall:
                    
                    super.childCoordinators = newValue
                    ,
                defaultCall: __defaultImplStub!.childCoordinators = newValue)
        }
        
    }
    
    
    
    
    
     override var navigationController: UINavigationController {
        get {
            return cuckoo_manager.getter("navigationController",
                superclassCall:
                    
                                    super.navigationController
                    ,
                defaultCall:  __defaultImplStub!.navigationController)
        }
        
        set {
            cuckoo_manager.setter("navigationController",
                value: newValue,
                superclassCall:
                    
                    super.navigationController = newValue
                    ,
                defaultCall: __defaultImplStub!.navigationController = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func start()  {
        
    return cuckoo_manager.call(
    """
    start()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.start()
                ,
            defaultCall: __defaultImplStub!.start())
        
    }
    
    
    
    
    
     override func showJokeDetail(jokeID: Int)  {
        
    return cuckoo_manager.call(
    """
    showJokeDetail(jokeID: Int)
    """,
            parameters: (jokeID),
            escapingParameters: (jokeID),
            superclassCall:
                
                super.showJokeDetail(jokeID: jokeID)
                ,
            defaultCall: __defaultImplStub!.showJokeDetail(jokeID: jokeID))
        
    }
    
    

     struct __StubbingProxy_JokeListCoordinator: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var childCoordinators: Cuckoo.ClassToBeStubbedProperty<MockJokeListCoordinator, [Coordinator]> {
            return .init(manager: cuckoo_manager, name: "childCoordinators")
        }
        
        
        
        
        var navigationController: Cuckoo.ClassToBeStubbedProperty<MockJokeListCoordinator, UINavigationController> {
            return .init(manager: cuckoo_manager, name: "navigationController")
        }
        
        
        
        
        
        func start() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockJokeListCoordinator.self, method:
    """
    start()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func showJokeDetail<M1: Cuckoo.Matchable>(jokeID: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: jokeID) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockJokeListCoordinator.self, method:
    """
    showJokeDetail(jokeID: Int)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_JokeListCoordinator: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var childCoordinators: Cuckoo.VerifyProperty<[Coordinator]> {
            return .init(manager: cuckoo_manager, name: "childCoordinators", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var navigationController: Cuckoo.VerifyProperty<UINavigationController> {
            return .init(manager: cuckoo_manager, name: "navigationController", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func start() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    start()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func showJokeDetail<M1: Cuckoo.Matchable>(jokeID: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: jokeID) { $0 }]
            return cuckoo_manager.verify(
    """
    showJokeDetail(jokeID: Int)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class JokeListCoordinatorStub: JokeListCoordinator {
    
    
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Coordinator]).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var navigationController: UINavigationController {
        get {
            return DefaultValueRegistry.defaultValue(for: (UINavigationController).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func start()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func showJokeDetail(jokeID: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: simple-mvvmc-rx-api/NetworkClient/NetworkClient.swift at 2024-04-22 09:22:38 +0000


import Cuckoo
@testable import simple_mvvmc_rx_api

import RxSwift






 class MockNetworkClient: NetworkClient, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkClient
    
     typealias Stubbing = __StubbingProxy_NetworkClient
     typealias Verification = __VerificationProxy_NetworkClient

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkClient?

     func enableDefaultImplementation(_ stub: NetworkClient) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func fetchData<T: Decodable>(from urlString: String) -> Observable<T> {
        
    return cuckoo_manager.call(
    """
    fetchData(from: String) -> Observable<T>
    """,
            parameters: (urlString),
            escapingParameters: (urlString),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchData(from: urlString))
        
    }
    
    

     struct __StubbingProxy_NetworkClient: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetchData<M1: Cuckoo.Matchable, T: Decodable>(from urlString: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<T>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: urlString) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockNetworkClient.self, method:
    """
    fetchData(from: String) -> Observable<T>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_NetworkClient: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func fetchData<M1: Cuckoo.Matchable, T: Decodable>(from urlString: M1) -> Cuckoo.__DoNotUse<(String), Observable<T>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: urlString) { $0 }]
            return cuckoo_manager.verify(
    """
    fetchData(from: String) -> Observable<T>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class NetworkClientStub: NetworkClient {
    

    

    
    
    
    
     func fetchData<T: Decodable>(from urlString: String) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
    
}





// MARK: - Mocks generated from file: simple-mvvmc-rx-api/Repository/ContentRepository.swift at 2024-04-22 09:22:38 +0000


import Cuckoo
@testable import simple_mvvmc_rx_api

import RxSwift






 class MockContentRepository: ContentRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = ContentRepository
    
     typealias Stubbing = __StubbingProxy_ContentRepository
     typealias Verification = __VerificationProxy_ContentRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ContentRepository?

     func enableDefaultImplementation(_ stub: ContentRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func fetchJokeList() -> Observable<[Joke]> {
        
    return cuckoo_manager.call(
    """
    fetchJokeList() -> Observable<[Joke]>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchJokeList())
        
    }
    
    
    
    
    
     func fetchJoke(id: Int) -> Observable<Joke> {
        
    return cuckoo_manager.call(
    """
    fetchJoke(id: Int) -> Observable<Joke>
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchJoke(id: id))
        
    }
    
    

     struct __StubbingProxy_ContentRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetchJokeList() -> Cuckoo.ProtocolStubFunction<(), Observable<[Joke]>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockContentRepository.self, method:
    """
    fetchJokeList() -> Observable<[Joke]>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchJoke<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<Joke>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockContentRepository.self, method:
    """
    fetchJoke(id: Int) -> Observable<Joke>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ContentRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func fetchJokeList() -> Cuckoo.__DoNotUse<(), Observable<[Joke]>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchJokeList() -> Observable<[Joke]>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func fetchJoke<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<(Int), Observable<Joke>> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    fetchJoke(id: Int) -> Observable<Joke>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ContentRepositoryStub: ContentRepository {
    

    

    
    
    
    
     func fetchJokeList() -> Observable<[Joke]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Joke]>).self)
    }
    
    
    
    
    
     func fetchJoke(id: Int) -> Observable<Joke>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Joke>).self)
    }
    
    
}




