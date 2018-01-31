import RxSwift
import RxCocoa
import Service

class CurrentWeatherViewController: BaseViewController<CurrentWeatherViewModel> {

    @IBOutlet weak var changeuUnitsButton: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var searchCitiesTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pleasureLabel: UILabel!
    @IBOutlet weak var showImageVIew: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
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
                        return Observable.just(WeahterResponseModel().isError())}
            }
            .asDriver(onErrorJustReturn: WeahterResponseModel().isError())

        search.map { self.viewModel.displayTemp(temp: $0.list?[0].main?.temp) }
            .drive(temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { self.viewModel.displayHumidity(humidity: $0.list?[0].main?.humidity) }
            .drive(pleasureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.city?.name ?? "No City") }
            .drive(countryLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.message ?? "") }
            .drive(errorLabel.rx.text)
            .disposed(by: disposeBag)

        let running = Observable
            .from([
                searchInput.map { _ in true },
                search.map { _ in false }.asObservable()
                ])
            .merge()
            .startWith(true)
            .asDriver(onErrorJustReturn: false)

        running
            .skip(1)
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)


        let pages2ButtonInput = page2Button
            .rx
            .controlEvent(.touchUpInside)
            .asObservable()
            .map { self.searchCitiesTextField.text }
            .asDriver(onErrorJustReturn: "")

        let pages2 = pages2ButtonInput
            .map { text in
                self.performSegue(withIdentifier: Segue.weather7Day) { (segue) in
                    let vc = segue.destination as? Weather7DayViewController
                    vc?.cityName = text ?? "0"
                }
            }
            .asDriver()

        pages2
            .drive()
            .disposed(by: disposeBag)
    }
}
