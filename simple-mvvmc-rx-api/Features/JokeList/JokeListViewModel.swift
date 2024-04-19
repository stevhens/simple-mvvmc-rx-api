import RxSwift
import RxCocoa

class JokeListViewModel {
    private let contentRepository: ContentRepository
    private let disposeBag = DisposeBag()
    
    let isLoading = BehaviorRelay<Bool>(value: false)
    let jokeList = BehaviorSubject<[Joke]>(value: [])
    let error = BehaviorRelay<Error?>(value: nil)
    
    init(contentRepository: ContentRepository = DefaultContentRepository()) {
        self.contentRepository = contentRepository
    }
    
    func fetchJokeList() {
        isLoading.accept(true)
        error.accept(nil)
        
        contentRepository.fetchJokeList()
            .subscribe(onNext: { [weak self] jokes in
                guard let strongSelf = self else { return }
                strongSelf.jokeList.onNext(jokes)
            }, onError: { [weak self] error in
                guard let strongSelf = self else { return }
                strongSelf.error.accept(error)
            }, onCompleted: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.isLoading.accept(false)
            })
            .disposed(by: disposeBag)
    }
}
