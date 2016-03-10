//
//  TestAKStudy.m
//  TestAKStudy
//
//  Created by Admin on 02.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AKAlphabet.h"

@interface TestAKStudy : XCTestCase
@property (nonatomic, retain) AKAlphabet    *alphabet;
@property (nonatomic, copy)   NSString      *string;

@end

@implementation TestAKStudy

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCasesAlphabet {
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with upper case letters");
    self.alphabet = [AKAlphabet upperCaseLettersAlphabet];
    NSLog(@"%@\n", self.alphabet.alphabetString);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 26);
    
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with lower case letters");
    self.alphabet = [AKAlphabet lowerCaseLettersAlphabet];
    NSLog(@"%@\n", self.alphabet.alphabetString);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 26);
    
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with numeric letters");
    self.alphabet = [AKAlphabet numericLettersAlphabet];
    NSLog(@"%@\n", self.alphabet.alphabetString);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 10);
}

- (void)testAlphabetWithRange {
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with range 'a' - 'z'");
    self.alphabet = [AKAlphabet alphabetWithCharactersRange:'a' lastValue:'z'];
    NSLog(@"AlphabetWithRange = %@\n", self.alphabet.alphabetString);
    NSLog(@"alphabet.count = %lu\n", self.alphabet.count);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 26);
}

- (void)testAlphabetWithString {
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with strig 'AaBbCcDdEe12345'");
    self.string = [NSString stringWithFormat:@"AaBbCcDdEe12345"];
    self.alphabet = [[[AKAlphabet alloc] initWithString:self.string] autorelease];
    NSLog(@"AlphabetWithString = %@\n", self.alphabet.alphabetString);
    NSLog(@"alphabet.count = %lu\n", self.alphabet.count);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 15);
}

- (void)testAlphabetWithAlphabets {
    AKAlphabet *uppercaseAlphabet = [AKAlphabet alphabetWithCharactersRange:'A' lastValue:'Z'];
    AKAlphabet *lowerAlphabet = [AKAlphabet lowerCaseLettersAlphabet];
    AKAlphabet *numericAlphabet = [AKAlphabet alphabetWithString:@"0123456789"];
    NSLog(@"-----------------------------------");
    NSLog(@"Creating alphabet with alphabets");
    self.alphabet = [AKAlphabet alphabetWithAlphabets:@[uppercaseAlphabet, lowerAlphabet, numericAlphabet]];
    NSLog(@"AlphabetCluster = %@\n", self.alphabet.alphabetString);
    NSLog(@"alphabet.count = %lu\n", self.alphabet.count);
    NSLog(@"-----------------------------------");
    XCTAssert(self.alphabet.count == 62);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
