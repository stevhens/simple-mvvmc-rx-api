import RxSwift
import RxCocoa

class JokeDetailViewModel {
    private let contentRepository: ContentRepository
    private let disposeBag = DisposeBag()
    
    let isLoading = BehaviorRelay<Bool>(value: false)
    let joke = BehaviorSubject<Joke?>(value: nil)
    let error = BehaviorRelay<Error?>(value: nil)
    
    init(contentRepository: ContentRepository = DefaultContentRepository()) {
        self.contentRepository = contentRepository
    }
    
    func fetchJoke(id: Int) {
        isLoading.accept(true)
        error.accept(nil)
        
        contentRepository.fetchJoke(id: id)
            .subscribe(onNext: { [weak self] joke in
                guard let strongSelf = self else { return }
                strongSelf.joke.onNext(joke)
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
