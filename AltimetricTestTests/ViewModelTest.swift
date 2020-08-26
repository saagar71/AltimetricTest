//
//  ViewModelTest.swift
//  AltimetricTestTests
//
//  Created by Sagar Shinde on 23/08/20.
//  Copyright © 2020 Sagar Shinde. All rights reserved.
//

import XCTest
@testable import AltimetricTest

class ViewModelTest: XCTestCase {
    var expectation:XCTestExpectation = XCTestExpectation()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAlbum() {
        let vm = AlbumListViewModel(handler: NetworkRequestHandlerMock())
        var errorres:Error?
        vm.reqhandler.getAlbums { (error, albums) in
            errorres = error
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
        XCTAssertNil(errorres)
    }
}

class NetworkRequestHandlerMock : NetworkRequestHandler {
    var successtest = true
    override func getAlbums(completion:@escaping(Error?, [Result.Album]?)->()) {
        if successtest {
            completion(nil, nil)
        }
        else {
        }
    }
}
