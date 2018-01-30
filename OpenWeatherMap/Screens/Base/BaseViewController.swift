import RxSwift

class BaseViewController<ViewModel>: UIViewController {

    var viewModel: ViewModel!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
