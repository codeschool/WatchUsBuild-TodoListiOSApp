//
//  NotesTableViewController.m
//  NoteBook
//
//  Created by Jon Friskics on 8/4/15.
//  Copyright (c) 2015 Code School. All rights reserved.
//

#import "NotesTableViewController.h"
#import "Note.h"
#import "AddNoteViewController.h"

@interface NotesTableViewController () <AddNoteViewControllerDelegate>

@property (copy, nonatomic) NSArray *notes;

@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NoteCell"];
    
    if([Note readNotesFromFile] == nil) {
        self.notes = @[];
    } else {
        self.notes = [Note readNotesFromFile];
    }
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
    
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonTapped:)];
    
    self.navigationItem.leftBarButtonItem = addButton;
    self.navigationItem.rightBarButtonItem = deleteButton;
}

- (void)addButtonTapped:(id)sender {
    AddNoteViewController *addNoteVC = [[AddNoteViewController alloc] initWithNibName:@"AddNoteViewController" bundle:[NSBundle mainBundle]];
    addNoteVC.delegate = self;
    
    [self presentViewController:addNoteVC animated:YES completion:nil];
}

- (void)deleteButtonTapped:(id)sender {
    // somehow delete archive!
    [Note removeArchiveFile];
    
    self.notes = nil;
    [self.tableView reloadData];
}

- (void)saveNote:(Note *)note {
    NSLog(@"saveNote called: %@",note.noteText);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSMutableArray *mutableNotes = [[NSMutableArray alloc] initWithArray:self.notes];
    [mutableNotes addObject:note];
    self.notes = [mutableNotes copy];
    
    [Note saveNotesToFile:self.notes];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    Note *note = self.notes[indexPath.row];
    
    cell.textLabel.text = note.noteText;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end
