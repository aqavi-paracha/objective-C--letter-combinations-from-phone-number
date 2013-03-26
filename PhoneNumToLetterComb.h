//
//  PhoneNumToLetterComb.h
//  Zymo
//
//  Created by TEO_Abdul on 25/03/2013.
//  Copyright (c) 2013 TEO International. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneNumToLetterComb : NSObject
{
    NSDictionary* mappings;
}

- (NSArray*) letterCombinationsFor: (NSString*) digits;

@end
