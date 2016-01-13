//
//  PhoneNumbers.h
//  My Fav People
//
//  Created by Buwaneka Galpoththawela on 10/1/15.
//  Copyright (c) 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persons;

@interface PhoneNumbers : NSManagedObject

@property (nonatomic, retain) NSString * phoneType;
@property (nonatomic, retain) NSString * phoneNumer;
@property (nonatomic, retain) Persons *relationshipPhoneNumberPerson;

@end
