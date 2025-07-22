//
//  SearchCityViewModelTests.swift
//  FigmaCloneTests
//
//  Created by Alkit Gupta on 22/07/25.
//

import Foundation
import XCTest
@testable import FigmaClone

class SearchCityViewModelTests: XCTestCase {

    var viewModel: SearchCityViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SearchCityViewModel()
    }

    override func tearDown() {
        super.tearDown()
        AppStorageManager.shared.remove("selectedCity")
        viewModel = SearchCityViewModel()
    }

    func testInitialState() {
        XCTAssertNil(viewModel.cityNameModelDetails)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testLoadCityData_setsLoading_andUpdatesData() {
        let expectation = self.expectation(description: "City data loaded")

        viewModel.loadCityData(query: "Hyderabad")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertNotNil(self.viewModel.cityNameModelDetails)
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2.0, handler: nil)
    }

    func testSaveSearchResult_savesDataToAppStorage() {
        let testCity = CityNameModel(name: "Delhi", localNames: nil, lat: 0.0, lon: 0.0, country: "India", state: "")
        viewModel.saveSearchResult(data: testCity)

        let loadedCity = AppStorageManager.shared.load("selectedCity", as: CityNameModel.self)
        XCTAssertEqual(loadedCity?.first?.name, "Delhi")
    }

    func testLoadPreviousData_returnsSavedCity() {
        let testCity = CityNameModel(name: "Delhi", localNames: nil, lat: 0.0, lon: 0.0, country: "", state: "")
        AppStorageManager.shared.save(testCity, forKey: "selectedCity")

        let previousData = viewModel.loadPreviousData()
        XCTAssertNotNil(previousData)
        XCTAssertEqual(previousData?.first?.name, "Delhi")
    }

    func testLoadPreviousData_returnsNilIfNoData() {
        let data = viewModel.loadPreviousData()
        XCTAssertNil(data)
    }
}
