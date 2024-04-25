import UIKit
import RxSwift

class JokeListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: JokeListViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: JokeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchJokeList()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Jokes"
        collectionView.delegate = self
        collectionView.registerCells(withIdentifiers: JokeListItemCell.className)
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
                    strongSelf.showErrorAlert(message: error.localizedDescription)
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.jokeList
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(
                cellIdentifier: JokeListItemCell.className,
                cellType: JokeListItemCell.self)
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

                strongSelf.viewModel.showJokeDetail(jokeID: selectedJokeID)
            })
            .disposed(by: disposeBag)
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
        return JokeListItemCell.getSize(
            jokeSetupText: joke.setup,
            jokePunchlineText: joke.punchline
        )
    }
}
