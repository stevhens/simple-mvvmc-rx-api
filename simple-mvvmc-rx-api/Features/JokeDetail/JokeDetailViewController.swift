import UIKit
import RxSwift

class JokeDetailViewController: UIViewController {

    @IBOutlet weak var jokeSetupLabel: UILabel!
    @IBOutlet weak var jokePunchlineLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: JokeDetailViewModel
    private let disposeBag = DisposeBag()
    
    private let jokeID: Int
    
    init(viewModel: JokeDetailViewModel, jokeID: Int) {
        self.viewModel = viewModel
        self.jokeID = jokeID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchJoke(id: jokeID)
    }

    private func setupUI() {
        self.navigationItem.title = "Joke Detail"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
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
        
        viewModel.joke
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] joke in
                guard 
                    let strongSelf = self,
                    let joke = joke
                else { return }
                
                strongSelf.jokeSetupLabel.text = joke.setup
                strongSelf.jokePunchlineLabel.text = joke.punchline
            })
            .disposed(by: disposeBag)
    }
    
    @objc private func backButtonTapped() {
        viewModel.dismissPage()
    }
}
