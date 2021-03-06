//
//  CafeManager.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 28/09/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "CafeManager.h"
#import "Cafe.h"

@implementation CafeManager
- (void)insertCafe:(Cafe *)cafe {
    [self.cafes addObject: cafe];
}

- (void)removeCafe:(Cafe *)cafe {
    [self.cafes removeObject:cafe];
}
@end
