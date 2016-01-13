//
//  DetailedTableViewCell.h
//  My Fav People
//
//  Created by Buwaneka Galpoththawela on 10/2/15.
//  Copyright (c) 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *contactDetailName;
@property(nonatomic,weak)  IBOutlet UITextField *contactDetailField;

@end
