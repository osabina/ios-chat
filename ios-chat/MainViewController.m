//
//  MainViewController.m
//  ios-chat
//
//  Created by Osvaldo Sabina on 7/15/14.
//  Copyright (c) 2014 Ozzie Sabina. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import "MessageCell.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *messageField;
- (IBAction)sendButton:(id)sender;

@property (strong, nonatomic) NSArray *messages;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization


    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //load personalized cell
    //registration process
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"MessageCell"];
    [self loadChatTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendButton:(id)sender {
    PFObject *message = [PFObject objectWithClassName:@"Message"];
    PFUser *currentUser = [PFUser currentUser];
    message[@"user"] = currentUser;
    message[@"text"] = self.messageField.text;

    [message saveInBackground];
}

//table view
//number of rows
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return the number of rows you want in this table view
    return [self.messages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    PFUser *user = self.messages[indexPath.row][@"user"];
    cell.usernameLabel.text = user[@"name"];
    cell.messageLabel.text =self.messages[indexPath.row][@"text"];

    return cell;
}

- (void)loadChatTable {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"user"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        self.messages = objects;
        [self.tableView reloadData];
    }];
    
   
}
@end
