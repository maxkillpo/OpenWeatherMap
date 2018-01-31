import RxSwift
import RxCocoa
import Service

class Weather7DayViewController: BaseViewController<Weather7DayViewModel> {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameCityLabel: UILabel!
    var cityName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = Weather7DayViewModel()

        let items = viewModel
            .requestWeather(cityID: cityName)
        
        let nameCity = items
            .map { $0.city?.name ?? "No City" }
            .asDriver(onErrorJustReturn: "")

        nameCity
            .drive(nameCityLabel.rx.text)
            .disposed(by: disposeBag)

        let itemsList = items
            .map { $0.list ?? [MapListModel()] }
            .catchErrorJustReturn([])

        itemsList
            .bind(to: tableView
                .rx
                .items(cellIdentifier: "WeatherTableViewCell",
                       cellType: WeatherTableViewCell.self))
            { (row,element,cell) in
                cell.tempLabel.text = String(element.main?.temp ?? 0.0) + " C"
                cell.humidityLabel.text = String(element.main?.humidity ?? 0) + " %"
                cell.time.text = element.dt_txt ?? "-"
            }
            .disposed(by: disposeBag)
    }
}

