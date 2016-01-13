//
//  ViewController.m
//  My Fav People
//
//  Created by Buwaneka Galpoththawela on 10/1/15.
//  Copyright (c) 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import "ViewController.h"
#import "Persons.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic,strong) AppDelegate  *appDelegate;
@property (nonatomic,strong) NSManagedObjectContext *manageObjectContext;
@property (nonatomic,strong) NSArray                  *personArray;
@property   (nonatomic,weak) IBOutlet UITableView  *personsTableview;
//@property (nonatomic,strong) NSArray              *timerArray;

@end

@implementation ViewController

#pragma - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _personArray.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
UITableViewCell *basicCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    Persons *currentPerson = _personArray[indexPath.row];
    basicCell.textLabel.text = currentPerson.personFirstName;
    return basicCell;
}


-(IBAction)editButtonPressed:(id)sender{
    [_personsTableview setEditing:!_personsTableview.isEditing];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Going to delete %li",indexPath.row);
        Persons *personToDelete = _personArray[indexPath.row];
        [_manageObjectContext deleteObject:personToDelete];
        [_appDelegate saveContext];
        _personArray = [self fetchPersons];
        [_personsTableview reloadData];
        
    }
}

#pragma - Interactive Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *destcontroller = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"segueEditPerson"]) {
        NSIndexPath *indexPath = [_personsTableview indexPathForSelectedRow];
        Persons *currentPerson = _personArray[indexPath.row];
        destcontroller.currentPerson = currentPerson;
    
    }else if ([[segue identifier] isEqualToString:@"segueAddPerson"]){
        destcontroller.currentPerson = nil;
    }
    

}



#pragma - Core Data Methods


-(IBAction)addRecors:(id)sender{
    Persons *newPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_manageObjectContext];
    newPerson.personFirstName = @"Jack";
    newPerson.personLastName = @"Per";
    newPerson.personRole = @"Boss";
    newPerson.personAddressStreet = @"12 Caps Street";
    newPerson.personAddressState = @"MD";
}



-(NSArray *)fetchPersons {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:_manageObjectContext];
    [fetchRequest setEntity:entity];


    NSArray *fetchResults = [_manageObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchResults;
    

}


#pragma - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _manageObjectContext = _appDelegate.managedObjectContext;
    //[self tempAddRecords];
    _personArray = [self fetchPersons];
}

    
-(void)viewWillAppear:(BOOL)animated{
        [super viewWillAppear:animated];
        _personArray = [self fetchPersons];
        [_personsTableview reloadData];
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
