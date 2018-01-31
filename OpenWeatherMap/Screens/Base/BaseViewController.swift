import RxSwift

class BaseViewController<ViewModel>: UIViewController {

    var viewModel: ViewModel!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private var segueCompletion : ((UIStoryboardSegue) -> Void)?

    func performSegue(withIdentifier identifier: Segue, completion: @escaping (UIStoryboardSegue) -> Void) {
        self.segueCompletion = completion
        self.performSegue(withIdentifier: identifier.rawValue, sender: nil);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.segueCompletion?(segue)
    }
    
}

enum Segue: String {
    case weather7Day = "Weather7Day"
}
