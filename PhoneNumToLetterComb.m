//
//  PhoneNumToLetterComb.m
//  Zymo
//
//  Created by TEO_Abdul on 25/03/2013.
//  Copyright (c) 2013 TEO International. All rights reserved.
//

#import "PhoneNumToLetterComb.h"

@implementation PhoneNumToLetterComb

- (id) init
{
    self = [super init];
    if (self) {
        mappings = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"1",
                    @"ABC", @"2",
                    @"DEF", @"3",
                    @"GHI", @"4",
                    @"JKL", @"5",
                    @"MNO", @"6",
                    @"PQRS", @"7",
                    @"TUV", @"8",
                    @"WXYZ", @"9",
                    @"", @"0",
                    nil];
    }
    return self;
}

- (NSArray*) letterCombinationsFor: (NSString*) digits {
    
    if ([digits hasPrefix:@"0"] || [digits hasPrefix:@"1"]) {
        return nil;
    }

    NSMutableArray* letterCombinations = [NSMutableArray array];
    [self recursion:digits start:0 letterComb:[NSString string] letterCombinations:letterCombinations];
    return [NSArray arrayWithArray:letterCombinations];
}

- (void)recursion :(NSString*) digits start:(NSInteger)start letterComb:(NSString*)letterComb letterCombinations: (NSMutableArray*)letterCombinations {
    
//    NSLog(@"sol: %@, sol.length: %d, digits.length: %d",sol, sol.length, digits.length);
    if (letterComb.length > digits.length) {
        return;
    }
    else if (letterComb.length == digits.length) {
        [letterCombinations addObject:letterComb];
    }
    else {
        for (int i=start; i<digits.length; ++i) {
            NSString* letters = [mappings objectForKey:[NSString  stringWithFormat:@"%c",[digits characterAtIndex:i]]];
            for (int j=0; j<letters.length; ++j) {
                [self recursion:digits start:i+1 letterComb:[NSString stringWithFormat:@"%@%c", letterComb, [letters characterAtIndex:j]] letterCombinations:letterCombinations];
            }
        }
    }
}

- (void)dealloc {
    [mappings release];
    [super dealloc];
}
@end
