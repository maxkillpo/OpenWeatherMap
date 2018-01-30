import RxSwift
import RxCocoa

class CurrentWeatherViewController: BaseViewController<CurrentWeatherViewModel> {

    @IBOutlet weak var changeuUnitsButton: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var searchCitiesTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pleasureLabel: UILabel!
    @IBOutlet weak var showImageVIew: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CurrentWeatherViewModel()

        let searchInput =
            searchCitiesTextField.rx
                .controlEvent(.editingChanged)
                .asObservable()
                .map { self.searchCitiesTextField.text }
                .filter { ($0 ?? "").count > 0 }

        let search = searchInput
            .debounce(RxTimeInterval(1.0), scheduler: MainScheduler.instance)
            .flatMap { text in
                return self
                    .viewModel
                    .requestWeather(cityID: text ?? "error")
                    .catchError { error in
                        return Observable
                            .just(WeahterResponseModel().isError())}
            }
            .asDriver(onErrorJustReturn: WeahterResponseModel().isError())

        search.map { String(describing: $0.list?[0].main?.temp) }
            .drive(temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.list?[0].main?.humidity) }
            .drive(pleasureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.city?.name) }
            .drive(countryLabel.rx.text)
            .disposed(by: disposeBag)

    }
}
