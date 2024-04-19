import RxSwift

protocol NetworkClient {
    func fetchData<T: Decodable>(from urlString: String) -> Observable<T>
}
