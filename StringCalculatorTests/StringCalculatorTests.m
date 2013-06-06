//
//  StringCalculatorTests.m
//  StringCalculatorTests
//
//  Created by Hieu Gia on 6/5/13.
//  Copyright (c) 2013 Hieu Gia. All rights reserved.
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorTests)
describe(@"StringCalculator test", ^{
    __block StringCalculator *strCal;
    
    beforeEach(^{
        strCal = [[StringCalculator alloc] init];
    });
    
    afterEach(^{
        strCal = nil;
    });
    
    context(@"Create a string calculator", ^{
        it(@"empty string return 0", ^{
            int result = [strCal add:@""];
            [[theValue(result) should] equal:theValue(0)];
        });
        
        it(@"add number 0", ^{
            int result = [strCal add:@"0"];
            [[theValue(result) should] equal:theValue(0)];
        });
        
        it(@"add a string number", ^{
            int result = [strCal add:@"12"];
            [[theValue(result) should] equal:theValue(12)];
        });
    });
    
    context(@"add string unknown", ^{
        it(@"add string unknown number", ^{
            int result = [strCal add:@"1,2,3,4,5"];
            [[theValue(result) should] equal:theValue(15)];
        });
    });
    
    context(@"add new line character", ^{
        it(@"add a new character", ^{
            int result = [strCal add:@"2\n3\n5,6"];
            [[theValue(result) should] equal:theValue(16)];
        });
    });
    
    context(@"support diffirent character", ^{
        it(@"add a ; character", ^{
            int result = [strCal add:@"//;\n2;3"];
            [[theValue(result) should] equal:theValue(5)];
        });
        
        it(@"add a diffirent character", ^{
            int result = [strCal add:@"//$%\n2$%3"];
            [[theValue(result) should] equal:theValue(5)];
        });
    });
    
    context(@"negatives not allowed", ^{
        it(@"negative number", ^{
            int result = [strCal add:@"-1,-3,4,5"];
            [[theValue(result) should] equal:theValue(9)];
        });
    });
    
    context(@"number more than 1000", ^{
        it(@"reject number > 1000", ^{
            int result = [strCal add:@"//$\n2$1000$1002"];
            [[theValue(result) should] equal:theValue(2)];
        });
    });
    
});
SPEC_END