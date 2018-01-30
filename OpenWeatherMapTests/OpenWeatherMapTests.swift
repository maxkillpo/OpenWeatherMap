//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Varodom Nualplub on 1/30/18.
//  Copyright © 2018 creativeme. All rights reserved.
//

import XCTest
import RxSwift
@testable import OpenWeatherMap

class OpenWeatherMapTests: XCTestCase {

    func testExample() {
        let exec = expectation(description: "Max")
        _ = WeatherService().callService(request: WeahterRequestModel.init(id: "1609350", cnt: "7"))
            .subscribe(onNext: { response in
                print(response.toJSON())
                exec.fulfill()
            }, onError: { error in

            })

        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
