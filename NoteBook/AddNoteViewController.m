//
//  AddNoteViewController.m
//  NoteBook
//
//  Created by Jon Friskics on 8/4/15.
//  Copyright (c) 2015 Code School. All rights reserved.
//

#import "AddNoteViewController.h"
#import "Note.h"

@interface AddNoteViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    Note *note = [[Note alloc] init];
    note.noteText = textField.text;
    
    [self.delegate saveNote:note];
    
    NSLog(@"textField text: %@", textField.text);
    
    return YES;
}

@end
