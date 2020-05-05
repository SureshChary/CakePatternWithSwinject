//
//  SwinjectExampleTests.swift
//  SwinjectExampleTests
//
//  Created by pjapple on 2018/04/14.
//  Copyright © 2018 Multimeleon. All rights reserved.
//

import XCTest
@testable import SwinjectExample

class SwinjectExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Resolver.reset()
        DepedencyContainer.instance.register(depedency: ProductsRepository.self, implemenation: {
            TestProductsRepositoryImplementation()
        })
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGivenAProductTheProductsPriceWillBeFiveHundred() {
        let expectedPrice = 1500.0
        let viewModel = ProductViewModel()
        XCTAssertTrue(viewModel.products.fetchProducts().first?.price == expectedPrice)
        
    }
    
}
// TestProductsRepositoryImplementation is DI for test-cases
struct TestProductsRepositoryImplementation : ProductsRepository {
    func fetchProducts() -> [Product] {
        
        return [Product(name: "Adidas Sneakers", price: 1500.0), Product(name: "Nike Sneakers", price: 1000.0)]
    }
}
