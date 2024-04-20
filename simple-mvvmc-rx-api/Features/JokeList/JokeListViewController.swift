import UIKit
import RxSwift

class JokeListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = JokeListViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchJokeList()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Jokes"
        collectionView.delegate = self
        collectionView.register(
            UINib(nibName: "JokeListCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "JokeListCell")
    }
    
    private func bindViewModel() {
        viewModel.isLoading
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                guard let strongSelf = self else { return }
                isLoading ? strongSelf.activityIndicator.startAnimating() : strongSelf.activityIndicator.stopAnimating()
            })
            .disposed(by: disposeBag)
        
        viewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                guard let strongSelf = self else { return }
                if let error = error {
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.jokeList
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(
                cellIdentifier: "JokeListCell",
                cellType: JokeListCollectionViewCell.self)
            ) { index, item, cell in
                cell.jokeSetupLabel.text = item.setup
                cell.jokePunchlineLabel.text = item.punchline
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard
                    let strongSelf = self,
                    let selectedJokeID = try? strongSelf.viewModel.jokeList.value()[safe: indexPath.row]?.id
                else { return }

                strongSelf.showJokeDetail(id: selectedJokeID)
            })
            .disposed(by: disposeBag)
    }
    
    private func showJokeDetail(id: Int) {
        let jokeDetailViewController = JokeDetailViewController(jokeID: id)
        navigationController?.pushViewController(jokeDetailViewController, animated: true)
    }
}

extension JokeListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let joke = try? viewModel.jokeList.value()[safe: indexPath.item] else {
            return .zero
        }
        return JokeListCollectionViewCell.getSize(
            jokeSetupText: joke.setup,
            jokePunchlineText: joke.punchline
        )
    }
}
