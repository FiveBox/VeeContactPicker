//
//  Created by Andrea Cipriani on 14/03/16.
//  Copyright © 2016 Code Atlas SRL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VeeABDelegate.h"
@import AddressBook;

@interface VeeAddressBook : NSObject

@property (nonatomic,strong) id<VeeABDelegate> delegate;

- (instancetype)initWithVeeABDelegate:(id<VeeABDelegate>)delegate;
- (BOOL)askABPermissionsIfNeeded:(ABAddressBookRef)addressBookRef;

@end
