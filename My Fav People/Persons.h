//
//  Persons.h
//  My Fav People
//
//  Created by Buwaneka Galpoththawela on 10/1/15.
//  Copyright (c) 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PhoneNumbers;

@interface Persons : NSManagedObject

@property (nonatomic, retain) NSString * personFirstName;
@property (nonatomic, retain) NSString * personLastName;
@property (nonatomic, retain) NSString * personRole;
@property (nonatomic, retain) NSString * personSkypeID;
@property (nonatomic, retain) NSString * personTwitterID;
@property (nonatomic, retain) NSString * personAddressStreet;
@property (nonatomic, retain) NSString * personAddressState;
@property (nonatomic, retain) NSString * personAddressZip;
@property (nonatomic, retain) NSDate * dateEntered;
@property (nonatomic, retain) NSDate * dateUpdated;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * personEmail;
@property (nonatomic, retain) NSSet *relationshipPersonPhoneNumbers;
@end

@interface Persons (CoreDataGeneratedAccessors)

- (void)addRelationshipPersonPhoneNumbersObject:(PhoneNumbers *)value;
- (void)removeRelationshipPersonPhoneNumbersObject:(PhoneNumbers *)value;
- (void)addRelationshipPersonPhoneNumbers:(NSSet *)values;
- (void)removeRelationshipPersonPhoneNumbers:(NSSet *)values;

@end
