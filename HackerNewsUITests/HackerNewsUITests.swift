//
//  HackerNewsUITests.swift
//  HackerNewsUITests
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class HackerNewsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }

    func test_NewsTable() {
        app.launch()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        
        let newsTable = app.tables.matching(identifier: "newsTableView")
        XCTAssertNotNil(newsTable, "Table with the news should exist")
    }
    
    func test_News_DetailView() {
        app.launch()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        
        let newsTable = app.tables.matching(identifier: "newsTableView")
        let cell = newsTable.cells.element(matching: .cell, identifier: "newsCell_8")
        cell.tap()
        
        XCTAssert(app.staticTexts["St. Louis Officer Charged in Fatal Russian Roulette Shooting of Another Officer, Authorities Say - The New York Times"].exists)
    }
    
    func test_News_DetailView_ComingBack() {
        app.launch()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        
        let newsTable = app.tables.matching(identifier: "newsTableView")
        let cell = newsTable.cells.element(matching: .cell, identifier: "newsCell_8")
        cell.tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertNotNil(newsTable, "Table with the news should exist")
    }
}
