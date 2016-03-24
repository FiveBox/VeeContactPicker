//
//  Created by Andrea Cipriani on 21/12/15.
//  Copyright © 2015 Code Atlas SRL. All rights reserved.
//

#import "VeeContact.h"
#import "VeeContactPickerViewController.h"
#import "VeeContactsForTestingFactory.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel* selectedContactLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showVeecontactPickerPressed:(id)sender
{
    VeeContactPickerViewController* veePickerVC = [self pickerWithAddressBookContacts];
    //VeeContactPickerViewController* veePickerVC = [self pickerWithRandomFakeVeeContacts];
    veePickerVC.contactPickerDelegate = self;
    [self presentViewController:veePickerVC animated:YES completion:nil];
}

- (VeeContactPickerViewController*)pickerWithAddressBookContacts
{
    return [[VeeContactPickerViewController alloc] initWithDefaultConfiguration];
}

- (VeeContactPickerViewController*)pickerWithRandomFakeVeeContacts
{
    NSArray<id<VeeContactProt> >* randomVeeContacts = [VeeContactsForTestingFactory createRandomVeeContacts:100];
    return [[VeeContactPickerViewController alloc] initWithVeeContacts:randomVeeContacts];
}

#pragma mark - VeeContactPickerDelegate

- (void)didSelectABContact:(id<VeeContactProt>)veeContact
{
    NSLog(@"Selected %@", veeContact);
    _selectedContactLabel.text = [NSString stringWithFormat:@"Last selected contact: %@", veeContact.displayName];
}

@end
