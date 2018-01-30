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

        search.map { self.calculateKelvinToCessasius(temp: $0.list?[0].main?.temp) }
            .drive(temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { self.validateHumidity(humidity: $0.list?[0].main?.humidity) }
            .drive(pleasureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.city?.name ?? "No City") }
            .drive(countryLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { String(describing: $0.message ?? "") }
            .drive(errorLabel.rx.text)
            .disposed(by: disposeBag)

        changeuUnitsButton
            .rx
            .controlEvent(.touchUpInside)
            .map { false }
            .asObservable()

    }

    func switchCalculate(int: Int,temp: Double?) -> String {
        switch int {
        case 1:
            return calculateKelvinToCessasius(temp: temp)
        case 2:
            return calculateKelvinToFahrenheit(temp: temp)
        default: return ""
        }
    }

    func calculateKelvinToCessasius(temp: Double?) -> String {
        guard let T = temp else {
            return "E"
        }
        return String((T - 273.15).rounded(toPlaces: 10)) + " C"
    }

    func calculateKelvinToFahrenheit(temp: Double?) -> String {
        guard let T = temp else {
            return "E"
        }
        return String(((T - 273.15) * 1.8000 + 32.00).rounded(toPlaces: 10)) + " F"
    }

    func validateHumidity(humidity: Int?) -> String {
        guard let H = humidity else {
            return "E"
        }
        return String(H) + " %"
    }
}
