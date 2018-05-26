//
//  HeatWavesTests.swift
//  HeatWavesTests
//
//  Created by Sven Titgemeyer on 20.05.18.
//  Copyright © 2018 Cocoaheads Aachen. All rights reserved.
//

import XCTest
@testable import HeatWaves

class HeatWavesTests: XCTestCase {
    
    let positiveExamples = [[30, 29, 30, 29, 41],
                            [1, 1, 25, 30, 25, 30, 25, 25, 25, 25, 25, 25, 25, 25, 40, 1, 1],
                            [31, 34, 34, 20, 34, 28, 28, 23, 27, 31, 33, 34, 29, 24, 33, 32, 21, 34, 30, 21, 29, 22, 31, 23, 26, 32, 29, 32, 24, 27],
                            [26, 29, 22, 22, 31, 31, 27, 28, 32, 23, 33, 25, 31, 33, 34, 30, 23, 26, 21, 28, 32, 22, 30, 34, 26, 33, 20, 27, 33],
                            [20, 31, 20, 29, 29, 33, 34, 33, 20],
                            [25, 26, 34, 34, 41, 28, 32, 30, 34, 23, 26, 33, 30, 22, 30, 33, 24, 20, 27, 23, 30, 23, 34, 20, 23, 20, 33, 20, 28],
                            [34, 23, 31, 34, 34, 30, 29, 31, 29, 21, 25, 31, 30, 29, 29, 28, 21, 29, 33, 25, 24, 30],
                            [22, 31, 23, 23, 26, 21, 22, 20, 20, 28, 24, 28, 25, 31, 31, 26, 33, 31, 27, 29, 30, 30],
                            [26, 29, 25, 30, 32, 28, 26, 26, 33, 20, 21, 32, 28, 28, 20, 34, 34],
                            [34, 33, 29, 26, 34, 32, 27, 26, 22],
                            [30, 31, 23, 21, 30, 27, 32, 30, 34, 29, 21, 31, 31, 31, 32, 27, 30, 26, 21, 34, 29, 33, 24, 24, 32, 27, 32],
                            [25, 33, 33, 25, 24, 27, 34, 31, 29, 31, 27, 23]]
    
    let negativeExamples = [[30],
                            [29, 29, 29, 47, 30],
                            [31, 29, 29, 28, 24, 23, 29, 29, 26, 27, 33, 20, 26, 26, 20, 30],
                            [23, 31, 29, 26, 30, 24, 29, 29, 25, 27, 24, 28, 22, 20, 34, 22, 32, 24, 33],
                            [23, 24, 25, 20, 24, 34, 28, 32, 22, 20, 24],
                            [24, 28, 21, 34, 34, 25, 24, 33, 23, 20, 32, 26, 29, 29, 25, 20, 30, 24, 23, 21, 27],
                            [26, 34, 21, 32, 32, 30, 32, 21, 34, 21, 34, 31, 23, 27, 26, 32],
                            [29, 24, 22, 27, 22, 25, 29, 26, 24, 24, 20, 25, 20, 20, 24, 20],
                            [23, 33, 22, 32, 30],
                            [28, 21, 22, 33, 22, 26, 30, 28, 26, 23, 31, 22, 31, 25, 27, 27, 25, 28],
                            [27, 23, 42, 23, 22, 28],
                            [25, 20, 30, 29, 32, 25, 22, 21, 31, 22, 23, 25, 22, 31, 23, 25, 33, 23]]
    
    func testPositive0() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[0]))
    }
    
    func testPositive1() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[1]))
    }
    
    func testPositive2() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[2]))
    }
    
    func testPositive3() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[3]))
    }
    
    func testPositive4() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[4]))
    }
    
    func testPositive5() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[5]))
    }
    
    func testPositive6() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[6]))
    }
    
    func testPositive7() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[7]))
    }
    
    func testPositive8() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[8]))
    }
    
    func testPositive9() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[9]))
    }
    
    func testPositive10() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[10]))
    }
    
    func testPositive11() {
        XCTAssertTrue(isHeatWaveIncludedIn(positiveExamples[11]))
    }
    
    func testNegative0() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[0]))
    }
    
    func testNegative1() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[1]))
    }
    
    func testNegative2() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[2]))
    }
    
    func testNegative3() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[3]))
    }
    
    func testNegative4() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[4]))
    }
    
    func testNegative5() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[5]))
    }
    
    func testNegative6() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[6]))
    }
    
    func testNegative7() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[7]))
    }
    
    func testNegative8() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[8]))
    }
    
    func testNegative9() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[9]))
    }
    
    func testNegative10() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[10]))
    }
    
    func testNegative11() {
        XCTAssertFalse(isHeatWaveIncludedIn(negativeExamples[11]))
    }
}
