//
//  HackerNewsTests.swift
//  HackerNewsTests
//
//  Created by Marcos Garcia on 1/25/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest
@testable import HackerNews

class HackerNewsTests: XCTestCase {

    func test_News_Model_Should_Have_Valid_Data() {
        /// Given
        let mockDictionary = ["author":"Aatif Sumar",
                              "urlToImage":"https://i.ytimg.com/vi/YIXH2M23I8I/maxresdefault.jpg",
                              "title":"[Update: It's back] Snag a 43\" 4K smart Toshiba Fire TV for just $200, an all-time low - Android Police",
                              "description":"We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality",
                              "content":"We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality a… [+668 chars]"]
        
        
        let mockUrl = URL(string: "https://i.ytimg.com/vi/YIXH2M23I8I/maxresdefault.jpg")
        
        /// When
        let sut = News.init(information: mockDictionary)
        
        /// Then
        XCTAssertNotNil(sut, "News object should not be nel")
        XCTAssertEqual(sut?.author, "Aatif Sumar", "'author' should match")
        XCTAssertEqual(sut?.urlToImage, mockUrl, "image url should match")
        XCTAssertEqual(sut?.title, "[Update: It's back] Snag a 43\" 4K smart Toshiba Fire TV for just $200, an all-time low - Android Police", "title should match")
        XCTAssertEqual(sut?.description, "We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality", "description should match")
        XCTAssertEqual(sut?.content, "We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality a… [+668 chars]", "content should match")
    }
    
    func test_NewsFactory_Should_Return_Array_Of_News() {
        
        /// Given
        let sut = NewsFactory.shared()
        
        let mockDictionary = ["author":"Aatif Sumar",
                              "urlToImage":"https://i.ytimg.com/vi/YIXH2M23I8I/maxresdefault.jpg",
                              "title":"[Update: It's back] Snag a 43\" 4K smart Toshiba Fire TV for just $200, an all-time low - Android Police",
                              "description":"We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality",
                              "content":"We found a particularly tempting TV sale this Sunday — $200 for a Toshiba 43\" Fire TV. With HDR support, this 4K LED TV is a Fire TV Edition device, so you can bark commands across the living room. The TV is well-reviewed, with praises for the image quality a… [+668 chars]"]
        
        /// When
        let mockArray = [mockDictionary, mockDictionary, mockDictionary]
        
        /// Then
        XCTAssertNotNil(sut, "Factory should not be nil")
        XCTAssertNotNil(sut.makeNews(news: mockArray), "Factory should return array of news")
        XCTAssertEqual(sut.makeNews(news: mockArray)?.count, 3, "Number of elements created should match")
    }

}
