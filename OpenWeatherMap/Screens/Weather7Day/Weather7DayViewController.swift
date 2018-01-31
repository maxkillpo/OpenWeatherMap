import RxSwift
import RxCocoa
import Service

class Weather7DayViewController: BaseViewController<Weather7DayViewModel> {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameCityLabel: UILabel!
    var cityID = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = Weather7DayViewModel()

        let items = viewModel
            .requestWeather(cityID: cityID)
            .map { $0.list ?? [MapListModel]() }

        items
            .bind(to: tableView
                .rx
                .items(cellIdentifier: "WeatherTableViewCell",
                       cellType: WeatherTableViewCell.self))
            { (row,element,cell) in
                cell.tempLabel.text = String(element.main?.temp ?? 0.0)
                cell.humidityLabel.text = String(element.main?.humidity ?? 0)
            }
            .disposed(by: disposeBag)
    }
}

