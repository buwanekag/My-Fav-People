//
//  DetailViewController.m
//  My Fav People
//
//  Created by Buwaneka Galpoththawela on 10/2/15.
//  Copyright (c) 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Persons.h"
#import "DetailedTableViewCell.h"

@interface DetailViewController ()

@property (nonatomic,weak) IBOutlet UILabel *personFirstName;
@property (nonatomic,weak) IBOutlet UITextField *personNameField;
@property (nonatomic,weak) IBOutlet UITableView *personTableView;
@property (nonatomic,strong) AppDelegate  *appDelegate;
@property (nonatomic,strong) NSManagedObjectContext *manageObjectContext;


@end

@implementation DetailViewController




#pragma - Interactive Method

-(NSInteger)numberofSectionsinTableView:(UITableView *) tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

-(void) saveAndPop{
    [_appDelegate saveContext];
    [self.navigationController popToRootViewControllerAnimated:true];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    DetailedTableViewCell  *contactDetailCell = (DetailedTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"contactDetailCell"];
    if (indexPath.row == 0) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"First Name"];
        contactDetailCell.contactDetailField.text = _currentPerson.personFirstName;
    } else if (indexPath.row == 1) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Last Name"];
        contactDetailCell.contactDetailField.text = _currentPerson.personLastName;
    }else if (indexPath.row == 2) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Street Address"];
        contactDetailCell.contactDetailField.text = _currentPerson.personAddressStreet;
    }else if(indexPath.row == 3) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"State"];
        contactDetailCell.contactDetailField.text = _currentPerson.personAddressState;
    }else if (indexPath.row == 4) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Zipcode"];
        contactDetailCell.contactDetailField.text = _currentPerson.personAddressZip;
    }else if (indexPath.row == 5) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Role"];
        contactDetailCell.contactDetailField.text = _currentPerson.personRole;
    }else if (indexPath.row == 6) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Email"];
        contactDetailCell.contactDetailField.text = _currentPerson.personEmail;
    }else if (indexPath.row == 7) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Skype ID"];
        contactDetailCell.contactDetailField.text = _currentPerson.personSkypeID;
    }else if (indexPath.row == 8) {
        contactDetailCell.contactDetailName.text = [NSString stringWithFormat:@"Twitter ID"];
        contactDetailCell.contactDetailField.text = _currentPerson.personTwitterID;
    }
    
    return contactDetailCell;
    
}



-(IBAction)saveButtonPressed:(id)sender {
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    DetailedTableViewCell *cell0 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath0];
    _currentPerson.personFirstName  = cell0.contactDetailField.text;
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    DetailedTableViewCell *cell1 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath1];
    _currentPerson.personLastName   = cell1.contactDetailField.text;
   
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    DetailedTableViewCell *cell2 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath2];
    _currentPerson.personAddressStreet   = cell2.contactDetailField.text;
   
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:3 inSection:0];
    DetailedTableViewCell *cell3 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath3];
    _currentPerson.personAddressState   = cell3.contactDetailField.text;
    
    NSIndexPath *indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
    DetailedTableViewCell *cell4 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath4];
    _currentPerson.personAddressZip  = cell4.contactDetailField.text;
    NSIndexPath *indexPath5 = [NSIndexPath indexPathForRow:5 inSection:0];
    DetailedTableViewCell *cell5 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath5];
    _currentPerson.personRole   = cell5.contactDetailField.text;
    NSIndexPath *indexPath6 = [NSIndexPath indexPathForRow:6 inSection:0];
    DetailedTableViewCell *cell6 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath6];
    _currentPerson.personEmail   = cell6.contactDetailField.text;
    
    NSIndexPath *indexPath7 = [NSIndexPath indexPathForRow:7 inSection:0];
    DetailedTableViewCell *cell7 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath7];
    _currentPerson.personSkypeID   = cell7.contactDetailField.text;
    
    NSIndexPath *indexPath8 = [NSIndexPath indexPathForRow:8 inSection:0];
    DetailedTableViewCell *cell8 = (DetailedTableViewCell *)[_personTableView cellForRowAtIndexPath:indexPath8];
    _currentPerson.personTwitterID   = cell8.contactDetailField.text;

 
    
    [self saveAndPop];
}


#pragma - Life Cycle Method
- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _manageObjectContext = _appDelegate.managedObjectContext;
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_currentPerson !=  nil) {
        _personNameField.text = _currentPerson.personFirstName;
    } else {
        Persons *newPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_manageObjectContext];
        newPerson.dateEntered = [NSDate date];
        _currentPerson = newPerson;
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
