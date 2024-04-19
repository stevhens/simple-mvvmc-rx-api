import RxSwift

protocol ContentRepository {
    func fetchJokeList() -> Observable<[Joke]>
}
