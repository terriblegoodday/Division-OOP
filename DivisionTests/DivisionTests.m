//
//  DivisionTests.m
//  DivisionTests
//
//  Created by Eduard Dzhumagaliev on 1/17/20.
//  Copyright © 2020 Eduard Dzhumagaliev. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "NSExceptionWrapper.m"
#include <utility>
#include "divlib.hpp"


@interface DivisionTests : XCTestCase

@end

@implementation DivisionTests

// MARK: - Tests for files

- (void)testNoFile {
    XCTAssertCppThrows(DivLib::readFloats("test0.txt"), NSException, @"Failed to read file. Please make sure your filename is right.");
};

- (void)testEmptyFile {
    XCTAssertCppThrows(DivLib::readFloats("test1.txt"), NSException, @"Failed to read float 1 from file. There should be two floats in input file.");
}

- (void)testOneFloatFile {
    XCTAssertCppThrows(DivLib::readFloats("test2.txt"), NSException, @"Failed to read float 2 from file. There should be two floats in input file.");
}

- (void)testBadFirstLine {
    XCTAssertCppThrows(DivLib::readFloats("test3.txt"), NSException, @"Failed to read float 1 from file. There should be two floats in input file.");
}

- (void)testBadSecondLine {
    XCTAssertCppThrows(DivLib::readFloats("test4.txt"), NSException, @"Failed to read float 2 from file. There should be two floats in input file.");
}

- (void)testSuccessfulRead {
    auto [a, b] = DivLib::readFloats("test5.txt");
    XCTAssertTrue(a == 3 && b == 2);
}

// MARK: - Tests for division

- (void)testDivisionByZero {
    XCTAssertCppThrows(DivLib::division(3.0f, 0.0f), NSException, @"Denominator shouldn't be equal to zero.");
}

- (void)testDivision {
    XCTAssertEqual(DivLib::division(3.0f, 2.0f), 1.5f);
}

- (void)testZeroDivision {
    XCTAssertEqual(DivLib::division(0.0f, 3.0f), 0.0f);
}

@end
