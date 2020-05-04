//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"
#import "Entry.h"


@interface EntryDetailViewController ()
#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UITextField *entryTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextView;
@end

@implementation EntryDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_entry){
        [self updateWith: _entry];
    }
}


#pragma mark - Actions

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender
{
    if (_entry) {
        [EntryController.shared updateEntry:_entry title:_entryTitleLabel.text bodyText:_entryBodyTextView.text];
    } else {
        [EntryController.shared addEntryWithTitle:_entryTitleLabel.text bodyText:_entryBodyTextView.text];
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    _entryTitleLabel.text = @"";
    _entryBodyTextView.text = @"";
}

#pragma mark - TextField Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:true];
    return true;
}

#pragma mark - Update Views
- (void)updateWith:(Entry *)entry
{
    _entryTitleLabel.text = entry.title;
    _entryBodyTextView.text = entry.bodyText;
}

@end
