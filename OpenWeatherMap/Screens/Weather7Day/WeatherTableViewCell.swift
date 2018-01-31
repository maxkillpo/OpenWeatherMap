import RxSwift
import RxCocoa
import Service

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var time: UILabel!

    func setup(model: MapListModel) {
        tempLabel.text = displayTemp(temp: model.main?.temp)
        humidityLabel.text = displayHumidity(humidity: model.main?.humidity)
        time.text = model.dt_txt ?? "-"
    }

    func displayTemp(temp: Double?) -> String {
        return Calculate.shareInstance.calculateKelvinToCessasius(temp: temp)
    }

    func displayHumidity(humidity: Int?) -> String {
        return Calculate.shareInstance.validateHumidity(humidity: humidity)
    }
}
